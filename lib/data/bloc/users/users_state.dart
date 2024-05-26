import 'package:ecommerce/models/user_model.dart';

class UserState {}

class UserInitialState extends UserState {}

class GetUsersSuccessfulState extends UserState {
  final List<UserModel> users;
  GetUsersSuccessfulState({required this.users});
}
