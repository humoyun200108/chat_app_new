import 'package:chat/models/user_model.dart';
import 'package:dio/dio.dart';

class GetUserService {
  Future<dynamic> getUserService() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage;
      }
    } on DioError catch (e) {
      return e.message;
    }
  }
}
