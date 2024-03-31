import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class SettingData {
  Crud crud;
  SettingData(this.crud);
  addData(
      
      String settingtitle,
      String settingbody,
      String settingdeliverytime,
      String settingstartlat,
      String settinglong,
      String settingspeed,
      String settingpricepekilo,
      ) async {
    // this method give l or r only

    var response = await crud.postData(AppLink.setting, {
      
      "settingtitle": settingtitle,
      "settingbody": settingbody,
      "settingdeliverytime": settingdeliverytime,
      "settingstartlat": settingstartlat,
      "settinglong": settinglong,
      "settingspeed": settingspeed,
      "settingpricepekilo": settingpricepekilo,

    });
    return response.fold((l) => l, (r) => r);
  }

 
}
