import 'package:flutter/material.dart';

import '../widgets/draw_list.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Container(
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border(
              left: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          child: const DrawList(),
        ),
      ),
    );
  }
}