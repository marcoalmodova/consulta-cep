@IsTest
public class SettingServiceTest {
    public static final String testSettingName = 'Test';

    @IsTest
    static void testGetSettings() {
        Test.startTest();
        List<Setting__mdt> settings = SettingService.getSettings(new Set<String>{testSettingName});
        Test.stopTest();

        System.assertEquals(1, settings.size(), 'One record should be returned.');
    }

    @IsTest
    static void testGetSetting() {
        Test.startTest();
        Setting__mdt setting = SettingService.getSetting(testSettingName);
        Test.stopTest();

        System.assertEquals(testSettingName, setting.DeveloperName, 'The same record should be returned.');
    }
}