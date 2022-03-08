import 'package:data_module/data_module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'bloc_factory.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initBlocFactory',
)
void blocFactory() {
  DataServiceProvider.initialize();
  $initBlocFactory(getIt);
}
