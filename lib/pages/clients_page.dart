import 'package:clients/components/create_client_dialog.dart';

import 'package:clients/models/clients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/hamburger_menu.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const HamburgerMenu(),
      body: Consumer<Clients>(
        builder: (BuildContext context, Clients clientsList, Widget? widget) {
          return ListView.builder(
            itemCount: clientsList.clients.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.redAccent),
                child: ListTile(
                  leading: Icon(clientsList.clients[index].type.icon),
                  title: Text('${clientsList.clients[index].name} (${clientsList.clients[index].type.name})'),
                  iconColor: Colors.indigo,
                ),
                onDismissed: (direction) {
                  clientsList.removeClient(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: (){createType(context);},
        tooltip: 'Add Tipo',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void createType(context) {
    TextEditingController nomeInput = TextEditingController();
    TextEditingController emailInput = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
          return CreateClient(nomeInput: nomeInput, emailInput: emailInput);
        }
      );
  }
}
