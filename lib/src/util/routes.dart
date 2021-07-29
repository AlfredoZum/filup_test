import 'package:flutter/material.dart';

// Pages
import 'package:filup_test/src/page/home_page.dart';

final Map<String, WidgetBuilder> customRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) => HomePage(),
};