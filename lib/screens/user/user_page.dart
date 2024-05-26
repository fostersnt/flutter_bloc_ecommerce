import 'package:ecommerce/features/users/users_bloc.dart';
import 'package:ecommerce/features/users/users_event.dart';
import 'package:ecommerce/features/users/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = UserBloc();
    userBloc.add(GetUsersEvent());
    return Container(
      child: BlocConsumer<UserBloc, UserState>(
        bloc: userBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) {
          return true;
        },
        buildWhen: (previous, current) {
          return true;
        },
        builder: (context, state) {
          if (state.runtimeType == GetUsersSuccessfulState) {
            final successfulSate = state as GetUsersSuccessfulState;
            return Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: successfulSate.users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index > 0
                        ? const EdgeInsets.symmetric(vertical: 8.0)
                        : const EdgeInsets.symmetric(vertical: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(successfulSate.users[index].name),
                            Text(successfulSate.users[index].age.toString()),
                            Text(successfulSate.users[index].address)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
