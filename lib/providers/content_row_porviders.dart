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
}
