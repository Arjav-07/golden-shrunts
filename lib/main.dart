import 'package:flutter/material.dart';
import 'package:golden_shrunts/core/store.dart';
import 'package:golden_shrunts/pages/cart_page.dart';
import 'package:golden_shrunts/pages/home_page.dart';
import 'package:golden_shrunts/pages/login_page.dart';
import 'package:golden_shrunts/utils/routes.dart';
import 'package:golden_shrunts/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        '/': (context) => HomePage(),
      },
    );
  }
}
