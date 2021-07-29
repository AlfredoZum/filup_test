import 'package:flutter/material.dart';

import 'package:filup_test/src/util/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filup Test',
      initialRoute: '/',
      routes: customRoutes,
      // home: HomePage(),
      theme: ThemeData(
        primaryColor: const Color(0xff3cd458),
      ),
    );
  }
}