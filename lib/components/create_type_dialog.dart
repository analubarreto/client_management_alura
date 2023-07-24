import 'package:clients/models/client_type.dart';
import 'package:clients/models/types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/icon_picker.dart';

class CreateType extends StatelessWidget {
  final TextEditingController nomeInput;

  const CreateType({required this.nomeInput, super.key});

  @override
  Widget build(BuildContext context) {
    IconData? selectedIcon;

    return AlertDialog(
      scrollable: true,
      title: const Text('Cadastrar tipo'),
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
              StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                return Column(children: [
                  const Padding(padding: EdgeInsets.all(5)),
                  selectedIcon != null ? Icon(selectedIcon, color: Colors.deepOrange) : const Text('Selecione um ícone'),
                  const Padding(padding: EdgeInsets.all(5)),
                  SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                        onPressed: () async {
                          final IconData? result = await showIconPicker(context: context, defalutIcon: selectedIcon);
                          setState(() {
                            selectedIcon = result;
                          });
                        },
                        child: const Text('Selecionar icone')
                    ),
                  ),
                ]);
              }),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Salvar"),
          onPressed: () {
            selectedIcon ??= Icons.credit_score;
            ClientType clientTyoe = ClientType(name: nomeInput.text, icon: selectedIcon);
            Provider.of<Types>(context, listen: false).addType(clientTyoe);
            selectedIcon = null;
            Navigator.pop(context);
          }
        ),
        TextButton(
          child: const Text("Calcelar"),
          onPressed: () async {
            selectedIcon = null;
            Navigator.pop(context);
          }
        )
      ],
    );
  }
}
