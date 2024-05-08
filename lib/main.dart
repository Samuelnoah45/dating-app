import 'package:dating/configs/colors_config.dart';
import 'package:dating/configs/router_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Dating());
}

class Dating extends StatelessWidget {
  const Dating({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryBlack, // Change status bar color
      statusBarIconBrightness:
          Brightness.light, // Change status bar icons color
    ));
    return MaterialApp.router(
      // Root widget of the app, sets the app title
      title: 'Dating',
      theme: ThemeData(
        textTheme: const TextTheme(
          // Set default text color to white
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          // You can customize other text styles here as well
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),

      // routerDelegate: router.routerDelegate,
      // routeInformationParser: router.routeInformationParser,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
