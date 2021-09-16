import 'package:flutter/cupertino.dart';

class Datas {
  String plannedLenght;
  int plannedDivadedLenght;
  //
  String actualLenght;
  int actualLenghtDivadedLenght;

  Datas({
    required this.plannedDivadedLenght,
    required this.plannedLenght,
    required this.actualLenghtDivadedLenght,
    required this.actualLenght,
  });
}

class DataProviders with ChangeNotifier {
  final Datas _datas = Datas(
    plannedDivadedLenght: 2000,
    plannedLenght: '2000',
    actualLenghtDivadedLenght: 0,
    actualLenght: '0',
  );

  //if This first displayed row
  //
  //
  //
  String get plannedLenght {
    return _datas.plannedLenght;
  }

  setPlannedLenght(String length) {
    _datas.plannedLenght = length;
    notifyListeners();
  }

  int get plannedDividedLenght {
    return _datas.plannedDivadedLenght;
  }

  setPlannedDividedLenght(int length) {
    _datas.plannedDivadedLenght = length;
    notifyListeners();
  }

  //if This second displayed row
  //
  //
  //
  String get actualLenght {
    return _datas.actualLenght;
  }

  setactualLenght(String length) {
    _datas.actualLenght = length;
    notifyListeners();
  }

  int get actualLenghtDivadedLenght {
    return _datas.actualLenghtDivadedLenght;
  }

  setactualLenghtDivadedLenght(int length) {
    _datas.actualLenghtDivadedLenght = length;
    notifyListeners();
  }
}
