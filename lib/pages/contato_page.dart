import 'package:flutter/material.dart';
import 'package:aula_913/bd/contato_dao.dart';
import 'package:aula_913/domain/contato.dart';
import 'package:aula_913/pages/cadastro_contato.dart';
class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key});
  @override
  _ContatoPageState createState() => _ContatoPageState();
}
class _ContatoPageState extends State<ContatoPage> {
  List<Contato> contatos = [];
  @override
  void initState() {
    super.initState();
    _loadContatos();
  }
  void _loadContatos() async {
    List<Contato> lista = await ContatoDao().listarContatos();
    setState(() {
      contatos = lista;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Contatoss'),
    backgroundColor: Colors.green[900],
    ),
    body: contatos.isEmpty
    ? const Center(child: CircularProgressIndicator())
    : ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: contatos.length,
          itemBuilder: (context, index) {
            final contato = contatos[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(
                  contato.logoUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                title: Text(contato.title),
                subtitle: Text(contato.description),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CadastroContatoPage()),
            );
          },
        )
      ],
    ),
    );
  }
}
