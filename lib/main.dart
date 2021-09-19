import 'package:desktop_window/desktop_window.dart';
import 'package:fence_drawing/models/element_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import 'main_window.dart';
import 'providers/content_row_porviders.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DesktopWindow.setMinWindowSize(const Size(1250, 700));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zaplanuj ogrodzenie',
      theme: ThemeData(
        primaryColor: Colors.grey.shade800,
        backgroundColor: Colors.grey.shade900,
        cardColor: Colors.grey.shade600,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
          primary: Colors.grey.shade400,
        ),
        fontFamily: 'Rajdhani',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 45,
            color: Colors.grey[300],
            fontWeight: FontWeight.w600,
          ),
          headline2: TextStyle(
            fontSize: 25,
            color: Colors.grey[300],
          ),
          headline3: TextStyle(
            fontSize: 15,
            color: Colors.red.shade800,
            fontWeight: FontWeight.w600,
          ),
          headline4: TextStyle(
            fontSize: 19,
            color: Colors.grey[300],
          ),
        ),
      ),

      //
      //
      //
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => DataProviders(),
        ),
        ChangeNotifierProvider(
          create: (_) => ElementModelProvider(),
        )
      ], child: const MainWindow()),
    );
  }
}
