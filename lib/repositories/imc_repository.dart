import 'package:calculadoraimc1/model/imc_model.dart';
import 'package:calculadoraimc1/repositories/sqlitedatabase.dart';

class ImcRepository {
  Future<List<ImcModel>> obterDados() async {
    List<ImcModel> imcs = [];
    var db = await SQLiteDataBase().obterDataBase();

    try {
      var result = await db.rawQuery(
        'SELECT id, nome, peso, altura, resultado, statusImc FROM imc',
      );

      for (var e in result) {
        imcs.add(ImcModel(
          e["id"] as int,
          e["nome"] as String,
          e["peso"] as double,
          e["altura"] as double,
          e["resultado"] as double,
          e["statusImc"] as String,
        ));
      }
    } catch (e) {
      print("Erro ao obter dados do banco de dados: $e");
    }

    return imcs;
  }

  Future<void> salvar(ImcModel imcModel) async {
    var db = await SQLiteDataBase().obterDataBase();

    try {
      await db.rawInsert(
        'INSERT INTO imc (nome, peso, altura, resultado, statusImc) VALUES (?, ?, ?, ?, ?)',
        [
          imcModel.nome,
          imcModel.peso,
          imcModel.altura,
          imcModel.resultado,
          imcModel.statusImc,
        ],
      );
      print("Dados do IMC salvos com sucesso!");
    } catch (e) {
      print("Erro ao salvar dados do IMC: $e");
    }
  }

  Future<void> atualizar(ImcModel imcModel) async {
    var db = await SQLiteDataBase().obterDataBase();

    try {
      await db.rawUpdate(
        'UPDATE imc SET nome = ?, peso = ?, altura = ?, resultado = ?, statusImc = ? WHERE id = ?',
        [
          imcModel.nome,
          imcModel.peso,
          imcModel.altura,
          imcModel.resultado,
          imcModel.statusImc,
          imcModel.id,
        ],
      );
      print("Dados do IMC atualizados com sucesso!");
    } catch (e) {
      print("Erro ao atualizar dados do IMC: $e");
    }
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();

    try {
      await db.rawDelete(
        'DELETE FROM imc WHERE id = ?',
        [id],
      );
      print("Dados do IMC removidos com sucesso!");
    } catch (e) {
      print("Erro ao remover dados do IMC: $e");
    }
  }
}
