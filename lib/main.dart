import 'package:filup_test/src/bloc/provider.dart';
import 'package:flutter/material.dart';

import 'package:filup_test/src/util/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      child: MaterialApp(
        title: 'Filup Test',
        initialRoute: '/',
        routes: customRoutes,
        theme: ThemeData(
          primaryColor: const Color(0xff3cd458),
          // primaryColor: Colors.deepPurple[600],
        ),
      ),
    );
  }
}