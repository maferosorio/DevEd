public class ContactSearch {
	
    public static List<Contact> searchForContacts(string lastname, string mailingPostalCode){
        
        List<Contact> contacts = [SELECT Name FROM Contact Where lastname = :lastname AND MailingPostalCode = :mailingPostalCode];
        
        return contacts;
    }
}