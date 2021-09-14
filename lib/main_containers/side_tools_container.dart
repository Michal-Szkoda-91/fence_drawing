import 'package:flutter/material.dart';

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
            offset: const Offset(0, 20),
            blurRadius: 14,
            spreadRadius: 14,
          ),
        ],
      ),
      width: 300,
      height: double.infinity,
    );
  }
}
