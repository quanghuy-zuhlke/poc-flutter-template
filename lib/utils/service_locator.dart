import 'package:get_it/get_it.dart';
import 'package:poc_flutter_template/services/scc_service.dart';

GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<SCCRepository>(SCCServiceRepository());
}