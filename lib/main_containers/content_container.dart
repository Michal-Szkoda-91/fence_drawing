import 'package:flutter/material.dart';

import '../widgets/content_container_widgets/planned_lenght.dart';

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
      child: Column(
        children: [
          const PlannedLenght(),
          Row(
            children: [
              Text(
                'Pozostało do końca',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Obecna długość ogrodzenia',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
