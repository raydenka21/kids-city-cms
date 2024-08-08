import 'package:get/get.dart';
import 'package:kids_city_cms/app/services/redeem_service/redeem_service.dart';




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

  RxBool statusRedeem = true.obs;

  doRedeem(voucherCode) async {
    bool redeemSuccess = await RedeemService().redeemVoucher(
        voucher: voucherCode
    );
    if(!redeemSuccess){
       statusRedeem.value = false;
    }
    statusRedeem.value = false;
  }
}
