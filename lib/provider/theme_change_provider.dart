import 'package:flutter/material.dart';

class ThemeChangeProvider extends ChangeNotifier{

  bool isDarkMode=true;
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