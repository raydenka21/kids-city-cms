import 'package:kids_city_cms/app/data/models/voucher_model.dart';
import 'package:get/get.dart';
import '../../../data/providers/voucher_provider.dart';

class VoucherController extends GetxController {

  VoucherProvider voucherProv = VoucherProvider();

  final int _limit = 10;
  int _page = 1;
  var hasMore = true.obs;
  var voucher = <Voucher>[].obs;

  Future getAllVoucher() async {
    try {
      List<Voucher> response = await voucherProv.getallVoucher(_page, _limit);
      print(_page);
      print(_limit);
      if (response.length < _limit) {
        hasMore.value = false;
      }
      voucher.addAll(response);
      _page++;
    } catch (e) {
    }
  }

  Future refreshData() async {
    _page = 1;
    hasMore.value = true;
    voucher.value = [];
    await getAllVoucher();
  }
}
