import 'package:flutter/material.dart';

class ThemeChangeProvider extends ChangeNotifier{

  bool isDarkMode=false;
  toggle(){
    if(isDarkMode==false){
      isDarkMode=true;
      notifyListeners();
    }else{
      isDarkMode=false;
      notifyListeners();

    }
  }

}