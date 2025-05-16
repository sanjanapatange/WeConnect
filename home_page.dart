import 'package:flutter/material.dart';
import 'chatbot_page.dart';
import 'recommendations_page.dart';
import 'progress_page.dart';
import 'understand_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _handleFeeling(BuildContext context, String feeling) {
    String message;
    switch (feeling) {
      case 'happy':
        message = "That's wonderful! 😊 Keep smiling!";
        break;
      case 'neutral':
        message = "Got it! Let’s make today better. 🙂";
        break;
      case 'sad':
        message = "Sorry to hear that. We’re here for you. 😢";
        break;
      case 'angry':
        message = "Take a deep breath. Let's calm down. 😠";
        break;
      default:
        message = "Thanks for sharing!";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  Widget _buildSection({
    required String label,
    required IconData icon,
    required Color color,
    required String backgroundImage,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 130,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(color.withOpacity(0.5), BlendMode.srcATop),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 35, color: Colors.white),
              const SizedBox(height: 10),
              Text(label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/freedom.jpg'), // whole screen background
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Top Emoji Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/topp.jpg'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "✨ How are you feeling today?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 16,
                        children: [
                          _emojiButton(context, '😊', Colors.orange, 'happy'),
                          _emojiButton(context, '😐', Colors.grey, 'neutral'),
                          _emojiButton(context, '😢', Colors.blue, 'sad'),
                          _emojiButton(context, '😡', Colors.red, 'angry'),
                        ],
                      ),
                    ],
                  ),
                ),

                // Sections Row
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _buildSection(
                      label: 'Progress',
                      icon: Icons.trending_up,
                      color: Colors.teal,
                      backgroundImage: 'assets/progress.jpg',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProgressPage()),
                      ),
                    ),
                    _buildSection(
                      label: 'Chatbot',
                      icon: Icons.chat,
                      color: Colors.indigo,
                      backgroundImage: 'assets/chatbot.jpg',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ChatbotPage()),
                      ),
                    ),
                    _buildSection(
                      label: 'Recommendations',
                      icon: Icons.thumb_up,
                      color: Colors.pink,
                      backgroundImage: 'assets/recommend.jpg',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RecommendationsPage()),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Understand Section
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const UnderstandPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/understand.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "🧠 Let me understand you better",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(color: Colors.black45, blurRadius: 4),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emojiButton(BuildContext context, String emoji, Color color, String feeling) {
    return GestureDetector(
      onTap: () => _handleFeeling(context, feeling),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 5, offset: const Offset(2, 2)),
          ],
        ),
        child: Center(
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }
}
