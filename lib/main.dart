import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/queryTextProvider.dart';
import 'package:weather_app/provider/theme_change_provider.dart';
import 'package:weather_app/theme/theme.dart';
import 'package:weather_app/ui/home.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>ThemeChangeProvider(),),
      ChangeNotifierProvider(create: (context)=>QueryTextProvider(),),
    ],
      child:  const MyApp(),
    )
     

     );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: HomePage(),
      darkTheme: darkTheme,
      themeMode:context.watch<ThemeChangeProvider>().isDarkMode? ThemeMode.dark:ThemeMode.light

    );
  }
}