@Istest
public with sharing class SettingWrapperTest {
  @IsTest
  public static void TestSetting(){
    AppConfig__c configTest = new AppConfig__c();
    configTest.diagnosisEnabled__c = false;

    SettingWrapper.testConfig = configTest;

    Test.startTest();
    //.,a,.
    Test.stopTest();

    System.assertEquals(false, SettingWrapper.diagnosisEnabled,
    'diagnosis setting should be false');
  }
}
