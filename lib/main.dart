import 'package:clients/models/client.dart';
import 'package:clients/models/client_type.dart';
import 'package:clients/models/clients.dart';
import 'package:clients/models/types.dart';
import 'package:clients/pages/client_types_page.dart';
import 'package:flutter/material.dart';
import 'pages/clients_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Clients(clients: []),),
      ChangeNotifierProvider(create: (context) => Types(types: [
        ClientType(name: 'Platinum', icon: Icons.credit_card),
        ClientType(name: 'Golden', icon: Icons.card_membership),
        ClientType(name: 'Titanium', icon: Icons.credit_score),
        ClientType(name: 'Diamond', icon: Icons.diamond),
      ]),)
    ], child: const ClientControl()),
  );
}

class ClientControl extends StatelessWidget {
  const ClientControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de clientes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ClientsPage(title: 'Clientes'),
        '/tipos': (context) => const ClientTypesPage(title: 'Tipos de cliente'),
      },
    );
  }
}