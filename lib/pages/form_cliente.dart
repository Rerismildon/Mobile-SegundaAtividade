import 'package:flutter/material.dart';
import '../models.dart';
import '../main.dart';

class FormCliente extends StatefulWidget {
  const FormCliente({super.key});

  @override
  State<StatefulWidget> createState()=> _FormClienteState();
}

class _FormClienteState extends State<Form> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _endereco = TextEditingController();
  final TextEditingController _data = TextEditingController();
  final TextEditingController _telefone = TextEditingController();

  @override
  Widget build(BuildContext context) { 
    int index=-1;

    if(ModalRoute.of(context)!.settings.arguments != null) {
      index = ModalRoute.of(context)!.settings.arguments as int;

      setState(() {
        _nome.text = dados[index].nome;
        _email.text = dados[index].email;
        _endereco.text = dados[index].endereco;
        _data.text = dados[index].data;
        _telefone.text = dados[index].telefone;
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Form")),
      body: Column(
        children: <Widget>[
          const Text("Nome"),
          TextField(controller: _nome),

          const Text("Valor"),
          TextField(controller: _email),

          const Text("Endereco"),
          TextField(controller: _endereco),

          const Text("Data de Nascimento"),
          TextField(controller: _data),

          const Text("Telefone"),
          TextField(controller:_telefone),

          ElevatedButton(onPressed: () => setState(() {
            if(index > -1) {
              dados[index].nome = _nome.text;
              dados[index].email = _email.text;
              dados[index].endereco = _endereco.text;
              dados[index].data = _data.text;
              dados[index].telefone = _telefone.text;
            }else{
              dados.add(Clientes(_nome.text, _email.text,  _endereco.text, _data.text, _telefone.text));
            }
            Navigator.pop(context, true);
          }), child: const Text("Salvar")),
          
          ElevatedButton(onPressed: () => setState(() {
            dados.removeAt(index);
            Navigator.pop(context);
          }), child: const Text("Excluir"))     
        ],
      ),
    );
  }
}