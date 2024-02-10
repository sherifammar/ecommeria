import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ReportData {
  Crud crud;
  ReportData(this.crud);

  getChartData( String searchmounth1,
      String searchmounth2, String searchyear1, String searchyear2) async {
    // this method give l or r only

    var response = await crud.postData('${AppLink.reportingsearch}', {
     
      "searchmounth1": searchmounth1,
      "searchmounth2": searchmounth2,
      "searchyear1": searchyear1,
      "searchyear2": searchyear2
    }); // {}== map
    return response.fold((l) => l, (r) => r);
  }
//===============================
  getDetailsadmin() async {
    // this method give l or r only

    var response =
        await crud.postData('${AppLink.detailsadmin}', {}); // {}== map
    return response.fold((l) => l, (r) => r);
  }

// ===================================
   getTodayData( ) async {
   

    var response = await crud.postData(AppLink.today, {}); // {}== map
    return response.fold((l) => l, (r) => r);
  }
}
