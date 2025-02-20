import 'package:calculadoraimc1/pages/imc_calculo_page.dart';
import 'package:calculadoraimc1/pages/resultado_calculos_imc_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                posicaoPagina = value;
              });
            },
            children: [
              ImcCalculoPage(),
              ResultadoCalculosImcPage(),
            ],
          )),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                  backgroundColor: Colors.blueAccent,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey[900],
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    controller.jumpToPage(value);
                  },
                  currentIndex: posicaoPagina,
                  items: [
                    BottomNavigationBarItem(
                      label: "Calcular",
                      icon: Icon(Icons.calculate_outlined),
                    ),
                    BottomNavigationBarItem(
                      label: "Histórico",
                      icon: Icon(Icons.history),
                    ),
                  ]),
            ),
          ),
        ],
      )),
    );
  }
}
