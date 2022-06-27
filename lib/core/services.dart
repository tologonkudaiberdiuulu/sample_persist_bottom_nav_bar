import 'package:get_it/get_it.dart';

import 'navigator.dart';

final app = GetIt.instance;

void setupServices() {
  app.registerLazySingleton(() => SampleNavigator());
}
