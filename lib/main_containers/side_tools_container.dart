import 'package:flutter/material.dart';

class SideToolsContainer extends StatelessWidget {
  const SideToolsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: double.infinity,
      color: Theme.of(context).backgroundColor,
    );
  }
}
