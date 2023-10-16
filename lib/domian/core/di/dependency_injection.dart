import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final get = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
//  $initGetIt(get, environment: Environment.prod);
}
