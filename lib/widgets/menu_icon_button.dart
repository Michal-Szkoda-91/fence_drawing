import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/content_row_porviders.dart';

class MenuIconButton extends StatelessWidget {
  const MenuIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataProviders = Provider.of<DataProviders>(context);
    return OutlinedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          Colors.black26,
        ),
        side: MaterialStateProperty.all(
          BorderSide.none,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(10),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).primaryColor,
        ),
      ),
      onPressed: () {
        dataProviders.setManuOpacity(true);
      },
      child: Icon(
        Icons.menu,
        color: Theme.of(context).colorScheme.secondary,
        size: 30,
      ),
    );
  }
}
