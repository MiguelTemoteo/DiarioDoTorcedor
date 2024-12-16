import'package:aula_913/domain/contato.dart';
import 'package:aula_913/bd/db_helper.dart';
import 'package:sqflite/sqflite.dart';
class ContatoDao {
  Future<void> salvarContato(Contato contato) async {
    try {
      Database database = await DBHelper().initDB();
      await database.insert('CONTATOS', contato.toJson());
    } catch (e) {
      print('Erro ao salvar o contato : $e');
    }
  }
  Future<List<Contato>> listarContatos() async {
    Database database = await DBHelper().initDB();
    String sql = 'SELECT * FROM CONTATOS;';
    var result = await database.rawQuery(sql);
    List<Contato> lista = [];
    for (var json in result) {
      Contato contato = Contato.fromJson(json);
      lista.add(contato);
    }
    return lista;
  }
}
