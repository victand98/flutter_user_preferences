import 'package:flutter/material.dart';

import 'package:flutter_user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = false;
  int _gender = 1;
  String _name = "Víctor";

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Settings",
              style: TextStyle(
                fontSize: 45.0,
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
                _secondaryColor = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value;
              });
            },
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
                  _name = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
