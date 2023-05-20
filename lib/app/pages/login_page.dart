import 'package:app_educacao_financeira/app/DAO/dataBaseInMetas.dart';
import 'package:app_educacao_financeira/app/controller/controller.dart';
import 'package:app_educacao_financeira/app/data/home_dao.dart';
import 'package:flutter/material.dart';
import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/view/ModuloSelecao.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../DAO/Auths.dart';

import '../view/cadastroLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

}

void _exibirMensagemDeErro(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Erro de login"),
        content: Text("Nome de usuário ou senha inválido."),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final myControllerEmail = TextEditingController();
  final auths = Auths();

  final nome = TextEditingController();
  final senha = TextEditingController();

  static Usuario user = Usuario();

  void salvar() {
    setState(() {
      user.nome = nome.text.toString();
      user.senha =  senha.text.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[600],
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
              autofocus: false,
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
              height: 20,
            ),

            // TextFormField(
            //   controller: senha,
            //   autofocus: true,
            //   keyboardType: TextInputType.text,
            //   obscureText: true ,
            //   decoration: InputDecoration(
            //       labelText: "Senha",
            //       labelStyle: TextStyle(
            //         color: Colors.black38,
            //         fontWeight:FontWeight.w400,
            //         fontSize: 20,
            //       )
            //   ),
            //   style: TextStyle(
            //       fontSize: 20
            //   ),
            // ),
            // Container(
            //   height: 40,
            //   alignment: Alignment.centerRight,
            //   child: TextButton(
            //     child: Text(
            //       "Recuperar Senha"
            //     ),
            //     onPressed: () {},
            //   ),
            //   ),
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
                        "Login",
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
                  onPressed: () async {
                   // print(_formKey.currentState);
                    if (_formKey.currentState!.validate()) {
                        var valid = await Auths.loginAuths(nome.text.toString(), senha.text.toString());
                     //  var usuario = await buscarLogin(nome.text.toString(), senha.text.toString());

                         if(valid){
                           user = Auths.currentUser;
                           // user.nome = Auths.currentUser; usuario[0]["NOME"];
                           // user.senha =  usuario[0]["SENHA"];
                           // user.saldo =  usuario[0]["SALDO"];
                           // user.uuid = usuario[0]["UUID"];
                           print(user);
                           Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ModuloSelecao(user)));
                         }
                         else{
                           _exibirMensagemDeErro(context);
                         }
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: TextButton(
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro()))
                    },
                  ),
            ),
          ]),
        ),
      ),
    );
    return Container();
  }
}
