import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../DAO/SCRIPT_IN_METAS_BASE.dart';
import '../DAO/dataBaseInMetas.dart';
import '../pages/login_page.dart';
import 'package:uuid/uuid.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();

  final nome = TextEditingController();

  final senha = TextEditingController();

  void cadastrar() {
    setState(() {
      Uuid uuid = Uuid();
      String myUuid = uuid.v4();
      SalvarUsuario(
        myUuid,
        nome.text.toString(),
        senha.text.toString(),
        0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child: ListView(children: <Widget>[
            SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/imagens/logo.png")),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nome,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: senha,
              autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFF00C853),
                    Color(0xFF2E7D32),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/imagens/bone.png"),
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    print(_formKey.currentState);
                    if (_formKey.currentState!.validate()) {
                      cadastrar();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
