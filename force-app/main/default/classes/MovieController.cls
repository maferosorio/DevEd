public with sharing class MovieController {
    public class MovieInput {
        @InvocableVariable(required=true)
        public String MovieTitle;
    }

    @InvocableMethod(Label ='OMBd Fetch' description='Request to the OMBd API')
    public static List<MovieOutput> getMovie(List<MovieInput> movieTitles){
        system.debug(movieTitles);

        // Iterates throw the number of inputs that the bot recibed from the user/users
        Set<String> movies = new Set<String>();
        system.debug(movieTitles);
        for (MovieInput title : movieTitles) {
            movies.add(title.MovieTitle);
            system.debug(movies);
            system.debug(title);
        }


        List<MovieOutput> movieInfo = new List<MovieOutput>();
        // Callout Response
        for(String movie : movies){
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            String endpoint = 'https://www.omdbapi.com/?t=' + movie + '&apikey=835e12a';
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json');
            //request.setHeader('Accept', 'application/json');
            request.setTimeout(30000);
            
            HttpResponse response = http.send(request);
                        
            if (response.getStatusCode() == 200) {
                system.debug('response.getStatusCode(): '+ response.getStatusCode());
                system.debug('response: '+ response.getBody());
            
                MovieOutput movieOutput = (MovieOutput) System.JSON.deserialize(response.getBody(), MovieOutput.class);
                system.debug('MovieOutput: '+ movieOutput);
                movieInfo.add(movieOutput);
                
            } else {
                system.debug('error: '+ response.getBody());
            }
        }
        return movieInfo;
    }
     public class MovieOutput {
        @InvocableVariable(required=true)
        public String Title;
        @InvocableVariable(required=true)
        public String Year;
        @InvocableVariable(required=true)
        public String Runtime;
        @InvocableVariable(required=true)
        public String Genre;
        @InvocableVariable(required=true)
        public String Director;
        @InvocableVariable(required=true)
        public String Plot;
    }
    
}