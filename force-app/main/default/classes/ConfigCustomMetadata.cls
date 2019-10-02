public without sharing class ConfigCustomMetadata {
  @testvisible
  private static MDSetting__mdt cachedConfig = null;

  public static Boolean booleanSetting {
    get {
      return getConfig().BooleanSetting__c;
    }
  }

  public static MDSetting__mdt getConfig() {
    if (cachedConfig != null) {
      return cachedConfig;
    }

    if (Test.isRunningTest()) {
      return createDefaultConfig();
    }

    List<MDSetting__mdt> settings = [
      SELECT DeveloperName, MasterLabel, BooleanSetting__c, TextSetting__c
      FROM MDSetting__mdt
      WHERE DeveloperName = 'Default'
    ];

    return (settings[0] == null) ? createDefaultConfig() : settings[0];
  }

  private static MDSetting__mdt createDefaultConfig() {
    MDSetting__mdt config = new MDSetting__mdt();
    config.TextSetting__c = 'test';
    config.BooleanSetting__c = true;
    return config;
  }
}
