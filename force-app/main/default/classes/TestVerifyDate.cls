@isTest
public class TestVerifyDate {

    @isTest static void checkDate2IsLowerThanDate1(){
        
        Date date1 = Date.newInstance(2021, 08, 05);
        Date date2 = Date.newInstance(2021, 08, 01);
        Date returnedDate = VerifyDate.CheckDates(date1,date2);
        
        System.assertEquals(Date.newInstance(2021, 08, 31), returnedDate);
    }
    
    @isTest static void checkDate2IsGreaterThan30DaysAfterDate1(){
        
        Date date1 = Date.newInstance(2021, 08, 05);
        Date date2 = Date.newInstance(2021, 09, 10);
        Date returnedDate = VerifyDate.CheckDates(date1,date2);
        
        System.assertEquals(Date.newInstance(2021, 08, 31), returnedDate);
    }
    
    @isTest static void checkDate2IsNextTo30DaysAfterDate1(){
        
        Date date1 = Date.newInstance(2021, 08, 05);
        Date date2 = Date.newInstance(2021, 08, 15);
        Date returnedDate = VerifyDate.CheckDates(date1,date2);
        
        System.assertEquals(Date.newInstance(2021, 08, 15), returnedDate);
    }
}