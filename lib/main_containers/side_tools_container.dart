import 'package:flutter/material.dart';

import '../widgets/elemenet_list.dart';

class SideToolsContainer extends StatelessWidget {
  const SideToolsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).backgroundColor,
            blurRadius: 5,
            spreadRadius: 6,
          ),
        ],
      ),
      width: 350,
      height: double.infinity,
      child: const ElementList(),
    );
  }
}
