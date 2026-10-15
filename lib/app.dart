import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skill_in_a_box_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/theme/theme.dart';


class App extends StatelessWidget {
  const App({super.key});
  

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
