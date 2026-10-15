// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../error/api_exception.dart' as _i219;
import '../network/dio_client.dart' as _i667;
import '../services/user_auth_services.dart' as _i1020;
import '../services/user_details_services.dart' as _i653;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient());
  gh.lazySingleton<_i219.ExceptionHandler>(() => _i219.ExceptionHandler());
  gh.lazySingleton<_i1020.UserAuthService>(() => _i1020.UserAuthService());
  gh.lazySingleton<_i653.UserDetailsServices>(
      () => _i653.UserDetailsServices());
  return getIt;
}
