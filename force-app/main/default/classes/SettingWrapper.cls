public without sharing class SettingWrapper {
  @TestVisible
  private static AppConfig__c testConfig = null;

  public static Boolean diagnosisEnabled{
    get{
      return getConfig().diagnosisEnabled__c;
    }
  }

  private static AppConfig__c getConfig(){
    if(Test.isRunningTest() && testConfig != null){
      return testConfig;
    }

    Appconfig__c setting = AppConfig__c.getInstance('default');
    if(setting == null || Test.isRunningTest()){
      setting = new Appconfig__c();
      setting.diagnosisEnabled__c = true;
      if(! Test.isRunningTest()){
        Database.insert(setting);
      } else{
        testConfig = setting;
      }
    }
    return setting;
  }
}
