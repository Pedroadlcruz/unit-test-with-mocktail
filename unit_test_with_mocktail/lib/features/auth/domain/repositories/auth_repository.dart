import 'package:dartz/dartz.dart';
import 'package:unit_test_with_mocktail/core/errors/failures.dart';
import 'package:unit_test_with_mocktail/core/models/response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, ResponseModel>> signUp({
    required String userName,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String identification,
  });
  Future<Either<Failure, ResponseModel>> logIn(
      {required String email, required String password});

  Future<Either<Failure, ResponseModel>> confirmEmail(String email);
  Future<Either<Failure, ResponseModel>> forgotPassword(String email);
  Future<Either<Failure, ResponseModel>> logOut();
  Future<Either<Failure, ResponseModel>> deleteAccount();
}
