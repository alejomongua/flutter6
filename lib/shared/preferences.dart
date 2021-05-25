import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._();

  factory Preferences() {
    return _instance;
  }

  Preferences._();

  SharedPreferences? _prefs;

  initPref() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return this._prefs!.getString('genero') ?? 'Masculino';
  }

  set genero(newGenero) {
    this._prefs!.setString('genero', newGenero);
  }

  get nombre {
    return this._prefs!.getString('nombre') ?? '';
  }

  set nombre(newNombre) {
    this._prefs!.setString('nombre', newNombre);
  }

  get modoOscuro {
    return this._prefs!.getBool('modoOscuro') ?? false;
  }

  set modoOscuro(newModoOscuro) {
    this._prefs!.setBool('modoOscuro', newModoOscuro);
  }

  get ultimaPagina {
    return this._prefs!.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(newUltimaPagina) {
    this._prefs!.setString('ultimaPagina', newUltimaPagina);
  }
}
