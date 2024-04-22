import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:formulario_multiplas_etapas/model/user.dart';
import 'package:formulario_multiplas_etapas/model/providers/user_provider.dart';
import 'package:formulario_multiplas_etapas/view/segunda_etapa.dart';

class PrimeiraEtapa extends StatefulWidget {
  @override
  _PrimeiraEtapaState createState() => _PrimeiraEtapaState();
}

class _PrimeiraEtapaState extends State<PrimeiraEtapa> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null; // Retorna null se o valor não estiver vazio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etapa 1'),
        backgroundColor: Colors.blue, // Cor de fundo do AppBar
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: requiredValidator,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: requiredValidator,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: requiredValidator,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    User user = User(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      country: '',
                      city: '',
                      cep: '',
                      address: '',
                    );
                    Provider.of<UserProvider>(context, listen: false).updateUser(user);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SegundaEtapa()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cor de fundo do botão
                ),
                child: Text(
                  'Próximo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}