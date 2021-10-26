import 'package:dartz/dartz.dart';
import 'package:unit_test_with_mocktail/core/errors/failures.dart';
import 'package:unit_test_with_mocktail/core/models/response_model.dart';
import 'package:unit_test_with_mocktail/features/auth/domain/repositories/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);
  Future<Either<Failure, ResponseModel>> execute({
    required String userName,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String identification,
  }) async =>
      repository.signUp(
        userName: userName,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        identification: identification,
      );
}
