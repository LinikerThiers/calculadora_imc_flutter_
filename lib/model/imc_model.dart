class ImcModel {
  int _id = 0;
  String _nome = "";
  double _peso = 0;
  double _altura = 0;
  double _resultado = 0;
  String _statusImc = "";

  ImcModel(this._id, this._nome, this._peso, this._altura, this._resultado, this._statusImc);

  ImcModel.calcular(this._id, this._nome, this._peso, this._altura) {
    _resultado = _peso / (_altura * _altura);
    _statusImc = resultadoImc(_resultado);
  }

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  double get peso => _peso;

  set peso(double peso) {
    _peso = peso;
  }

  double get altura => _altura;

  set altura(double altura) {
    _altura = altura;
  }

  double get resultado => _resultado;

  set resultado(double resultado) {
    _resultado = resultado;
  }

  String get statusImc => _statusImc;

  set statusImc(String statusImc) {
    _statusImc = statusImc;
  }

  String resultadoImc(double imcResultado) {
    if (imcResultado < 16) {
      return "Magreza grave";
    } else if (imcResultado < 17) {
      return "Magreza moderada";
    } else if (imcResultado < 18.5) {
      return "Magreza leve";
    } else if (imcResultado < 25) {
      return "Saudável";
    } else if (imcResultado < 30) {
      return "Sobrepeso";
    } else if (imcResultado < 35) {
      return "Obesidade Grau I";
    } else if (imcResultado < 40) {
      return "Obesidade Grau II (severa)";
    } else {
      return "Obesidade Grau III (móbida)";
    }
  }

}
