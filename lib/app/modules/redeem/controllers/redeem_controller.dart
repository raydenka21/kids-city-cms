import 'package:get/get.dart';
import 'package:kids_city_cms/app/services/redeem_service/redeem_service.dart';
import 'package:kids_city_cms/app/routes/app_pages.dart';
import 'package:kids_city_cms/app/widgets/dialog/show_info_dialog.dart';



class RedeemController extends GetxController {
  //TODO: Implement RedeemController

  final count = 0.obs;
  @override
  void onInit() {
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


  String? voucher;

  doRedeem(voucher) async {
    bool redeemSuccess = await RedeemService().redeemVoucher(
        voucher: voucher
    );
    if(!redeemSuccess){
      print('aaa');
      showInfoDialog("Email Or Passsword Wrong");
      return;
    }
    Get.toNamed(Routes.VOUCHER);

  }
}
