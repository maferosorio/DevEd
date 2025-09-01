public with sharing class CharacterController {
	public class CharacterInput {
        @InvocableVariable(required=true)
        public String characterName;
  	}
    
    public static Map<String, Integer> setCharacterIds(Map<String, Integer> characterMap){
        
        characterMap = new Map<String, Integer>();
        characterMap.put('Luke Skywalker',1);
        characterMap.put('C-3PO',2);
        characterMap.put('R2-D2',3);
        characterMap.put('Darth Vader',4);
        characterMap.put('Leia Organa',5);
        return characterMap;
    }

    @InvocableMethod(Label ='Do Callout' description='does a callout')
    public static List<CharacterOutput> getCharacter(List<CharacterInput> characterInputs){
        system.debug('characterInputs: '+characterInputs);
        
        Map<String, Integer> characterMap = new Map<String, Integer>();
        characterMap = setCharacterIds(characterMap);
        system.debug('characterMap: '+characterMap);
        //Get input names
       	Set<String> characters = new Set<String>();
        
        for (CharacterInput characterInput : characterInputs) {
            characters.add(characterInput.characterName);
        }
        
        List<CharacterOutput> details = new List<CharacterOutput>();
        //Get callout response
        for(String character: characters){
            system.debug('character: '+character);
            Integer characterId = characterMap.get(character);
            system.debug('characterId: '+characterId);    
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            String endpoint = 'https://swapi.dev/api/people/'+characterId;
            system.debug('endpoint: '+endpoint);
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Accept', 'application/json');
            
            HttpResponse response = http.send(request);
                        
            if (response.getStatusCode() == 200) {
                system.debug('response.getStatusCode(): '+response.getStatusCode());
                system.debug('response: '+response.getBody());
            
                CharacterOutput characterOutput = (CharacterOutput) System.JSON.deserialize(response.getBody(), CharacterOutput.class);
                system.debug('characterOutput: '+characterOutput);
                details.add(characterOutput);
                
            } else {
                system.debug('error: '+response.getBody());
            }
        }
            
        return details;
    }
    //wrapperClass
    public class CharacterOutput { 
		@InvocableVariable(required=true)
        public String name;
        @InvocableVariable(required=true)
        public String height;
        @InvocableVariable(required=true)
        public String mass;
        @InvocableVariable(required=true)
        public String hair_color;
        @InvocableVariable(required=true)
        public String skin_color;
        @InvocableVariable(required=true)
        public String eye_color;
        @InvocableVariable(required=true)
        public String birth_year;
        @InvocableVariable(required=true)
        public String gender;
        public String homeworld;
        public List<String> films;
        public List<String> vehicles;
        public List<String> starships;
        public String created;
        public String edited;
        public String url;
    }
}