public class AccountHandler {
    
    public static Account insertNewAccount(String name){
        
        try {
            Account acct = new Account(Name= name);
            insert acct;
        	return acct;
            
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            return null;
        }
    }
}