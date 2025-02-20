import 'package:calculadoraimc1/model/imc_model.dart';
import 'package:flutter/material.dart';

class ResultadoCalculosImcPage extends StatefulWidget {
  const ResultadoCalculosImcPage({super.key});

  @override
  State<ResultadoCalculosImcPage> createState() =>
      _ResultadoCalculosImcPageState();
}

class _ResultadoCalculosImcPageState extends State<ResultadoCalculosImcPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Histórico de IMC",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Lista de resultados
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                var resultado = 0;

                return Dismissible(
                  key: Key("1"),
                  onDismissed: (direction) {
                    setState(() {
                      
                    });
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 3,
                    child: ListTile(
                      title: Text("Nome"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Altura: ${1} m"),
                              Text("Resultado IMC: ${1}"),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Peso: ${1} kg"),
                              Text("Peso normal"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}