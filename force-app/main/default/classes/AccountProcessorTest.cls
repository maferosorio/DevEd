@isTest
public class AccountProcessorTest {
    @isTest
    public static void TestAccountProcessorTest(){
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;

        Contact cont = New Contact();
        cont.FirstName ='Fer';
        cont.LastName ='Osorio';
        cont.AccountId = a.Id;
        Insert cont;
        
        List<Id> accId = new List<ID>();
        accId.add(a.id);
 
        Test.startTest();
            AccountProcessor.countContacts(accId);
        Test.stopTest();
        
        Account account = [select Number_of_Contacts__c from Account where id = :a.id];
        System.assertEquals(1, account.Number_of_Contacts__c);
  }
  
}