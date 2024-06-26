
import 'package:dio/dio.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'dart:io' show Platform;
import 'package:hy_device_id/hy_device_id.dart' show HyDeviceId;
import 'package:kids_city_cms/app/helper/setting_app.dart';




class AuthService{
  static String? token;

  Future<bool> login({
    required String email,
    required String password,
  }) async {

    String? deviceId = 'Unknown';
    final hyDeviceIdPlugin = HyDeviceId();


    try{
      print(email);
      print(password);

      var json =  {
        "email": email,
        "password": password,
      };

      var response = await Dio().post(
          "${SettingApp.urlApi}auth/",
          data: json
      );

      Map obj = response.data;
      print(obj);
      token = obj["data"]["token"];
      String? os = Platform.operatingSystem;
      deviceId = await hyDeviceIdPlugin.getDeviceId();

      await SessionManager().set("token", token);

      await SessionManager().set("os", os);

      await SessionManager().set("device_id", deviceId);
      return true;

    }on Exception catch(err){
      print("r");
      print(err);
      return false;
    }
  }
}