import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:formulario_multiplas_etapas/model/user.dart';
import 'package:formulario_multiplas_etapas/model/providers/user_provider.dart';
import 'package:formulario_multiplas_etapas/view/primeira_etapa.dart';

class TerceiraEtapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Etapa 3'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue, // Cor de fundo do AppBar
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          constraints: BoxConstraints(maxWidth: 400.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os elementos horizontalmente
            children: [
              Text(
                'Por favor, revise seus dados:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Centraliza o texto horizontalmente
              ),
              SizedBox(height: 20.0),
              _buildInfoRow('Nome:', user.name),
              _buildInfoRow('Email:', user.email),
              _buildInfoRow('Senha:', '*' * user.password.length), // Exibe "*" no lugar da senha
              _buildInfoRow('País:', user.country), // Novo campo "País"
              _buildInfoRow('Cidade:', user.city), // Novo campo "Cidade"
              _buildInfoRow('CEP:', user.cep),
              _buildInfoRow('Endereço:', user.address),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza os botões horizontalmente
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700], // Cor do botão Voltar
                    ),
                    child: Text(
                      'Voltar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20.0), // Adiciona espaçamento entre os botões
                  ElevatedButton(
                    onPressed: () {
                      // Mostrar um alerta de cadastro concluído com sucesso
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Cadastro concluído'),
                          content: Text('Seu cadastro foi concluído com sucesso!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Limpar os campos após o submit final
                                Provider.of<UserProvider>(context, listen: false).updateUser(User(
                                  name: '',
                                  email: '',
                                  password: '',
                                  country: '',
                                  city: '',
                                  cep: '',
                                  address: '',
                                ));
                                // Navegar de volta para a tela inicial
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (_) => PrimeiraEtapa()),
                                  (route) => false, // Limpar todas as rotas anteriores
                                );
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Cor do botão Enviar
                    ),
                    child: Text(
                      'Enviar',
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10.0),
          Text(
            '$value',
          ),
        ],
      ),
    );
  }
}
