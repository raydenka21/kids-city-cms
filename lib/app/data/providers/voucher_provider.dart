import 'package:get/get.dart';

import '../models/voucher_model.dart';
import 'package:kids_city_cms/app/helper/setting_app.dart';


class VoucherProvider extends GetConnect {
  final String _baseUrl = "${SettingApp.urlApi}vouchers";
  // @override
  // void onInit() {
  //   httpClient.defaultDecoder = (map) {
  //     if (map is Map<String, dynamic>) return Voucher.fromJson(map);
  //     if (map is List)
  //       return map.map((item) => Voucher.fromJson(item)).toList();
  //   };
  //   httpClient.baseUrl = 'YOUR-API-URL';
  // }

  Future<List<Voucher>> getallVoucher(int page, int limit) async {
    final response = await get("${_baseUrl}?page=$page&limit=$limit");
    return Voucher.fromJsonList(response.body["data"]);
  }
}
