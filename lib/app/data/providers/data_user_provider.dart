import 'package:get/get.dart';

import '../models/data_user_model.dart';

class DataUserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return DataUser.fromJson(map);
      if (map is List)
        return map.map((item) => DataUser.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<DataUser?> getDataUser(int id) async {
    final response = await get('datauser/$id');
    return response.body;
  }

  Future<Response<DataUser>> postDataUser(DataUser datauser) async =>
      await post('datauser', datauser);
  Future<Response> deleteDataUser(int id) async => await delete('datauser/$id');
}
