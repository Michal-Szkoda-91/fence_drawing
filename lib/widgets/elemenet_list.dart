import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/content_row_porviders.dart';
import '../models/element_model.dart';

class ElementList extends StatefulWidget {
  const ElementList({
    Key? key,
  }) : super(key: key);

  @override
  State<ElementList> createState() => _ElementListState();
}

class _ElementListState extends State<ElementList> {
  static final RegExp _numberRegExp = RegExp(r'^[0-9]+$');
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    List data = Provider.of<ElementModelProvider>(context).elementModelList;
    return RawScrollbar(
      isAlwaysShown: true,
      thumbColor: Theme.of(context).cardColor,
      thickness: 12,
      radius: const Radius.circular(5),
      controller: _controller,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 10),
        controller: _controller,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                splashColor: Theme.of(context).backgroundColor,
                hoverColor: Colors.black26,
                onTap: () {
                  Provider.of<ElementModelProvider>(context, listen: false)
                      .addElement(data[index]);
                  Provider.of<DataProviders>(context, listen: false)
                      .addActualLenght(data[index].lenght);
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: 140,
                        child: Text(
                          data[index].name,
                          style: Theme.of(context).textTheme.headline4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        data[index].icon,
                        color: data[index].color,
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          initialValue: data[index].lenght.toString(),
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                  ),
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(11),
                            isDense: true,
                            //Genereal settings
                            fillColor: Theme.of(context).cardColor,
                            filled: true,
                            //specific settings
                            errorStyle: Theme.of(context).textTheme.headline3,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 3,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).backgroundColor,
                                width: 3,
                              ),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Uzupłnij dane';
                            } else if (_numberRegExp.hasMatch(value)) {
                              return null;
                            } else {
                              return 'Tylko cyfry!';
                            }
                          },
                          onChanged: (val) {
                            if (_numberRegExp.hasMatch(val)) {
                              Provider.of<ElementModelProvider>(context,
                                      listen: false)
                                  .setLenght(int.parse(val), index);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'mm',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
