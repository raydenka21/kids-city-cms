class Voucher {
  int? id;
  int? number_voucher;
  String? created_at;
  String? redeem_at;
  String? redeem_by;
  String? avatar;

  Voucher(
      {this.id,
      this.number_voucher,
      this.created_at,
      this.redeem_at,
      this.redeem_by,
      this.avatar});

  Voucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number_voucher = json['number_voucher'];
    created_at = json['created_at'];
    redeem_at = json['redeem_at'];
    redeem_by = json['redeem_by'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['number_voucher'] = number_voucher;
    data['created_at'] = created_at;
    data['redeem_at'] = redeem_at;
    data['redeem_by'] = redeem_by;
    return data;
  }

  static List<Voucher> fromJsonList(List? data) {
    if (data == null || data.length == 0) {
      return [];
    }

    return data.map((toElement) => Voucher.fromJson(toElement)).toList();
  }
}
