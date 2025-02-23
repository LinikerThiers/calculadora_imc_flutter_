import 'package:calculadoraimc1/model/imc_model.dart';
import 'package:calculadoraimc1/repositories/imc_repository.dart';
import 'package:flutter/material.dart';

class ImcCalculoPage extends StatefulWidget {
  const ImcCalculoPage({super.key});

  @override
  State<ImcCalculoPage> createState() => _ImcCalculoPageState();
}

class _ImcCalculoPageState extends State<ImcCalculoPage> {
  ImcRepository imcRepository = ImcRepository();
  var imcs = <ImcModel>[];

  final _nomeController = TextEditingController();
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  String imcValor = "00.00";
  String imcStatus = "Aguardando cálculo...";

  void _calcularImc() async {
    final pesoText = _pesoController.text.trim().replaceAll(',', '.');
    final alturaText = _alturaController.text.trim().replaceAll(',', '.');

    final peso = double.tryParse(pesoText);
    final altura = double.tryParse(alturaText);
    final nome = _nomeController.text;

    if (peso != null && altura != null && altura > 0) {
      double alturaEmMetros = altura > 3 ? altura / 100 : altura;

      final imc = ImcModel.calcular(0, nome, peso, alturaEmMetros);

      setState(() {
        imcValor = imc.resultado.toStringAsFixed(2);
        imcStatus = imc.statusImc;
      });

      await imcRepository.salvar(imc);

      if (!mounted) return;

      _pesoController.clear();
      _alturaController.clear();
      _nomeController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Dados salvos com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Digite valores válidos para peso e altura!"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _limparCampos() {
    setState(() {
      imcValor = "00.00";
      imcStatus = "Aguardando cálculo...";
      _pesoController.clear();
      _alturaController.clear();
      _nomeController.clear();
    });
  }

  @override
  void dispose() {
    _pesoController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "lib/images/calc_imc_1.png",
                        height: 100,
                      ),
                      Text(
                        "Calculadora de IMC",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 35,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Insira seu nome:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  height: 35,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _nomeController,
                    onChanged: (value) {},
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      contentPadding: EdgeInsets.only(top: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blueAccent,
                      ),
                      hintText: "Nome",
                      hintStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 35,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Insira sua altura em m:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  height: 35,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      contentPadding: EdgeInsets.only(top: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.straighten,
                        color: Colors.blueAccent,
                      ),
                      hintText: "Altura",
                      hintStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 35,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Insira seu peso em Kg: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 35,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[50],
                      contentPadding: EdgeInsets.only(top: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Peso",
                      hintStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.fitness_center,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        _calcularImc();
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.blueAccent,
                        ),
                      ),
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Resultado:",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 13),
                      Text(
                        imcValor,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 13),
                      Text(
                        imcStatus,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueAccent[700],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: _limparCampos,
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.blue[50],
                        ),
                      ),
                      child: Text(
                        "Limpar",
                        style: TextStyle(
                          color: Colors.blueAccent[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
