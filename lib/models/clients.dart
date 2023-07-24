import 'package:clients/models/client.dart';
import 'package:flutter/material.dart';

class Clients extends ChangeNotifier {
  List<Client> clients;

  Clients({required this.clients});

  void addClient(Client client) {
    clients.add(client);
    notifyListeners();
  }

  void removeClient(int index) {
    clients.removeAt(index);
    notifyListeners();
  }
}