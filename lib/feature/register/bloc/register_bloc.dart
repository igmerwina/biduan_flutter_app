import 'package:bloc/bloc.dart';
import 'package:doctor_booking_app/data/app_repository.dart';
import 'package:doctor_booking_app/data/model/request/register_request.dart';
import 'package:doctor_booking_app/data/model/response/register_response.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AppRepository appRepository;
  Logger log;

  RegisterBloc({required this.appRepository, required this.log})
      : super(RegisterInitial()) {
    on<RegisterClickEvent>(_register);
  }

  void _register(RegisterClickEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());

    final result = await appRepository.register(event.registerRequest);
    await result.fold(
      (failure) async {
        emit(RegisterErrorState(message: failure.message ?? "Gagal Mendaftar"));
      },
      (response) async {
        emit(
          RegisterLoadedState(registerResponse: response),
        );
      },
    );
  }
}
