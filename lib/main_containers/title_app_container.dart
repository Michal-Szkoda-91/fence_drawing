import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/text_field_title.dart';
import '../widgets/menu_icon_button.dart';

class TitleAppContainer extends StatelessWidget {
  const TitleAppContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).backgroundColor,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: TextFormWithTitle()),
          const MenuIconButton(),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
