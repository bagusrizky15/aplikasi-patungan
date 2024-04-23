class DataUser {
  String? nama;
  int? total;

  DataUser({this.nama, this.total});

  DataUser.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nama'] = nama;
    data['total'] = total;
    return data;
  }
}
