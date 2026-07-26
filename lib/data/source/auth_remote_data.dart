import 'dart:async';

import 'package:dio/dio.dart';
import 'package:myapp/data/model/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email == "admin@test.com" && password == "123456") {
      return UserModel(
        id: 1,
        name: "Kashan",
        email: email,
        token: "mock_jwt_token_123456",
      );
    }

    throw Exception("Invalid email or password");
  }
}