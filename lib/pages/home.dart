import 'package:flutter/material.dart';
import '../models.dart';
import '../main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // código


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cliente")),
      body: ListView.builder(
        itemCount: dados.length,
        itemBuilder: listTile
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "form");
          setState(() {  });
        },
        child: const Icon(Icons.add)
        ),
    );
  }

  Widget listTile(BuildContext context, index) {
    Clientes x = dados[index];

    return ListTile(
      title: Text(x.nome), 
      subtitle: Text(dados[index].toString()),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async {
        await Navigator.pushNamed(context, "form", arguments: index);
        setState(() {});
      }, 
    );
  }
}