import 'dart:async';

import 'package:ecommerce/features/users/users_event.dart';
import 'package:ecommerce/features/users/users_state.dart';
import 'package:ecommerce/repositories/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UsersEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<GetUsersEvent>(getUsersEvent);
  }

  final UserRepo _userRepo = UserRepo();

  FutureOr<void> getUsersEvent(
      GetUsersEvent event, Emitter<UserState> emit) async {
    var data = await _userRepo.users();
    emit(GetUsersSuccessfulState(users: data));
  }
}
