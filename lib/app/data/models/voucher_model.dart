class Voucher {
  int? id;
  String? code;
  String? created_at;
  String? redeem_at;
  String? redeem_by;
  String? avatar;
  String? status;

  Voucher(
      {this.id,
      this.code,
      this.created_at,
      this.redeem_at,
      this.redeem_by,
      this.status,
      this.avatar});

  Voucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    created_at = json['created_at'];
    redeem_at = json['redeem_at'];
    redeem_by = json['redeem_by'];
    status = json['status'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['created_at'] = created_at;
    data['redeem_at'] = redeem_at;
    data['redeem_by'] = redeem_by;
    data['status'] = status;
    data['avatar'] = avatar;
    return data;
  }

  static List<Voucher> fromJsonList(List? data) {
    // print(data);
    if (data == null || data.length == 0) {
      return [];
    }
    // print(data.map((toElement)=> Voucher.fromJson(toElement)));
    // print(data.map((toElement) => Voucher.fromJson(toElement)).toList());

    return data.map((toElement) => Voucher.fromJson(toElement)).toList();
  }
}
