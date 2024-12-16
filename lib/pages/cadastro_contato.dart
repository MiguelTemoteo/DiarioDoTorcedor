import 'package:flutter/material.dart';
import 'package:aula_913/bd/contato_dao.dart';
import 'package:aula_913/domain/contato.dart';
import 'package:aula_913/pages/contato_page.dart';

class CadastroContatoPage extends StatefulWidget {
  const CadastroContatoPage({super.key});

  @override
  _CadastroContatoPageState createState() => _CadastroContatoPageState();
}

class _CadastroContatoPageState extends State<CadastroContatoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _logoUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Contato'),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'titulo',
                  labelStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'coloque um titulo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'descricao do contato',
                  labelStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'colque uma descrição!!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _logoUrlController,
                decoration: const InputDecoration(
                  labelText: 'link da imagem',
                  labelStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'coloque um link';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _cadastrarContato,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cadastrarContato() {
    if (_formKey.currentState?.validate() ?? false) {
      final contato = Contato(
        title: _titleController.text,
        description: _descriptionController.text,
        logoUrl: _logoUrlController.text,
      );
      ContatoDao().salvarContato(contato).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('contato cadastrado')),
        );
        _titleController.clear();
        _descriptionController.clear();
        _logoUrlController.clear();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ContatoPage()),
        );
      }).catchError((error) {
        print('ERRO: $error');
      });
    }
  }
}
