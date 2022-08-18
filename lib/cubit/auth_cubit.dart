import 'package:bloc/bloc.dart';
import 'package:book_inn_air/models/user_model.dart';
import 'package:book_inn_air/services/auth_service.dart';
import 'package:book_inn_air/services/user_service.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String email,
    required String pass,
    required String name,
    String hobby = '',
  }) async {
    try {
      emit(AuthLoading());

      UserModel userModel = await AuthService().signUp(
        email: email,
        pass: pass,
        name: name,
        hobby: hobby,
      );

      emit(AuthSuccess(userModel));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserbyID(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
