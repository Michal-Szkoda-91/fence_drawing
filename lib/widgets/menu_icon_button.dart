import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';

class MenuIconButton extends StatelessWidget {
  const MenuIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataProviders = Provider.of<DataProviders>(context);
    return Align(
      alignment: Alignment.center,
      child: IconButton(
        onPressed: () {
          dataProviders.setManuOpacity(true);
        },
        icon: Icon(
          Icons.menu,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
