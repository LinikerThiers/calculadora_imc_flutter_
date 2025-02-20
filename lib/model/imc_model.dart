class ImcModel {
  final int? id;
  final String nome;
  final double peso;
  final double altura;

  ImcModel({this.id, required this.nome, required this.peso, required this.altura});

  double calcularImc() {
    return peso / (altura * altura);
  }

  String resultadoImc() {
    double imcResultado = calcularImc();
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'peso': peso,
      'altura': altura,
      'resultado': calcularImc(),
      'resultadoImc': resultadoImc(),
    };
  }

  factory ImcModel.fromMap(Map<String, dynamic> map) {
    return ImcModel(
      id: map['id'],
      nome: map['nome'],
      peso: map['peso'],
      altura: map['altura'],
    );
  }
}