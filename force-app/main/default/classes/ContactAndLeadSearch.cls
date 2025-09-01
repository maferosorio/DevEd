public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(string searchQuery){
        
        List<List<sObject>> searchList = [FIND :searchQuery IN ALL FIELDS 
                   							RETURNING Contact(FirstName,LastName), Lead(FirstName,LastName)];
        
        return searchList;
    }
}