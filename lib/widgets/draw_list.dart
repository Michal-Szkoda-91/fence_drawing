import 'package:fence_drawing/providers/content_row_porviders.dart';
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
  @override
  Widget build(BuildContext context) {
    List data =
        Provider.of<ElementModelProvider>(context).createdElementListget;
    final _controller = Provider.of<DataProviders>(context).getController;

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
          return Row(
            children: [
              SizedBox(
                width: data[index].lenght *
                        1.0 /
                        Provider.of<ElementModelProvider>(context).getDivider +
                    43,
                child: Column(
                  children: [
                    Text(
                      (index + 1).toString(),
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data[index].lenght.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Divider(
                      color: data[index].color,
                      thickness: 5,
                    ),
                    Icon(
                      data[index].icon,
                      color: data[index].color,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data[index].totalLenght.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 16, letterSpacing: 0.3),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
