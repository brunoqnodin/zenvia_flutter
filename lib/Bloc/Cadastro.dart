import 'package:flutter/material.dart';

class BlocCadastros {
  var controllerTelefone = TextEditingController();
  var controllerTitulo = TextEditingController();
  var controllerTexto = TextEditingController();

  Widget formulario(String nomeCampo, var controller, var tema, var tipo) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.deepOrange,
        controller: controller,
        keyboardType: tipo,
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: nomeCampo,
          labelStyle: TextStyle(color: Colors.white38),
          fillColor: Colors.deepOrange,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Color(0xFFEE7700),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Color(0xFFEE7700),
              width: 2.0,
            ),
          ),
        ),
        style: TextStyle(
          fontSize: 25,
          color: tema,
          fontFamily: "Big Shoulders Display",
        ),
      ),
    );
  }
}