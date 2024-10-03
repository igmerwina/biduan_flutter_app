import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:doctor_booking_app/data/model/request/login_request.dart';
import 'package:doctor_booking_app/data/model/response/login_response.dart';
import 'package:doctor_booking_app/data/app_preferences.dart';
import 'package:doctor_booking_app/data/app_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AppRepository appRepository;
  AppPreferences pref;
  Logger log;

  LoginBloc({
    required this.appRepository,
    required this.pref,
    required this.log,
  }) : super(LoginInitial()) {
    on<LoginClickEvent>(_login);
  }

  void _login(LoginClickEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());

    final result = await appRepository.login(event.loginRequest);
    await result.fold(
      (failure) async {
        emit(LoginErrorState(message: failure.message ?? "Gagal Login"));
      },
      (response) async {
        String token = response.data?.token ?? "";
        if (token.isNotEmpty) {
          pref.setUserToken(token);
          pref.setUserLoggedIn(true);
          emit(LoginLoadedState(loginResponse: response));
        } else {
          emit(LoginErrorState(message: "Gagal Login"));
        }
      },
    );
  }
}
