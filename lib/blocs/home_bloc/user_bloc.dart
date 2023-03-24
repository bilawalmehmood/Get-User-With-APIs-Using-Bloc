import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_with_bloc/models/user_model.dart';
import 'package:rest_api_with_bloc/services/apis_services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<int, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<int>((event, emit) async {
      emit(const UserInitial());
      try {
        User? user = await ApiServices.getAPi(endPointUrl: event);
        if (user != null) {
          emit(UserIntializedState(user: user));
        } else {
          emit(const UserErrorState(
            message: 'User not found',
          ));
        }
      } catch (e) {
        emit(UserErrorState(
          message: e.toString(),
        ));
      }
    });
  }
}
