/**
 * Created by Manjit Singh on 10 October 2017.
 */

public with sharing class CallMeBackInboundNotificationController {
    public List<Case> lstCasesInQueue { get; set; }

    public void fetchCases() {
        Integer casesToShow = (Integer) CallIntelligenceSettings__c.getInstance().RecordsToShow__c;
        Integer timeToShow = (Integer) CallIntelligenceSettings__c.getInstance().Time_for_Records__c * (-1);

        lstCasesInQueue = [
                SELECT CaseNumber,Id,Caller__r.Product_Of_Interest__c, Caller__r.Caller_Name__c, Contact.Phone
                FROM Case
                where OwnerId = :UserInfo.getUserId()
                AND IsClosed = false
                AND Contact.Is_Blocked__c = false
                AND CreatedDate >= :Date.today().addDays(timeToShow)
                LIMIT :casesToShow
        ];

    }

}