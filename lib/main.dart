import 'package:app_educacao_financeira/app/controller/controller.dart';
import 'package:app_educacao_financeira/app/routes/app_routes.dart';
import 'package:app_educacao_financeira/app/pages/login_page.dart';
import 'package:app_educacao_financeira/app/routes/app_pages.dart';
import 'package:app_educacao_financeira/app/view/ModuloSelecao.dart';
import 'package:app_educacao_financeira/app/view/ResultadoQuiz.dart';
import 'package:app_educacao_financeira/app/view/quiz.dart';
import 'package:flutter/material.dart';
import 'package:app_educacao_financeira/app/controller/controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/model/homeModel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        AppRouter.LOGIN: (_) => LoginPage(),
      },
    );
  }
}
