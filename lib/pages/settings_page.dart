import 'package:flutter/material.dart';
import 'package:user_preferences/shared/preferences.dart';
import 'package:user_preferences/widgets/drawer_menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _modoOscuro = false;
  String _genero = 'Masculino';
  String _nombre = '';

  Preferences prefs = Preferences();

  @override
  void initState() {
    super.initState();

    _genero = prefs.genero;
    _nombre = prefs.nombre;
    _modoOscuro = prefs.modoOscuro;
    prefs.ultimaPagina = SettingsPage.routeName;
    setState(() {});
  }

  _setGender(newValue) {
    prefs.genero = newValue;
    setState(() => _genero = newValue as String);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
        ),
        drawer: DrawerMenu(routeName: SettingsPage.routeName),
        body: ListView(
          children: [
            SwitchListTile(
              title: Text('Modo oscuro'),
              value: _modoOscuro,
              onChanged: (value) {
                prefs.modoOscuro = value;
                setState(() => _modoOscuro = value);
              },
            ),
            Divider(),
            RadioListTile(
              value: 'Masculino',
              groupValue: _genero,
              onChanged: _setGender,
              title: Text('Masculino'),
            ),
            RadioListTile(
              value: 'Femenino',
              groupValue: _genero,
              onChanged: _setGender,
              title: Text('Femenino'),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: TextEditingController(
                  text: _nombre,
                ),
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText:
                      '¿Quien es la persona que está usando esta aplicación?',
                ),
                onChanged: (value) {
                  prefs.nombre = value;
                  setState(() => _nombre = value);
                },
              ),
            )
          ],
        ),
      );
}
