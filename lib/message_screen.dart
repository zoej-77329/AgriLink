import 'package:flutter/material.dart';
import 'chat_screen.dart'; // separate file for chat screen

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const appGreen = Color(0xFF38761D);
    const backgroundColor = Color(0xFFFDF6E9);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          "Messages",
          style: TextStyle(
            color: appGreen,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        iconTheme: const IconThemeData(color: appGreen),
      ),

      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search messages...',
                prefixIcon: const Icon(Icons.search, color: appGreen),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Chat list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildChatTile(
                  context,
                  name: "Farmer Ali",
                  message: "Fresh tomatoes available!",
                  time: "10:45 AM",
                ),
                _buildChatTile(
                  context,
                  name: "Farmer Khan",
                  message: "Can deliver wheat tomorrow.",
                  time: "09:20 AM",
                ),
                _buildChatTile(
                  context,
                  name: "Buyer Sara",
                  message: "Is rice still available?",
                  time: "Yesterday",
                ),
                _buildChatTile(
                  context,
                  name: "Farmer Ahmed",
                  message: "Sure, I’ll pack 5 kg for you.",
                  time: "2 days ago",
                ),
                _buildChatTile(
                  context,
                  name: "Farmer Usman",
                  message: "The mango crates are ready!",
                  time: "3 days ago",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatTile(
      BuildContext context, {
        required String name,
        required String message,
        required String time,
      }) {
    const appGreen = Color(0xFF38761D);
    const textBrown = Color(0xFF5C4033);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(name: name),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: appGreen,
            child: const Icon(Icons.person, color: Colors.white, size: 28),
          ),
          title: Text(
            name,
            style: const TextStyle(
              color: appGreen,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              message,
              style: const TextStyle(
                color: textBrown,
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Text(
            time,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
