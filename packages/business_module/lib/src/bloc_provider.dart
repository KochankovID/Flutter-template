import 'package:data_module/data_module.dart';
import 'package:get_it/get_it.dart';

import 'blocs/user_bloc.dart';

class BlocFabric {
  static final getIt = GetIt.instance;

  static void initialize() {
    DataServiceProvider.initialize();
    getIt.registerSingleton<UserBloc>(UserBloc(GetIt.I.get<UserService>()));
  }
}
