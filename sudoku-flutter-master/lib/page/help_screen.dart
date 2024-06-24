// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Si necesitas ayuda, llama a emergencias (112) o a violencia de género (016)"),
            ElevatedButton(
              onPressed: () => _callNumber('112'),
              child: Text('Llamar al 112'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
            ),
            ElevatedButton(
              onPressed: () => _callNumber('016'),
              child: Text('Llamar al 016'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
            ),
            Text(
                "En la esquina inferior derecha de la página web se encuentra el chat online para violencia de género, acceda a la web:"),
            ElevatedButton(
              onPressed: () => _chatOnline(),
              child: Text('Redirección chat online 016'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () => _closeApp(),
              child: Text('Salir rápido app'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _callNumber(String number) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  _chatOnline() async {
    const url = 'https://violenciagenero.igualdad.gob.es/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _closeApp() {
    exit(0);
  }
}
