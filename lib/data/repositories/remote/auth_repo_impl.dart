import 'package:myapp/data/model/auth_model.dart';
import 'package:myapp/data/source/auth_remote_data.dart';
import 'package:myapp/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) {
    return remoteDataSource.login(
      email: email,
      password: password,
    );
  }
}