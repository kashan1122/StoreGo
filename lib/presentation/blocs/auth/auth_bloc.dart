import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/domain/usecases/auth_usecase.dart';
import 'package:myapp/presentation/blocs/auth/auth_event.dart';
import 'package:myapp/presentation/blocs/auth/auth_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginRequested>(_login);
  }

  Future<void> _login(
      LoginRequested event,
      Emitter<LoginState> emit,
      ) async {
    emit(LoginLoading());

    try {
      final user = await loginUseCase(
        email: event.email,
        password: event.password,
      );

      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}