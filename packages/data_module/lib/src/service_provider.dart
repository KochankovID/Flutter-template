import 'package:get_it/get_it.dart';

import 'implementation/dummy_user_service.dart';
import 'service/user_service.dart';

class DataServiceProvider {
  static final getIt = GetIt.instance;

  static void initialize() {
    getIt.registerSingleton<UserService>(DummyUserService());
  }
}
