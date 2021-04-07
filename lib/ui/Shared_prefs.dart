import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsDemo extends StatefulWidget {
  @override
  _SharedPrefsDemoState createState() => _SharedPrefsDemoState();
}

class _SharedPrefsDemoState extends State<SharedPrefsDemo> {
  TextEditingController _textEditingController = TextEditingController();
  String _tutorialValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextField(),
          _buildTextFieldResult(),
          _buildReadButton(),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: _textEditingController,
      ),
    );
  }

  Widget _buildTextFieldResult() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(_tutorialValue),
    );
  }

  Widget _buildSaveButton() {
    return RaisedButton(
      child: Text('Save to Prefs'),
      onPressed: () async {
        Prefs.setTutorialString(_textEditingController.text);
      },
    );
  }

  Widget _buildReadButton() {
    return RaisedButton(
      child: Text('Read from Prefs'),
      onPressed: () async {
        Prefs.tutorialString.then((value) {
          setState(() {
            _tutorialValue = value;
          });
        });
      },
    );
  }
}

class PreferencesHelper {
  static Future<bool> getBool(String key) async {
    final p = await prefs;
    return p.getBool(key) ?? false;
  }

  static Future setBool(String key, bool value) async {
    final p = await prefs;
    return p.setBool(key, value);
  }

  static Future<int> getInt(String key) async {
    final p = await prefs;
    return p.getInt(key) ?? 0;
  }

  static Future setInt(String key, int value) async {
    final p = await prefs;
    return p.setInt(key, value);
  }

  static Future<String> getString(String key) async {
    final p = await prefs;
    return p.getString(key) ?? '';
  }

  static Future setString(String key, String value) async {
    final p = await prefs;
    return p.setString(key, value);
  }

  static Future<double> getDouble(String key) async {
    final p = await prefs;
    return p.getDouble(key) ?? 0.0;
  }

  static Future setDouble(String key, double value) async {
    final p = await prefs;
    return p.setDouble(key, value);
  }

  // helper

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

class Const {
  static const String TUTORIAL_STRING = 'TUTORIAL_STRING';

  // Default preferences
  static const String AUTHENTICATED = 'AUTHENTICATED';
  static const String PASSCODE = 'PASSCODE';
  static const String FINGERPRINT_ENABLED = 'FINGERPRINT_ENABLED';
}

class Prefs {
  static Future<String> get tutorialString =>
      PreferencesHelper.getString(Const.TUTORIAL_STRING);

  static Future setTutorialString(String value) =>
      PreferencesHelper.setString(Const.TUTORIAL_STRING, value);

  static Future<bool> get authenticated =>
      PreferencesHelper.getBool(Const.AUTHENTICATED);

  static Future setAuthenticated(bool value) =>
      PreferencesHelper.setBool(Const.AUTHENTICATED, value);

  static Future<String> get passcode =>
      PreferencesHelper.getString(Const.PASSCODE);

  static Future setPasscode(String value) =>
      PreferencesHelper.setString(Const.PASSCODE, value);

  Future<void> clear() async {
    await Future.wait(<Future>[
      setAuthenticated(false),
      setTutorialString(''),
      setPasscode(''),
    ]);
  }
}
