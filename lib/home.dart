import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String atual = "0";

  void valorBtc() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      atual = retorno ["BRL"]["buy"].toString();
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/bitcoin.png"),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Text("R\$ " + atual.toString(),
              style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold
              ),
                ),
            ),
            RaisedButton(onPressed: valorBtc,
            child: Text("Atualizar"),
              color: Colors.orange,
            )
          ],
        ),
      ),

    );
  }
}
