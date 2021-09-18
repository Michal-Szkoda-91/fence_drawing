import 'package:community_material_icon/community_material_icon.dart';
import 'package:fence_drawing/providers/content_row_porviders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElementModel {
  String name;
  int lenght;
  // var shape ????
  bool scalable;
  Color color;
  IconData icon;

  ElementModel({
    required this.name,
    required this.lenght,
    required this.scalable,
    required this.color,
    required this.icon,
  });

  void setLength(int val) {
    lenght = val;
  }

  void addLenght(BuildContext context) {
    var data = Provider.of<DataProviders>(context);
    int _lenght = data.actualLenght + lenght;
    data.setactualLenght(_lenght);
  }
}

class ElementModelProvider with ChangeNotifier {
  List elemnt = [
    ElementModel(
      name: 'Przerwa',
      scalable: false,
      lenght: 20,
      color: Colors.red,
      icon: CommunityMaterialIcons.code_brackets,
    ),
    ElementModel(
      name: 'Słupek',
      scalable: false,
      lenght: 20,
      color: Colors.black,
      icon: CommunityMaterialIcons.cube_outline,
    ),
    ElementModel(
      name: 'Przęsło',
      scalable: false,
      lenght: 2000,
      color: Colors.white,
      icon: CommunityMaterialIcons.gate,
    ),
    ElementModel(
      name: 'Brama',
      scalable: false,
      lenght: 4000,
      color: Colors.white38,
      icon: CommunityMaterialIcons.gate_open,
    ),
    ElementModel(
      name: 'Furtka',
      scalable: false,
      lenght: 1200,
      color: Colors.yellow,
      icon: CommunityMaterialIcons.door,
    ),
    ElementModel(
      name: 'Furtka - śmietnik',
      scalable: false,
      lenght: 1200,
      color: Colors.orange.shade900,
      icon: CommunityMaterialIcons.trash_can_outline,
    ),
    ElementModel(
      name: 'Zawias',
      scalable: false,
      lenght: 50,
      color: Colors.green,
      icon: CommunityMaterialIcons.gate_arrow_right,
    ),
    ElementModel(
      name: 'Klamka',
      scalable: false,
      lenght: 100,
      color: Colors.blue,
      icon: CommunityMaterialIcons.format_text_wrapping_wrap,
    ),
  ];

  List<ElementModel> get elementModelList {
    return [...elemnt];
  }
}
