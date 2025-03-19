import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/provider/queryTextProvider.dart';
import 'package:weather_app/provider/theme_change_provider.dart';
import 'package:weather_app/service/api_service.dart';
import 'components/dialog.dart';
import 'components/future_forcast_listitem.dart';
import 'components/hourly_weather_listitem.dart';
import 'components/todays_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () async {
                _textFieldController.clear();
                String text = await showTextInputDialog(context: context,textFieldController: _textFieldController);
                if (context.mounted){
                  context.read<QueryTextProvider>().locationQuery(text: text);
                }
              },
              icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {
              if (mounted){
                context.read<QueryTextProvider>().locationQuery(text: "auto:ip");
              }
            },
            icon: const Icon(Icons.my_location),
          ),
          IconButton(
            onPressed: () {
              context.read<ThemeChangeProvider>().toggle();
            },
            icon: context.read<ThemeChangeProvider>().isDarkMode?const Icon(Icons.light_mode):const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      TodaysWeather(weatherModel: weatherModel),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Weather By Hours",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            Hour? hour = weatherModel
                                ?.forecast.forecastday[0].hour[index];
                
                            return HourlyWeatherListItem(
                              hour: hour,
                            );
                          },
                          itemCount: weatherModel
                                  ?.forecast.forecastday[0].hour.length ??
                              0,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Next 7 Days Weather",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return FutureForcastListItem(
                            forecastday:
                                weatherModel?.forecast.forecastday[index],
                          );
                        },
                        itemCount: weatherModel?.forecast.forecastday.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                      )
                    ],
                  ),
                ),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text("Error Has occurred"),
              );
            }

            return Center(child: CircularProgressIndicator(color: Colors.white,));
          },
          future: apiService.getWeatherData(searchText: context.watch<QueryTextProvider>().queryText),
        ),
      ),
    );
  }
}
