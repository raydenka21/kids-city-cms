import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kids_city_cms/app/widgets/form/textfield/text_field.dart';
import 'package:kids_city_cms/app/widgets/form/textfield/text_password.dart';
import 'package:kids_city_cms/app/widgets/form/validator/validator.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:quickalert/quickalert.dart';
import 'package:kids_city_cms/app/routes/app_pages.dart';



class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override



  Widget build(BuildContext context) {
    final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
    final HomeController state = Get.put(HomeController());
    state.doLogin();


     resetLoadingButton() async {
        _btnController.reset();
     }


    return Scaffold(
      appBar: AppBar(
        title: const Text('CMS Kids City'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            key : controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QTextField(
                    label: "Email",
                    validator: Validator.email,
                    suffixIcon: Icons.email,
                    onChanged: (value) {
                      controller.email = value;
                    },
                  ),
                  QTextPassword(
                    label: "Password",
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.password = value;
                    },
                  ),
                  SizedBox(height: 24.0),
                  RoundedLoadingButton(
                    height: 50,
                    width: 100,
                    borderRadius: 5,
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                    controller: _btnController,
                    onPressed : () async {
                      // _loadingButton();
                      await resetLoadingButton();
                      await controller.doLogin();


                      if(!state.loadingSuccess){
                        print(state.loadingSuccess);
                         await QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Oops...',
                          text: 'Sorry,Wrong Email / Password',
                          backgroundColor: Colors.orange,
                          titleColor: Colors.white,
                          textColor: Colors.white,
                        );
                        // _btnController.error();
                      }else{
                        Get.toNamed(Routes.DASHBOARD);
                      }


                    }
                  )
                ]
            )
        )

      ),
    );
  }
}
