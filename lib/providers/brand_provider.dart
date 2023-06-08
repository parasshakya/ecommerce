
import 'package:flutter/material.dart';

class BrandProvider extends ChangeNotifier {
  List<String> _brands = [];

  List<String> get brands => _brands;

  void setBrand(String brand) {

    _brands.add(brand);
    notifyListeners();
  }

}
