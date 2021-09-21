import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElementModel {
  String name;
  int lenght;
  Color color;
  String hexColor;
  IconData icon;
  int totalLenght;

  ElementModel({
    required this.name,
    required this.lenght,
    required this.color,
    required this.icon,
    required this.totalLenght,
    required this.hexColor,
  });
}

class ElementModelProvider with ChangeNotifier {
  List elemnt = [
    ElementModel(
      name: 'Przerwa',
      lenght: 20,
      color: Colors.red.shade800,
      hexColor: 'f00',
      icon: CommunityMaterialIcons.code_brackets,
      totalLenght: 0,
    ),
    ElementModel(
      name: 'Słupek',
      lenght: 20,
      color: Colors.black,
      hexColor: '000',
      icon: CommunityMaterialIcons.cube_outline,
      totalLenght: 0,
    ),
    ElementModel(
      name: 'Przęsło',
      lenght: 2000,
      color: Colors.white,
      hexColor: 'e0e0e0',
      icon: CommunityMaterialIcons.gate,
      totalLenght: 0,
    ),
    ElementModel(
      name: 'Brama',
      lenght: 4000,
      color: Colors.grey.shade600,
      hexColor: 'a19a9a',
      icon: CommunityMaterialIcons.gate_open,
      totalLenght: 0,
    ),
    ElementModel(
      name: 'Furtka',
      lenght: 1200,
      color: Colors.yellow,
      hexColor: 'ffee00',
      icon: CommunityMaterialIcons.door,
      totalLenght: 0,
    ),
    ElementModel(
      name: 'Furtka śmie.',
      lenght: 1200,
      color: Colors.orange.shade900,
      hexColor: 'ff8c12',
      icon: CommunityMaterialIcons.trash_can_outline,
      totalLenght: 0,
    ),
    ElementModel(
      name: 'Zawias',
      lenght: 50,
      color: Colors.green,
      hexColor: '00d612',
      icon: CommunityMaterialIcons.gate_arrow_right,
      totalLenght: 0,
    ),
    ElementModel(
      name: 'Klamka',
      lenght: 100,
      color: Colors.blue,
      hexColor: '0281e8',
      icon: CommunityMaterialIcons.format_text_wrapping_wrap,
      totalLenght: 0,
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

  void addElement(ElementModel el, int lenght) {
    createdElementlist.add(
      ElementModel(
        name: el.name,
        lenght: el.lenght,
        color: el.color,
        hexColor: el.hexColor,
        icon: el.icon,
        totalLenght: lenght,
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
  //
  //SLider metods//
  //
  //

  double sliderSensitive = 3;
  int divider = 8;

  double get getSliderSensitive {
    return sliderSensitive;
  }

  int get getDivider {
    return divider;
  }

  void setSliderSensitive(int val) {
    switch (val) {
      case 0:
        sliderSensitive = 0;
        divider = 1;
        break;
      case 1:
        sliderSensitive = 1;
        divider = 2;
        break;
      case 2:
        sliderSensitive = 2;
        divider = 4;
        break;
      case 3:
        sliderSensitive = 3;
        divider = 8;
        break;
      case 4:
        sliderSensitive = 4;
        divider = 16;
        break;
      case 5:
        sliderSensitive = 5;
        divider = 32;
        break;
      case 6:
        sliderSensitive = 6;
        divider = 64;
        break;
      default:
    }
    // sliderSensitive = val;
    notifyListeners();
  }
}
