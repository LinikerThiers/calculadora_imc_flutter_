import 'package:calculadoraimc1/model/imc_model.dart';
import 'package:calculadoraimc1/repositories/imc_repository.dart';
import 'package:flutter/material.dart';

class ResultadoCalculosImcPage extends StatefulWidget {
  const ResultadoCalculosImcPage({super.key});

  @override
  State<ResultadoCalculosImcPage> createState() =>
      _ResultadoCalculosImcPageState();
}

class _ResultadoCalculosImcPageState extends State<ResultadoCalculosImcPage> {
  ImcRepository imcRepository = ImcRepository();
  var imcs = <ImcModel>[];

  @override
  void initState() {
    super.initState();
    obterImcs();
  }

  void obterImcs() async {
    imcs = await imcRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
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
          Expanded(
            child: ListView.builder(
              itemCount: imcs.length,
              itemBuilder: (BuildContext context, int index) {
                var imc = imcs[index];

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Dismissible(
                    key: Key(imc.id.toString()),
                    onDismissed: (direction) {
                      setState(() {
                        imcs.removeAt(index);
                      });
                      imcRepository.remover(imc.id);
                    },
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    child: Card(
                        color: Colors.blueAccent,
                        margin: const EdgeInsets.all(10),
                        elevation: 3,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                imc.nome,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.balance,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Altura: ${imc.altura.toStringAsFixed(2)} m",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16, 
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Resultado IMC: ${imc.resultado.toStringAsFixed(2)}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16, 
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Peso: ${imc.peso.toStringAsFixed(2)} kg",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        imc.statusImc,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
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
