import 'package:get/get.dart';

class LogoutController extends GetxController {
  //TODO: Implement LogoutController

  final count = 0.obs;
  @override
  void onInit() {
    print('controller');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void increment() => count.value++;
}
