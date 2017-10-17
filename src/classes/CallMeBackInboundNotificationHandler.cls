/**
 * Created by Manjit Singh on 10 October 2017.
 */

public without sharing class CallMeBackInboundNotificationHandler {

    //Page Variables
    public String strPhone { get; set; }
    public String strName { get; set; }
    public String strLatitude { get; set; }
    public String strLongitude { get; set; }
    public String strPageURL { get; set; }
    public String strProductOfInterest { get; set; }
    public String strLocation { get; set; }

    // Private Variables
    private CallMeBackInboundNotificationUtility utils = new CallMeBackInboundNotificationUtility();

    /*
    * This function creates a call contact record so that a representative can go ahead and call the client.
    */

    public void createCallerDetails() {
        if (String.isNotBlank(strPhone) && String.isNotBlank(strName) && String.isNotBlank(strPageURL)) {
            //Check if the number is not vaid or Blocked
            if (utils.checkIfNumberIsValid(strPhone) && !utils.checkIfNumberIsBlocked(strPhone)) {
                Id idCallingContact = utils.fetchCallingContact(strPhone, strName);
                CGTC_CallingNumber__c objCallingNumber = utils.createCallingRecord(strName, strPhone, strPageURL, Decimal.valueOf(strLongitude), Decimal.valueOf(strLongitude), strProductOfInterest);
                utils.createCase(idCallingContact, objCallingNumber.Id, strProductOfInterest,strLocation);
            }
        }
    }

    public void fetchAddress() {
        Http handler = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://nominatim.openstreetmap.org/reverse?format=json&lat=' + strLatitude + '&lon=' + strLatitude + '&zoom=18&addressdetails=1');
        req.setMethod('GET');
        HttpResponse response = handler.send(req);
        if (response.getStatusCode() == 200) {
            GeoLocationClass objLocation = GeoLocationClass.parse(response.getBody());
            try {
                strLocation = objLocation.address.country;
            } catch (Exception e) {
            }
        }
    }

}