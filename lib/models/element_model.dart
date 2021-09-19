import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElementModel {
  String name;
  int lenght;
  Color color;
  IconData icon;

  ElementModel({
    required this.name,
    required this.lenght,
    required this.color,
    required this.icon,
  });
}

class ElementModelProvider with ChangeNotifier {
  List elemnt = [
    ElementModel(
      name: 'Przerwa',
      lenght: 20,
      color: Colors.red.shade800,
      icon: CommunityMaterialIcons.code_brackets,
    ),
    ElementModel(
      name: 'Słupek',
      lenght: 20,
      color: Colors.black,
      icon: CommunityMaterialIcons.cube_outline,
    ),
    ElementModel(
      name: 'Przęsło',
      lenght: 2000,
      color: Colors.white,
      icon: CommunityMaterialIcons.gate,
    ),
    ElementModel(
      name: 'Brama',
      lenght: 4000,
      color: Colors.grey.shade600,
      icon: CommunityMaterialIcons.gate_open,
    ),
    ElementModel(
      name: 'Furtka',
      lenght: 1200,
      color: Colors.yellow,
      icon: CommunityMaterialIcons.door,
    ),
    ElementModel(
      name: 'Furtka - śmietnik',
      lenght: 1200,
      color: Colors.orange.shade900,
      icon: CommunityMaterialIcons.trash_can_outline,
    ),
    ElementModel(
      name: 'Zawias',
      lenght: 50,
      color: Colors.green,
      icon: CommunityMaterialIcons.gate_arrow_right,
    ),
    ElementModel(
      name: 'Klamka',
      lenght: 100,
      color: Colors.blue,
      icon: CommunityMaterialIcons.format_text_wrapping_wrap,
    ),
  ];

  void setLenght(int lenght, int index) {
    elemnt[index].lenght = lenght;
    notifyListeners();
  }

  List<ElementModel> get elementModelList {
    return [...elemnt];
  }

  List createdElementlist = [];

  List<ElementModel> get createdElementListget {
    return [...createdElementlist];
  }

  void addElement(ElementModel el) {
    createdElementlist.add(
      ElementModel(
        name: el.name,
        lenght: el.lenght,
        color: el.color,
        icon: el.icon,
      ),
    );
    notifyListeners();
  }

  void clearCreatedList() {
    createdElementlist.clear();
    notifyListeners();
  }

  void removeLastElement() {
    createdElementlist.removeLast();
    notifyListeners();
  }
}
