public class AccountProcessor {

    @future
    public static void countContacts(List<Id> Ids){
        
        List<Account> lstAccount = [select id, Number_of_Contacts__c , (select id from contacts) from Account where id in :Ids];
      	
        for( Account acc : lstAccount ){
          	List<Contact> lstCont = acc.contacts ;
          
          	acc.Number_of_Contacts__c = lstCont.size();
      	}
      	update lstAccount;
    }
}