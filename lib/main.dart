import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode entrar!";
  
  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if(_people < 0)  {
        _infoText = "Mundo invertido?!";
      } else if (_people <= 10) {
        _infoText = "Pode entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // este widget (stack) serve para colocar widgets sobre outras (sobreposição)
      children: [
        Image.asset(
          // chamar imagem carregada no arquivo pubspec.yaml com o caminho da imagem
          "images/restaurant.jpeg", // caminho + nome da imagem (importante verificar os arquivos que o Flutter da suporte)
          fit: BoxFit
              .cover, // como a imagem irá se comportar na tela, neste caso irá cobrir (cover) toda a tela
          height:
              1000.0, // tamanho utilizado para a imagem pegar toda a tela (verificar outra forma mais simples)
        ),
        Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // alinhando o widget column no centro
          children: [
            Text(
              // inserindo um widget do tipo texto
              "Pessoas : $_people", // informando o texto do widget
              style: TextStyle(
                // colocando um estilo no texto
                color: Colors.white, // colocando a cor do texto
                fontWeight: FontWeight
                    .bold, // colocando o tamanho do texto para negrito
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  // widget para colocar espaço ao redor do widget
                  padding: EdgeInsets.all(
                      10.0), // como irá funcionar o espaçamento do padding
                  child: TextButton(
                      onPressed: () {
                        _changePeople(1);
                        // debugPrint("+1"); // Forma para inserir um print de debug no terminal
                      }, // chamada que o botão irá realizar após o clique
                      child: Text(
                        "+1", // texto do botão
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white), // estilo do texto
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        _changePeople(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle
                      .italic, // colocando o estilo do texto para itálico
                  fontSize: 30.0 // colocando o tamanho da fonte para 30.0
                  ),
            )
          ],
        )
      ],
    );
  }
}
