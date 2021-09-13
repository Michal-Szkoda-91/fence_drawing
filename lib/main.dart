import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

import 'main_containers/content_container.dart';
import 'main_containers/side_tools_container.dart';
import 'main_containers/title_app_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DesktopWindow.setMinWindowSize(const Size(1200, 800));
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
      ),
      home: const MainWindow(),
    );
  }
}

class MainWindow extends StatelessWidget {
  const MainWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAppContainer(),
        Expanded(
          child: Row(
            children: const [
              ContentContainer(),
              SideToolsContainer(),
            ],
          ),
        ),
      ],
    );
  }
}
