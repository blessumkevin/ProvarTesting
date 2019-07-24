global class CasesWebService {
    webService static Case[] getCasesForCaseStatus(String caseStatus) {
        Case[] cases = [SELECT Id, Subject, Reason, Status FROM Case WHERE Status = :caseStatus];
        return cases;
    }
}