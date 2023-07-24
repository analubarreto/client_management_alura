import 'package:clients/models/client_type.dart';
import 'package:flutter/material.dart';

class Types extends ChangeNotifier {
  List<ClientType> types;

  Types({required this.types});

  void addType(ClientType client) {
    types.add(client);
    notifyListeners();
  }

  void removeType(int index) {
    types.removeAt(index);
    notifyListeners();
  }
}