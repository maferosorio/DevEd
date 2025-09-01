public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer returnedStrings){
        
        List<String> strings = new List<String>();
            
        for(Integer index = 0; index < returnedStrings; index++){
            strings.add('Test '+index);
        }
        return strings;
    }
}