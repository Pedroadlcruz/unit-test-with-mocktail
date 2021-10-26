import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:unit_test_with_mocktail/core/errors/failures.dart';
import 'package:unit_test_with_mocktail/core/models/response_model.dart';
import 'package:unit_test_with_mocktail/features/auth/domain/repositories/auth_repository.dart';
import 'package:unit_test_with_mocktail/features/auth/domain/usecases/sign_up.dart';

class MockAuthREpository extends Mock implements AuthRepository {}

void main() {
  late SignUp usercase;
  late MockAuthREpository mockAuthREpository;

  setUp(() {
    mockAuthREpository = MockAuthREpository();
    usercase = SignUp(mockAuthREpository);
  });
  final ResponseModel responseModel =
      ResponseModel(message: 'test', success: true);
  const String userName = 'Juan Resuelve';
  const String email = 'juan@Perez.com';
  const String password = '12345678';
  const String firstName = 'Juan';
  const String lastName = 'Peres';
  const String phone = '999 999 9999';
  const String identification = '11111111111';
  test(
    'Should create an acount from the repository',
    () async {
      //arrange
      when(
        () => mockAuthREpository.signUp(
          userName: any(named: 'userName'),
          email: any(named: 'email'),
          password: any(named: 'password'),
          firstName: any(named: 'firstName'),
          lastName: any(named: 'lastName'),
          phone: any(named: 'phone'),
          identification: any(named: 'identification'),
        ),
      ).thenAnswer((_) async => Right(responseModel));
      // act
      final result = await usercase.execute(
        userName: userName,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        identification: identification,
      );
      // assert
      expect(result, Right(responseModel));
      verify<Future<Either<Failure, ResponseModel>>>(
        () => mockAuthREpository.signUp(
          userName: userName,
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          identification: identification,
        ),
      );
      verifyNoMoreInteractions(mockAuthREpository);
    },
  );
}
