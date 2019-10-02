@Istest
public with sharing class SettingWrapperTest {
  @IsTest
  public static void TestSetting() {
    AppConfig__c configTest = new AppConfig__c();
    configTest.diagnosisEnabled__c = false;

    SettingWrapper.testConfig = configTest;

    Test.startTest();
    //.,a,.
    Test.stopTest();

    System.assertEquals(
      false,
      SettingWrapper.diagnosisEnabled,
      'diagnosis setting should be false'
    );
  }

  @IsTest
  public static void TestMdt() {
    MDSetting__mdt config = new MDSetting__mdt();
    config.TextSetting__c = 'test';
    config.BooleanSetting__c = false;

    ConfigCustomMetadata.cachedConfig = config;

    Test.startTest();
    //.,a,.
    Test.stopTest();

    System.assertEquals(
      false,
      ConfigCustomMetadata.booleanSetting,
      'mdt boolean setting should be false'
    );
  }
}
