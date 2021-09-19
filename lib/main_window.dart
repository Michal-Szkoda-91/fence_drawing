import 'package:flutter/material.dart';

import 'main_containers/bottom_container.dart';
import 'main_containers/content_container.dart';
import 'main_containers/side_tools_container.dart';
import 'main_containers/title_app_container.dart';
import 'widgets/menu_container.dart';

class MainWindow extends StatelessWidget {
  const MainWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
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
              const BottomContainer(),
            ],
          ),
          const MenuContainer(),
        ],
      ),
    );
  }
}

