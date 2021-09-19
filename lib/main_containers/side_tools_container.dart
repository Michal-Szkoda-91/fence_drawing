import 'package:flutter/material.dart';

import '../widgets/elemenet_list.dart';

class SideToolsContainer extends StatelessWidget {
  const SideToolsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3, top: 3),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border(
          left: BorderSide(
            color: Theme.of(context).backgroundColor,
            width: 2,
          ),
        ),
      ),
      width: 370,
      height: double.infinity,
      child: const ElementList(),
    );
  }
}
