part of 'user_bloc.dart';

@immutable
class UserState {
  const UserState();

  // T when<T>({
  //   required T Function() initial,
  //   required T Function(User user) initialized,
  //   required T Function(String message) error,
  // }) {
  //   if (this is UserInitial) {
  //     return initial();
  //   } else if (this is UserIntializedState) {
  //     return initialized((this as UserIntializedState).user);
  //   } else if (this is UserErrorState) {
  //     return error((this as UserErrorState).message);
  //   } else {
  //     throw Exception('Invalid state');
  //   }
  // }
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserIntializedState extends UserState {
  final User user;
  const UserIntializedState({required this.user});
}

class UserErrorState extends UserState {
  final String message;
  const UserErrorState({required this.message});
}
