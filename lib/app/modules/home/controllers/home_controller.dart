import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:kids_city_cms/app/services/auth_service/auth_service.dart';
import 'package:kids_city_cms/app/helper/session/session_app.dart';
import 'package:kids_city_cms/app/routes/app_pages.dart';




class HomeController extends GetxController {


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  var loadingSuccess = true;

  doLogin() async {

    bool isValid = formKey.currentState!.validate();
    if(!isValid){
      return;
    }
    bool loginSuccess = await AuthService().login(
        email: email!,
        password: password!);



    if(!loginSuccess){
      loadingSuccess = false;
      print(loadingSuccess);
      print('aaa');
      return;
    }
    if(loginSuccess){
      loadingSuccess = true;

      Map<String, String> data = await SessionApp().getSession();
      Get.toNamed(Routes.DASHBOARD);

    }

  }

}
