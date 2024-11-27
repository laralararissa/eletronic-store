import 'package:flutter/material.dart';

void main() {
  runApp(const CommercePlayApp());
}

class CommercePlayApp extends StatelessWidget {
  const CommercePlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// Tela inicial
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Row(
          children: [
            SizedBox(width: 30),
            Expanded(
              child: Text(
                'E-COMMERCE PLAY',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Spacer(flex: 1), // Espaço antes dos ícones
          Column(
            children: [
              OptionItem(
                icon: Icons.person,
                label: 'Conta',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()),
                  );
                },
              ),
              const CustomDivider(),
              OptionItem(
                icon: Icons.build,
                label: 'Suporte',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SupportScreen()),
                  );
                },
              ),
              const CustomDivider(),
              OptionItem(icon: Icons.chat, label: 'Chat', onTap: () {}),
              const CustomDivider(),
              OptionItem(
                  icon: Icons.local_shipping,
                  label: 'Rastreamento',
                  onTap: () {}),
            ],
          ),
          const Spacer(flex: 1), // Ajuste para o espaço
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[200],
                child: const Icon(Icons.close, color: Colors.black, size: 30),
              ),
            ),
          ),
          const SizedBox(height: 40), // Ajuste para maior espaço inferior
        ],
      ),
    );
  }
}

// Widget de item da lista
class OptionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const OptionItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 30),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Divisor customizado
class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(
        color: Colors.grey,
        thickness: 1,
      ),
    );
  }
}

// Tela de suporte
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Suporte',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tire suas dúvidas e contate o suporte',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 60),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Perguntas Frequentes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FaqScreen()),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Feedback',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeedbackScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 100,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de Perguntas Frequentes
class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<String> faqs = [
    'Como faço para criar uma conta?',
    'Como rastrear meu pedido?',
    'Como faço para devolver um produto?',
    'Como posso entrar em contato com o suporte ao cliente?',
    'Como posso atualizar minhas informações pessoais?',
    'Posso alterar ou cancelar meu pedido?',
  ];

  final List<String> faqAnswers = [
    'Para criar uma conta, clique no botão "Cadastre-se" na página inicial, preencha os dados necessários e finalize o cadastro.',
    'Você pode rastrear seu pedido acessando a seção "Meus Pedidos" no menu e clicando no pedido desejado.',
    'Para devolver um produto, acesse "Meus Pedidos", selecione o pedido, clique em "Devolver" e siga as instruções.',
    'Você pode entrar em contato com o suporte ao cliente pelo chat no aplicativo ou enviando um e-mail para suporte@exemplo.com.',
    'Acesse "Minha Conta", selecione "Editar Informações" e atualize os campos que deseja alterar.',
    'Para alterar ou cancelar um pedido, acesse "Meus Pedidos", selecione o pedido e clique em "Alterar ou Cancelar".',
  ];

  int _expandedIndex =
      -1; // Índice da pergunta atualmente expandida (-1 significa nenhuma)

  void _toggleFaq(int index) {
    setState(() {
      _expandedIndex = _expandedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Perguntas Frequentes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(faqs.length, (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _toggleFaq(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      faqs[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                if (_expandedIndex == index)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      faqAnswers[index],
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// Tela de Feedback
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _selectedRating = 0; // Número de estrelas selecionadas
  final TextEditingController _feedbackController = TextEditingController();

  void _setRating(int rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Feedback',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            // Pergunta
            const Text(
              'Com base na sua experiência com o uso do app e-commerce, qual a probabilidade de você comentar e recomendar a Loja para outras pessoas?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            // Estrelas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    _selectedRating > index ? Icons.star : Icons.star_border,
                    color: Colors.black,
                    size: 32,
                  ),
                  onPressed: () {
                    _setRating(index + 1);
                  },
                );
              }),
            ),
            // Legendas das estrelas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () =>
                        _setRating(0), // Todas as estrelas ficam vazias
                    child: const Text(
                      'Não recomendaria',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () =>
                        _setRating(5), // Todas as estrelas ficam cheias
                    child: const Text(
                      'Claro que recomendo',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Caixa de texto para feedback adicional
            const Text(
              'Por gentileza, compartilhe conosco detalhes da sua experiência com o nosso app. Seu feedback nos ajuda a melhorar o app.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Escreva aqui...',
                hintStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Cor do contorno
                  ),
                ),
                filled: false, // Caixa transparente
              ),
            ),
            const SizedBox(height: 24),
            // Texto sublinhado para enviar feedback
            Center(
              child: GestureDetector(
                onTap: () {
                  if (_selectedRating == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, selecione uma avaliação!'),
                      ),
                    );
                  } else {
                    print('Feedback enviado:');
                    print('Avaliação: $_selectedRating estrelas');
                    print('Texto: ${_feedbackController.text}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Feedback enviado com sucesso!'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Enviar Feedback',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline, // Texto sublinhado
                    fontWeight: FontWeight.bold, // Negrito
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 30), // Espaçamento extra para descer o botão "X"
            // Botão para cancelar (ícone "X")
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRating = 0;
                    _feedbackController.clear();
                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de Registro (Conta)
class RegistrationScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // Cor alterada para branca
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Center(
          child: Text(
            '',
            style: TextStyle(
              color: Colors.black, // Cor do texto alterada para preto
              fontSize: 18,
              fontWeight: FontWeight.w900, // ExtraBold
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // Cor da página alterada para branca
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Cuide da sua conta',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900, // ExtraBold equivalente
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 34),
            const Text(
              'Dados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600, // Medium
                color: Color(0xFF000000), // Cor hexadecimal para cinza
              ),
            ),
            const SizedBox(height: 24), // Aumentei o espaçamento aqui
            _buildTextField(_emailController, 'E-mail'),
            const SizedBox(height: 14),
            _buildTextField(_passwordController, 'Senha', obscureText: true),
            const SizedBox(height: 14),
            _buildTextField(_confirmPasswordController, 'Confirmar senha',
                obscureText: true),
            const SizedBox(height: 14),
            _buildTextField(_firstNameController, 'Nome'),
            const SizedBox(height: 14),
            _buildTextField(_lastNameController, 'Sobrenome'),
            const SizedBox(
                height:
                    64), // Aumentei o espaçamento aqui para posicionar os botões mais abaixo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Voltar',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    backgroundColor:
                        const Color(0xFF3E3084), // Cor alterada para #3E3084
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Ação para avançar
                  },
                  child: const Text(
                    'Avançar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500, // Medium
          color: Color(0xFF808080), // Cor hexadecimal para cinza
        ),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
