import 'package:flutter/material.dart';
import 'package:user_preferences/shared/preferences.dart';
import 'package:user_preferences/widgets/drawer_menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = Preferences();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Preferencias del usuario'),
        ),
        drawer: DrawerMenu(routeName: routeName),
        body: Column(
          children: <Widget>[
            Text('Color secundario: ${prefs.modoOscuro ? 'Si' : 'No'}'),
            Divider(),
            Text('Genero: ${prefs.genero}'),
            Divider(),
            Text('Nombre usuario: ${prefs.nombre}'),
            Divider(),
          ],
        ),
      );
}
