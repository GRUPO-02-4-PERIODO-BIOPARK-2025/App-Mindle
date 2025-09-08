import 'package:flutter/material.dart';
import 'package:midleapp/screens/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _estudaTrabalhaController =
      TextEditingController();
  final TextEditingController _tipoUsuarioController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();
  final TextEditingController _qualidadeSonoController =
      TextEditingController();
  final TextEditingController _moraSozinhoController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF70CFFF), Color(0xFFC48DEF), Color(0xFFDD88E7)],
          ),
        ),
        padding: const EdgeInsets.only(
          top: 64,
          left: 32,
          right: 32,
          bottom: 64,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: ShaderMask(
                              shaderCallback: (bounds) =>
                                  const LinearGradient(
                                    colors: [
                                      Color(0xFF6D24FF),
                                      Color(0xFFFF00E1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(
                                    Rect.fromLTWH(
                                      0,
                                      0,
                                      bounds.width,
                                      bounds.height,
                                    ),
                                  ),
                              child: const Text(
                                'Termômetro de Emoções',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),
                          ShaderMask(
                            shaderCallback: (bounds) =>
                                const LinearGradient(
                                  colors: [
                                    Color(0xFF6D24FF),
                                    Color(0xFFFF00E1),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(
                                  Rect.fromLTWH(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                ),
                            child: const Text(
                              'Monitore seu bem estar emocional',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 77, 76, 76),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _nomeController,
                        decoration: inputDecoration('Nome'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _emailController,
                        decoration: inputDecoration('Email'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        obscureText: true,
                        controller: _senhaController,
                        decoration: inputDecoration('Senha'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _idadeController,
                        keyboardType: TextInputType.number,
                        decoration: inputDecoration('Idade'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: null,
                        items: ['Trabalha', 'Estuda', 'Ambos']
                            .map(
                              (opcao) => DropdownMenuItem(
                                value: opcao,
                                child: Text(opcao),
                              ),
                            )
                            .toList(),
                        onChanged: (valor) {
                          _estudaTrabalhaController.text = valor!;
                        },
                        decoration: inputDecoration('Você trabalha ou estuda?'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: null,
                        items: ['Aluno', 'Colaborador']
                            .map(
                              (opcao) => DropdownMenuItem(
                                value: opcao,
                                child: Text(opcao),
                              ),
                            )
                            .toList(),
                        onChanged: (valor) {
                          _tipoUsuarioController.text = valor!;
                        },
                        decoration: inputDecoration('Tipo de Usuário'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: null,
                        items: ['Boa', 'Média', 'Ruim']
                            .map(
                              (opcao) => DropdownMenuItem(
                                value: opcao,
                                child: Text(opcao),
                              ),
                            )
                            .toList(),
                        onChanged: (valor) {
                          _qualidadeSonoController.text = valor!;
                        },
                        decoration: inputDecoration('Qualidade do Sono'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: null,
                        items: ['Sim', 'Não']
                            .map(
                              (opcao) => DropdownMenuItem(
                                value: opcao,
                                child: Text(opcao),
                              ),
                            )
                            .toList(),
                        onChanged: (valor) {
                          _moraSozinhoController.text = valor!;
                        },
                        decoration: inputDecoration('Mora sozinho?'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _hobbiesController,
                        decoration: inputDecoration('Hobbies'),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 77, 76, 76),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6D24FF), Color(0xFFFF00E1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            final idade = int.tryParse(_idadeController.text);
                            if (idade == null || idade < 0 || idade > 110) {
                              const snackBar = SnackBar(
                                content: Text(
                                  'Idade inválida. Digite um valor entre 0 e 110.',
                                ),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);
                              return;
                            }

                            authService
                                .cadastrarUsuario(
                                  email: _emailController.text,
                                  senha: _senhaController.text,
                                  nome: _nomeController.text,
                                  idade: _idadeController.text,
                                  estudaTrabalha:
                                      _estudaTrabalhaController.text,
                                  tipoUsuario: _tipoUsuarioController.text,
                                  qualidadeSono: _qualidadeSonoController.text,
                                  moraSozinho: _moraSozinhoController.text,
                                  hobbies: _hobbiesController.text,
                                )
                                .then((String? erro) {
                                  if (erro != null) {
                                    final snackBar = SnackBar(
                                      content: Text(erro),
                                      backgroundColor: Colors.red,
                                    );
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(snackBar);
                                  } else {
                                    Navigator.pop(context);
                                  }
                                });
                          },
                          child: const Text(
                            'Começar Jornada',
                            style: TextStyle(
                              fontSize: 16,
                              height: 2.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFF6D24FF),
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
    );
  }
}
