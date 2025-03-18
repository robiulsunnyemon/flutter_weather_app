import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

import '../constants/constants.dart';

class ApiService {
  Future<WeatherModel> getWeatherData({String? searchText}) async {
    String url = "$baseUrl&q=$searchText&days=7";
    // String url = "http://api.weatherapi.com/v1/forecast.json?key=f3d408341dd7476ebc201258251703&q=London&days=7";

    try {
     // Response response = await get(Uri.parse(url));
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(json);
        print(response.statusCode);
        return weatherModel;

      } else {
        print(response.statusCode);
        throw ("No data found");
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
