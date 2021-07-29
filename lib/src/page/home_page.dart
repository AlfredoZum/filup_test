import 'package:flutter/material.dart';

// Component
import 'package:filup_test/src/component/drawer_customer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filup Test'),
      ),
      drawer: DrawerCustomer(),
      body: const Text('Hold'),
    );
  }
}
