import 'package:flutter/material.dart';

import '../widgets/elemenet_list.dart';

class SideToolsContainer extends StatelessWidget {
  const SideToolsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).backgroundColor,
            blurRadius: 5,
            spreadRadius: 6,
          ),
        ],
      ),
      width: 370,
      height: double.infinity,
      child: const ElementList(),
    );
  }
}
