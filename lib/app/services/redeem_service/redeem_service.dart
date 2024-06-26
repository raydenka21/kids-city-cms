import 'package:dio/dio.dart';
import 'package:kids_city_cms/app/helper/setting_app.dart';




class RedeemService{

  Future<bool> redeemVoucher({
    required String voucher,
  }) async {


    try{
      print(voucher);
      var json =  {
        "voucher": voucher,
      };

      var response = await Dio().post(
        "${SettingApp.urlApi}redeem/",
        data: json,
      );

      Map obj = response.data;
      String? status = obj["status"];
      if(status!='success'){
        return false;
      }
      return true;

    }on Exception catch(err){
      print("error api voucher");
      print(err);
      return false;
    }
  }
}