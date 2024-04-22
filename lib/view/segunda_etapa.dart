import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:formulario_multiplas_etapas/model/user.dart';
import 'package:formulario_multiplas_etapas/model/providers/user_provider.dart';
import 'package:formulario_multiplas_etapas/view/terceira_etapa.dart';

class SegundaEtapa extends StatefulWidget {
  @override
  _SegundaEtapaState createState() => _SegundaEtapaState();
}

class _SegundaEtapaState extends State<SegundaEtapa> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etapa 2'),
        backgroundColor: Colors.blue,
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
                controller: countryController,
                decoration: InputDecoration(
                  labelText: 'País',
                  border: OutlineInputBorder(),
                ),
                validator: requiredValidator,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  border: OutlineInputBorder(),
                ),
                validator: requiredValidator,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: cepController,
                decoration: InputDecoration(
                  labelText: 'CEP',
                  border: OutlineInputBorder(),
                ),
                validator: requiredValidator,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Endereço',
                  border: OutlineInputBorder(),
                ),
                validator: requiredValidator,
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                    ),
                    child: Text(
                      'Voltar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        User currentUser = Provider.of<UserProvider>(context, listen: false).user;
                        currentUser.cep = cepController.text;
                        currentUser.address = addressController.text;
                        currentUser.country = countryController.text;
                        currentUser.city = cityController.text;
                        Provider.of<UserProvider>(context, listen: false).updateUser(currentUser);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => TerceiraEtapa()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Próximo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
