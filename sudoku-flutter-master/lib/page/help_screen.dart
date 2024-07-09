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
        title: Text('SyS Ayuda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Si necesitas ayuda, llama a emergencias (112) o a violencia de género (016)",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _callNumber('112'),
                icon: Icon(Icons.phone, color: Colors.black),
                label: Text('Llamar al 112'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () => _callNumber('016'),
                icon: Icon(Icons.phone, color: Colors.yellow),
                label: Text('Llamar al 016'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "En la esquina inferior derecha de la página web se encuentra el chat online para violencia de género, acceda a la web:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () => _chatOnline(),
                icon: Icon(Icons.web, color: Colors.black),
                label: Text('Redirección chat online 016'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _closeApp(),
                icon: Icon(Icons.exit_to_app, color: Colors.white),
                label: Text('Salir rápido app'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ],
          ),
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
