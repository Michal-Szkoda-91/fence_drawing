import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataProviders = Provider.of<DataProviders>(context);
    return Positioned(
      right: 10,
      top: 20,
      child: dataProviders.menuOpacity
          ? MouseRegion(
              onExit: (event) {
                dataProviders.setManuOpacity(false);
              },
              child: Container(
                width: 250,
                height: 350,
                color: Theme.of(context).cardColor,
              ),
            )
          : const Center(),
    );
  }
}
