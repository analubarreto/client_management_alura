import 'package:clients/models/client_type.dart';
import 'package:clients/models/clients.dart';
import 'package:clients/models/types.dart';
import 'package:flutter/material.dart';

import 'package:clients/models/client.dart';
import 'package:provider/provider.dart';

class CreateClient extends StatelessWidget {
  final TextEditingController nomeInput;
  final TextEditingController emailInput;

  const CreateClient({ required this.nomeInput, required this.emailInput, super.key});

  @override
  Widget build(BuildContext context) {
    Types listTypes = Provider.of<Types>(context, listen: false);
    ClientType dropdownValue = listTypes.types[0];

    return AlertDialog(
      scrollable: true,
      title: const Text('Cadastrar cliente'),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: nomeInput,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  icon: Icon(Icons.account_box),
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              TextFormField(
                controller: emailInput,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                return DropdownButton(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: const Icon(Icons.expand_more),
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.indigo,
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue as ClientType;
                    });
                  },
                  items: listTypes.types.map((ClientType type) {
                    return DropdownMenuItem<ClientType>(
                      value: type,
                      child: Text(type.name),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
      actions: [
        Consumer<Clients>(
          builder: (BuildContext context, Clients clientsList, Widget? widget) {
            return Row(
              children: [
                TextButton(
                  child: const Text("Salvar"),
                  onPressed: () async {
                    Client client = Client(name: nomeInput.text, email: emailInput.text, type: dropdownValue);
                    clientsList.addClient(client);
                    Navigator.pop(context);
                  }
                ),
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),
              ],
            );
          }
        )
      ],
    );
  }
}
