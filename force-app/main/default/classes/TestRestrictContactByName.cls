@isTest
public class TestRestrictContactByName {
    @isTest static void TestCreateContactWithInvalidLastname(){
        
        Contact c = new Contact();
        c.FirstName = 'Fernanda';
        c.LastName = 'INVALIDNAME';
        
        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());
    }
    
    @isTest static void TestUpdateContactWithInvalidLastname(){
        
        Contact c = new Contact();
        c.FirstName = 'Fernanda';
        c.LastName = 'Osorio';
        insert c;
        
        c.LastName = 'INVALIDNAME';
        
        Test.startTest();
        Database.SaveResult result = Database.update(c, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());
    }
}