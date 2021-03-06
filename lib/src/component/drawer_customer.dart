import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerCustomer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _options(context, 'Pokemon', '/listPokemon'),
          _options(context, 'Calendario', '/calendarPage'),
          _options(context, 'Mapa', '/mapPage'),
        ],
      ),
    );
  }

  Widget _drawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget> [
          const Text('Bienvenido'),
          SvgPicture.asset(
              'assets/Logo.svg',
              semanticsLabel: 'Filup Logo'
          ),
        ],
      ),
    );
  }

  Widget _options(BuildContext ctx, String name, String route){
    return ListTile(
      title: Text(name),
      onTap: () => Navigator.pushNamed(ctx, route),
    );
  }
}