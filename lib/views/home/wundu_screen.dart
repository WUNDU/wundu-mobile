import 'package:flutter/material.dart';

class WunduScreen extends StatefulWidget {
  const WunduScreen({super.key});

  @override
  State<WunduScreen> createState() => _WunduScreenState();
}

class _WunduScreenState extends State<WunduScreen> {
  // Aqui você pode adicionar as variáveis de estado necessárias

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ajuste para a cor de fundo do seu design
      appBar: AppBar(
        title: const Text(
          'Wundu',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Ação de voltar
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              // Ação de notificações
            },
          ),
        ],
      ),
    );
  }
}
