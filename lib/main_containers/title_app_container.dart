
import 'package:flutter/material.dart';

class TitleAppContainer extends StatelessWidget {
  const TitleAppContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Theme.of(context).primaryColor,
    );
  }
}
