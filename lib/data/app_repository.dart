import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_booking_app/data/app_preferences.dart';
import 'package:doctor_booking_app/data/failure_response.dart';
import 'package:doctor_booking_app/data/model/response/user_response.dart';
import 'package:doctor_booking_app/injection.dart';
import 'package:logger/logger.dart';
import 'package:doctor_booking_app/data/dio.dart';
import 'package:doctor_booking_app/data/failure.dart';
import 'package:doctor_booking_app/data/model/request/login_request.dart';
import 'package:doctor_booking_app/data/model/request/register_request.dart';
import 'package:doctor_booking_app/data/model/response/login_response.dart';
import 'package:doctor_booking_app/data/model/response/register_response.dart';

class AppRepository {
  final Dio dio;
  final AppPreferences pref;
  final Logger log;

  AppRepository({required this.dio, required this.pref, required this.log});

  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest registerRequest) async {
    try {
      final response =
          await dio.post("/auth/register", data: registerRequest.toJson());
      log.d("PegadaianRepository: ${response.data}");

      return Right(RegisterResponse.fromJson(response.data));
    } on DioException catch (e) {
      Failure failure = dioException(e);
      log.e("PegadaianRepository: ${failure.message}");
      return Left(failure);
    } catch (e) {
      log.e("PegadaianRepository $e");
      return Left(UnknownFailure(null, null));
    }
  }

  Future<Either<Failure, LoginResponse>> login(
      LoginRequest loginRequest) async {
    try {
      final response =
          await dio.post("/auth/login", data: loginRequest.toJson());
      log.d("PegadaianRepository: ${response.data}");

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        String token = loginResponse.data?.token ?? "";

        Dio dio = getIt.get<Dio>(instanceName: instanceDefaultDio);
        dio.options.headers['Content-Type'] = 'application/json';
        if (token.isNotEmpty) {
          dio.options.headers["Authorization"] = "Bearer $token";
        }

        return Right(LoginResponse.fromJson(response.data));
      } else {
        Failure failure =
            ServerFailure("", FailureResponse.fromJson(response.data));
        return Left(failure);
      }
    } on DioException catch (e) {
      Failure failure = dioException(e);
      log.e("PegadaianRepository: ${failure.message}");
      return Left(failure);
    } catch (e) {
      log.e("PegadaianRepository $e");
      return Left(UnknownFailure(null, null));
    }
  }

  Future<Either<Failure, UserResponse>> getUser() async {
    try {
      String? userId = pref.getUserId();
      final response = await dio.get("/auth/users/$userId");
      log.d("PegadaianRepository: ${response.data}");

      return Right(UserResponse.fromJson(response.data));
    } on DioException catch (e) {
      Failure failure = dioException(e);
      log.e("PegadaianRepository: ${failure.message}");
      return Left(failure);
    } catch (e) {
      log.e("PegadaianRepository $e");
      return Left(UnknownFailure(null, null));
    }
  }
}
