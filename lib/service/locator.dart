import 'package:get_it/get_it.dart';
import 'package:utilities/service/navigation_service.dart';

//TODO: This class setup the routing singleton object
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
