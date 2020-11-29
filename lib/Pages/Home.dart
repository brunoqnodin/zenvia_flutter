import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenteste/Bloc/Cadastro.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var bloc = BlocCadastros();

  Future<http.Response> enviarZap() {
    return http.post(
      'https://api.zenvia.com/v2/channels/whatsapp/messages',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'x-api-token': 'Qm8wQrwu3-OWXYAMhZXkYVw-t2-k71-O8ZbG',
        'cache-control': 'no-cache',
      },
      body: jsonEncode({
        "from": "zesty-antlion",
        "to": bloc.controllerTelefone.text,
        "contents": [{
          "type": "text",
          "text": bloc.controllerTexto.text
        }]
      }),
    );
  }

  _apagarCampos(){
    bloc.controllerTelefone.clear();
    bloc.controllerTexto.clear();
    bloc.controllerTitulo.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ZenAPI",
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                ),
                Text(
                  "Manda aquela mensagem boladona marmão!",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: TextFormField(
                    cursorColor: Colors.blueGrey,
                    controller: bloc.controllerTelefone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Numero de ZapZap",
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      fillColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: TextFormField(
                    cursorColor: Colors.blueGrey,
                    controller: bloc.controllerTexto,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: "Texto Fodastico",
                      contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      fillColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [Colors.blueGrey, Colors.blue],
                      ),
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        onPressed: () {
                          enviarZap();
                          return showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context){
                                return AlertDialog(
                                  title: Text("Mensagem enviada"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: (){
                                        _apagarCampos();
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              }
                          );
                        },
                        child: Text(
                          "ENVIAR MENSAGEM",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.blueGrey),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  child: DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text("Chama do Zap Carai", style: TextStyle(height: 6,color: Colors.white70),),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                child: FlatButton.icon(
                  textColor: Colors.white70,
                  onPressed: () {},
                  icon: Icon(Icons.home),
                  label: Text("      Home"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.white70,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                child: FlatButton.icon(
                  textColor: Colors.white70,
                  onPressed: () {},
                  icon: Icon(Icons.help),
                  label: Text("     Como Funcionamos"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.white70,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                child: FlatButton.icon(
                  textColor: Colors.white70,
                  onPressed: () {},
                  icon: Icon(Icons.phone_in_talk),
                  label: Text("     Sugestões"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.white70,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                child: FlatButton.icon(
                  textColor: Colors.white70,
                  onPressed: () {},
                  icon: Icon(Icons.chat),
                  label: Text("     Fale Conosco"),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: ,
    );
  }
}
