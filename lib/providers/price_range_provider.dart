
import 'package:flutter/material.dart';

class PriceRangeProvider extends ChangeNotifier{

  String _lowPrice = '';
  String _highPrice = '';

   void setLowPrice(String lowPrice){
    _lowPrice = lowPrice;
     notifyListeners();
  }

  void setHighPrice(String highPrice){
    _highPrice = highPrice;
    notifyListeners();
  }

  String get lowPrice => _lowPrice;

  String get highPrice => _highPrice;





}