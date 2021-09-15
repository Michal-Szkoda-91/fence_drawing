import 'package:flutter/cupertino.dart';

class Datas {
  String plannedLenght;
  int plannedDivadedLenght;

  Datas({
    required this.plannedDivadedLenght,
    required this.plannedLenght,
  });
}

class DataProviders with ChangeNotifier {
  final Datas _datas = Datas(plannedDivadedLenght: 2000, plannedLenght: '2000');

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
}
