import 'package:flutter/cupertino.dart';



class QueryTextProvider extends ChangeNotifier{
  String queryText="auto:ip";

  void locationQuery({required String text}){
    queryText=text;
    notifyListeners();
  }


}