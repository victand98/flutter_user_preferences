import 'package:flutter/material.dart';

import 'package:flutter_user_preferences/src/shared_prefs/user_preferences.dart';
import 'package:flutter_user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _gender;
  String _nameUser;

  TextEditingController _textController;

  final prefs = UserPreferences();

  @override
  void initState() {
    super.initState();

    prefs.lastPage = SettingsPage.routeName;

    _secondaryColor = prefs.secondaryColor;
    _gender = prefs.gender;
    _nameUser = prefs.nameUser;
    _textController = TextEditingController(text: _nameUser);
  }

  void _setSelectedRadio(int value) {
    prefs.gender = value;
    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Ajustes",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text("Color Secundario"),
            onChanged: (value) {
              setState(() {
                prefs.secondaryColor = value;
                _secondaryColor = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre de la persona dueña del teléfono",
              ),
              onChanged: (value) {
                setState(() {
                  prefs.nameUser = value;
                  _nameUser = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
