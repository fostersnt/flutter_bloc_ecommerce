import 'package:ecommerce/data/model/user_model.dart';

class UserState {}

class UserInitialState extends UserState {}

class GetUsersSuccessfulState extends UserState {
  final List<UserModel> users;
  GetUsersSuccessfulState({required this.users});
}
