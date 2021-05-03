import 'package:flutter/material.dart';

import 'package:flutter_user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de Usuario"),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Color Secundario"),
          Divider(),
          Text("Genero"),
          Divider(),
          Text("Nombre de Usuario"),
          Divider(),
        ],
      ),
    );
  }
}
