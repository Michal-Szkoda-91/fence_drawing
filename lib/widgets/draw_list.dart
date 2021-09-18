import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/element_model.dart';

class DrawList extends StatefulWidget {
  const DrawList({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawList> createState() => _DrawListState();
}

class _DrawListState extends State<DrawList> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    List data = Provider.of<ElementModelProvider>(context).createdElementList;
    return RawScrollbar(
      isAlwaysShown: true,
      thumbColor: Theme.of(context).cardColor,
      thickness: 12,
      radius: const Radius.circular(5),
      controller: _controller,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            width: data[index].lenght > 30 ? data[index].lenght * 1.0 / 10 : 30,
            child: Column(
              children: [
                Text(
                  data[index].lenght.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 15),
                ),
                Divider(
                  color: data[index].color,
                  thickness: 5,
                ),
                Icon(
                  data[index].icon,
                  color: data[index].color,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
