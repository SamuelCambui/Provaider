import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:formulario_multiplas_etapas/model/providers/user_provider.dart';
import 'package:formulario_multiplas_etapas/view/primeira_etapa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Formulário Multi-etapas',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: PrimeiraEtapa(),
      ),
    );
  }
}
