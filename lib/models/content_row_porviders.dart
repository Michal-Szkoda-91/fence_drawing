import 'package:flutter/cupertino.dart';

class Datas {
  int plannedLenght;
  int actualLenght;

  Datas({
    required this.plannedLenght,
    required this.actualLenght,
  });
}

class DataProviders with ChangeNotifier {
  final Datas _datas = Datas(
    plannedLenght: 20000,
    actualLenght: 0,
  );

  void addActualLenght(int lenght) {
    _datas.actualLenght += lenght;
    notifyListeners();
  }

  void clearActualLength() {
    _datas.actualLenght = 0;
    notifyListeners();
  }

  void substringLastElementLenght(int lenght) {
    _datas.actualLenght -= lenght;
    notifyListeners();
  }

  //PlannedLength
  ///////////////////////////////////////////////////////////////
  int get plannedLenght {
    return _datas.plannedLenght;
  }

  setPlannedLenght(int length) {
    _datas.plannedLenght = length;
    notifyListeners();
  }

  // Till end length
  ///////////////////////////////////////////////////////////////
  int get tillEndLenght {
    return plannedLenght - actualLenght;
  }

  //Actual Length
  ///////////////////////////////////////////////////////////////
  int get actualLenght {
    return _datas.actualLenght;
  }

  setactualLenght(int length) {
    _datas.actualLenght = length;
    notifyListeners();
  }

  //Title providers
  //
  //
  //
  String title = "Płot nr 1";
  String get getTitle {
    return title;
  }

  void setTitle(String val) {
    title = val;
    notifyListeners();
  }

  //
  //
  // menu opacity
  bool menuOpacity = false;
  bool get getOpcity {
    return menuOpacity;
  }

  void setManuOpacity(bool opacity) {
    menuOpacity = opacity;
    notifyListeners();
  }

  //
  //
  // saveFile opacity
  bool saveFileOpacity = false;
  bool get getsaveFileOpcity {
    return saveFileOpacity;
  }

  void setsaveFileOpacity(bool opacity) {
    saveFileOpacity = opacity;
    notifyListeners();
  }

  //
  //
  //Controller of drawing list
  final ScrollController _controller = ScrollController();
  ScrollController get getController {
    return _controller;
  }

  void jumpToScroll(int val) {
    _controller.animateTo(
      (_controller.position.maxScrollExtent + val + 43),
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }
}
