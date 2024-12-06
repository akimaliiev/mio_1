import 'package:flutter/material.dart';
import 'package:mio_1/themes/dark_mode.dart';
import 'package:mio_1/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleThemes(){
    if(_themeData == lightMode){
      themeData = darkMode;
    } else{
      themeData = lightMode;
    }
  }
}