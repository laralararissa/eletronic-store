import 'package:flutter/material.dart';
import 'package:store/widgets/appbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Fale diretamente com o vendedor do produto',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const ChatHeader(),
          Expanded(
            child: ListView(
              children: const [
                ChatBubble(
                  text:
                      'Olá, boa tarde! Vi o anúncio do notebook que você publicou e estou interessado. Pode me dar mais informações?',
                  isUser: true,
                ),
                ChatBubble(
                  text:
                      'Boa tarde! Claro, fico feliz que tenha visto nosso anúncio.',
                  isUser: false,
                ),
                ChatBubble(
                  text:
                      'O anúncio mencionava um notebook ideal para trabalho e estudos, com boa performance e leve. Pode me falar mais sobre ele?',
                  isUser: true,
                ),
                ChatBubble(
                  text:
                      'Com certeza! O modelo que anunciamos tem uma tela de 14 polegadas, processador i5, 8GB de RAM e 256GB de SSD. Ele é perfeito para tarefas de trabalho e estudo, além de ser leve e fácil de transportar.',
                  isUser: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatBubble({required this.text, required this.isUser, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isUser ? Colors.purple[600] : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('https://github.com/develogo.png'),
          ),
          Icon(Icons.chat_bubble_outline, color: Colors.black),
          Icon(Icons.person_outline, color: Colors.black),
        ],
      ),
    );
  }
}
