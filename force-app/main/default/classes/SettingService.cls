public inherited sharing class SettingService {
    public static Setting__mdt getSetting(String settingName) {
        try{
            List<Setting__mdt> settings = getSettings(new List<String>{settingName});
            return settings[0];
        }catch (Exception e){
            throw e;
        }
    }

    public static List<Setting__mdt> getSettings(List<String> settingNames) {
        try {
            List<Setting__mdt> settings = new List<Setting__mdt>();
            for(Setting__mdt setting : Setting__mdt.getAll().values()){
                if(settingNames.contains(setting.DeveloperName)){
                    settings.add(setting);
                }
            }
            return settings;
        } catch (Exception e) {
            throw e;
        }
    }
}