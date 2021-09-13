import 'package:flutter/material.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 300,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
    );
  }
}