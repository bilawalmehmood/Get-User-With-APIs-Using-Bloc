import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_with_bloc/blocs/home_bloc/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Data'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserInitial) {
                  return const Text(
                    "Press the refresh button to get user data",
                    style: TextStyle(fontSize: 20),
                  );
                } else if (state is UserIntializedState) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(state.user.avatar),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${state.user.firstName} ${state.user.lastName}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.user.email,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text((state as UserErrorState).message);
                }
              },
            ),

            // child: BlocBuilder<UserBloc, UserState>(
            //   builder: (context, state) => state.when(
            //     initial: () => const CircularProgressIndicator(),
            //     initialized: (user) => Column(
            //       children: [
            //         CircleAvatar(
            //           radius: 50,
            //           backgroundImage: NetworkImage(user.avatar),
            //         ),
            //         const SizedBox(height: 20),
            //         Text(
            //           '${user.firstName} ${user.lastName}',
            //           style: const TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         const SizedBox(height: 10),
            //         Text(
            //           user.email,
            //           style: const TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ],
            //     ),
            //     error: (message) => Text(message),
            //   ),
            // ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<UserBloc>(context).add(Random().nextInt(12) + 1);
          },
          child: const Icon(Icons.refresh),
        ));
  }
}
