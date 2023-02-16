import 'package:flutter/material.dart';
import 'package:pmsnb1/settings/styles.dart';

class ThemeProvider with ChangeNotifier {
  
  ThemeData? _themeData = StylesApp.lightTheme();
  getthemeData() => this._themeData;
  setthemeData( ThemeData theme ){
    this._themeData = theme;
    notifyListeners();
  }

}