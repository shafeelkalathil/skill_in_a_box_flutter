import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.config.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  asExtension: false,
  preferRelativeImports: true,
  throwOnMissingDependencies: true,
)
Future<GetIt> configureDependencies() async {
  getIt..registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  )
  ..registerLazySingleton<AppRouter>(
    AppRouter.new,
  );
  return init(getIt);
}
