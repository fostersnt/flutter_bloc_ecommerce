import 'package:ecommerce/models/user_model.dart';

class UserRepo {
  Future<List<UserModel>> users() async {
    return [
      UserModel(name: 'Foster', age: 21, address: 'Accra'),
      UserModel(name: 'Asante', age: 17, address: 'Ablekuma')
    ];
  }
}
