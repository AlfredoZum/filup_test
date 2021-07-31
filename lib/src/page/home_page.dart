import 'package:flutter/material.dart';

// Component
import 'package:filup_test/src/component/drawer_customer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(750, 1334));

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        title: const Text('Filup Test'),
      ),
      drawer: DrawerCustomer(),
      body: Center(
        child: Text('Welcome', style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}
