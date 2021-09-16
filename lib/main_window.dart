import 'package:flutter/material.dart';

import 'main_containers/content_container.dart';
import 'main_containers/side_tools_container.dart';
import 'main_containers/title_app_container.dart';

class MainWindow extends StatelessWidget {
  const MainWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
      ),
    );
  }
}