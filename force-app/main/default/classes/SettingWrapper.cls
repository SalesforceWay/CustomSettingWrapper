public without sharing class SettingWrapper {
  @TestVisible
  private static AppConfig__c testConfig = null;

  public static Boolean diagnosisEnabled {
    get {
      return getConfig().diagnosisEnabled__c;
    }
  }

  private static AppConfig__c getConfig() {
    if (Test.isRunningTest()) {
      if (testConfig != null) {
        return testConfig;
      }
      testConfig = createDefaultConfig();
      return testConfig;
    }

    Appconfig__c setting = AppConfig__c.getInstance('default');
    if (setting == null) {
      setting = createDefaultConfig();
      Database.insert(setting);
    }
    return setting;
  }

  private static AppConfig__c createDefaultConfig() {
    Appconfig__c setting = new Appconfig__c();
    setting.name = 'default';
    setting.diagnosisEnabled__c = true;
    return setting;
  }
}
