import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(resultado),
      const EmAlta(),
      const Inscricao(),
      const Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/youtube.png", width: 98, height: 22),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              String? res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                resultado = res!;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(label: 'Início', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Em alta', icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              label: 'Inscrições', icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              label: 'Biblioteca', icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
