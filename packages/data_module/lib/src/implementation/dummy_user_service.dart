import 'package:data_module/src/models/user.dart';
import 'package:data_module/src/service/user_service.dart';

class DummyUserService extends UserService {
  @override
  Future<User> getUserInfo() async {
    await Future.delayed(Duration(seconds: 1));
    return User(name: 'Ilya', age: 21, salary: 0);
  }
}