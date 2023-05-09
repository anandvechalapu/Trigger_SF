trigger AdminSurveyTrigger on Survey__c (after insert, after update, before delete) {
    //List to store the Ids
    List<Id> surveyIds = new List<Id>();
    
    //Get the survey Ids
    if(Trigger.isInsert) {
        for(Survey__c survey : Trigger.new) {
            surveyIds.add(survey.Id);
        }
    }
    else if(Trigger.isUpdate) {
        for(Survey__c survey : Trigger.new) {
            surveyIds.add(survey.Id);
        }
    }
    else if(Trigger.isDelete) {
        for(Survey__c survey : Trigger.old) {
            surveyIds.add(survey.Id);
        }
    }
    
    //Set the Domain as India, USA, or Both from a dropdown list
    if(Trigger.isInsert || Trigger.isUpdate) {
        List<Survey__c> surveyList = [SELECT Id, Domain__c FROM Survey__c WHERE Id IN :surveyIds];
        for(Survey__c survey : surveyList) {
            survey.Domain__c = 'India, USA, or Both';
        }
        update surveyList;
    }
    
    //Set the Status of the survey as Active or Inactive from a dropdown list
    if(Trigger.isInsert || Trigger.isUpdate) {
        List<Survey__c> surveyList = [SELECT Id, Status__c FROM Survey__c WHERE Id IN :surveyIds];
        for(Survey__c survey : surveyList) {
            survey.Status__c = 'Active or Inactive';
        }
        update surveyList;
    }
    
    //Set the Survey State as Not Started, Started, Cancelled, or Completed from a dropdown list
    if(Trigger.isInsert || Trigger.isUpdate) {
        List<Survey__c> surveyList = [SELECT Id, State__c FROM Survey__c WHERE Id IN :surveyIds];
        for(Survey__c survey : surveyList) {
            survey.State__c = 'Not Started, Started, Cancelled, or Completed';
        }
        update surveyList;
    }
    
    //Set the Page Name or Location as Home, Profile, Search Post, Post detail, or Webinar Detail from a dropdown list
    if(Trigger.isInsert || Trigger.isUpdate) {
        List<Survey__c> surveyList = [SELECT Id, Page_Name_or_Location__c FROM Survey__c WHERE Id IN :surveyIds];
        for(Survey__c survey : surveyList) {
            survey.Page_Name_or_Location__c = 'Home, Profile, Search Post, Post detail, or Webinar Detail';
        }
        update surveyList;
    }
    
    //Set the Target Users from All Users or Exclude Users from a dropdown list
    if(Trigger.isInsert || Trigger.isUpdate) {
        List<Survey__c> surveyList = [SELECT Id, Target_Users__c FROM Survey__c WHERE Id IN :surveyIds];
        for(Survey__c survey : surveyList) {
            survey.Target_Users__c = 'All Users or Exclude Users';
        }
        update surveyList;
    }
    
    //Set the Specialty for the survey
    if(Trigger.isInsert || Trigger.isUpdate) {
        List<Survey__c> surveyList = [SELECT Id, Specialty__c FROM Survey__c WHERE Id IN :surveyIds];
        for(Survey__c survey : surveyList) {
            survey.Specialty__c = 'Specialty';
        }
        update surveyList;
    }
    
    //Set the Preferences for the survey
    if(Trigger.isInsert || Trigger.isUpdate) {
        List<Survey__c> surveyList = [SELECT Id, Preferences__c FROM Survey__c WHERE Id IN :surveyIds];
        for(Survey__c survey : surveyList) {
            survey.Preferences__c = 'Preferences';
        }
        update surveyList;
    }
    
    //Set the country, region and city combination to show the survey to
    if(Trigger.isInsert || Trigger.isUpdate) {
        List<Survey__c> surveyList = [SELECT Id