import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/shared_prefs/user_preferences.dart';

import 'package:flutter_user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "home";
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de Usuario"),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "Color Secundario: ${prefs.secondaryColor ? "Activado" : "Desactivado"}"),
          Divider(),
          Text("Genero: ${prefs.gender}"),
          Divider(),
          Text("Nombre de Usuario: ${prefs.nameUser}"),
          Divider(),
        ],
      ),
    );
  }
}
