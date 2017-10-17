/**
 * Created by Manjit Singh on 10 October 2017.
 */

public with sharing class CallMeBackInboundNotificationUtility {

    /*
    * This method checks if the number is valid
    * @param String Phone Number
    * @return Returns if the number is valid or not.
     */
    public Boolean checkIfNumberIsValid(String strPhoneNumber) {
        Pattern objNumericPattern = Pattern.compile('\\+[0-9]{1,2}[0-9]{10}'); // Checks for 9 digit nuber with country code
        if (String.isNotBlank(strPhoneNumber)) {
            Matcher objMatcher = objNumericPattern.matcher(strPhoneNumber);
            if (objMatcher.matches()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false ;
        }
    }

    /*
    * This method checks if the number is blocked or not
    * @param String Phone Number
    * @return Returns if the number is blocked or not.
    */
    public Boolean checkIfNumberIsBlocked(String strPhoneNumber) {
        return [SELECT count() from Contact where Is_Blocked__c = true AND Phone = :strPhoneNumber] != 0;
    }

    /*
    * This creates a case
    * @param idContactId
    * @param idCallerId
    */
    public void createCase(Id idContactId, Id idCallerId, String strProduct, String strLocation) {
        insert new Case(ContactId = idContactId, Caller__c = idCallerId, Subject = strProduct, Caller_Location__c = strLocation);

    }

    /*
    * This creates calling number record
    * @return Created Calling record
    */
    public CGTC_CallingNumber__c createCallingRecord(String strCallerName, String strPhoneNumber, String strPageUrl, Decimal decLatitude, Decimal decLongitude, String strProduct) {
        CGTC_CallingNumber__c objCall = new CGTC_CallingNumber__c();
        objCall.Caller_Location__Latitude__s = decLatitude;
        objCall.Caller_Location__Longitude__s = decLongitude;
        objCall.Caller_Name__c = fetchCallingContact(strPhoneNumber, strCallerName);
        objCall.Page_URL__c = strPageUrl;
        objCall.Product_Of_Interest__c = strProduct;
        insert objCall;
        return objCall;
    }

    /*
    * This creates calling number record
    * @return Created Contact Id
    */
    public Id fetchCallingContact(String strPhoneNumber, String strName) {
        List<Contact> lstContacts = [SELECT Id, Name from Contact where Phone = :strPhoneNumber LIMIT 1];
        if (lstContacts.size() > 0) {
            return lstContacts[0].Id;
        } else {
            Contact objContact = new Contact(LastName = strName, Phone = strPhoneNumber);
            insert objContact;
            return objContact.Id;
        }
    }


}