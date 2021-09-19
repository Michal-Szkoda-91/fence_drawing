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
    List data = Provider.of<ElementModelProvider>(context).createdElementListget;
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
                width: data[index].lenght * 1.0 / 40 + 20,
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
                          .copyWith(fontSize: 15),
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
                  ],
                ),
              ),
              Container(
                height: 60,
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
