import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF38761D)),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F0), // Light cream background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Profile Title
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF38761D), // Dark green
                ),
              ),

              const SizedBox(height: 50),

              // Profile Picture
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFE0D9C7), // Light beige border
                    width: 2,
                  ),
                  color: const Color(0xFFF8F7F0), // Light cream background
                ),
                child: const CircleAvatar(
                  radius: 58,
                  backgroundColor: Color(0xFF38761D), // Dark green background for avatar
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // User Name
              const Text(
                'Ali Hassan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF38761D), // Dark green
                ),
              ),

              const SizedBox(height: 8),

              // Email Address
              const Text(
                'ali.hassan@email.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF5B9C3D), // Lighter green
                ),
              ),

              const SizedBox(height: 8),

              // Phone Number
              const Text(
                '123-456-7890',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF5B9C3D), // Lighter green
                ),
              ),

              const SizedBox(height: 50),

              // Settings Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF38761D), // Dark green
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Settings Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildSettingsItem(
                      icon: Icons.person,
                      title: 'Edit Profile',
                      hasDivider: true,
                    ),
                    _buildSettingsItem(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      hasDivider: true,
                    ),
                    _buildSettingsItem(
                      icon: Icons.lock,
                      title: 'Privacy',
                      hasDivider: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required bool hasDivider,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF5C4033), // Dark brown/grey
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF333333), // Dark grey/black
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF808080), // Dark grey
                size: 16,
              ),
            ],
          ),
        ),
        if (hasDivider)
          const Divider(
            height: 1,
            color: Color(0xFFE0E0E0), // Light grey divider
            indent: 20,
            endIndent: 20,
          ),
      ],
    );
  }
}
