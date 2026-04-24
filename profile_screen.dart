import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ---------------------------------------------------------------------------
// MAIN APP
// ---------------------------------------------------------------------------
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

// ---------------------------------------------------------------------------
// PROFILE SCREEN
// ---------------------------------------------------------------------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F0),
      body: SafeArea(
        child: SingleChildScrollView(
          // Fixes overflow issue
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
                  color: Color(0xFF38761D),
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
                    color: Color(0xFFE0D9C7),
                    width: 2,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 58,
                  backgroundColor: Color(0xFF38761D),
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),

              const SizedBox(height: 30),

              // Name
              const Text(
                'Ali Hassan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF38761D),
                ),
              ),

              const SizedBox(height: 8),

              // Email
              const Text(
                'ali.hassan@email.com',
                style: TextStyle(fontSize: 18, color: Color(0xFF5B9C3D)),
              ),

              const SizedBox(height: 8),

              // Phone
              const Text(
                '123-456-7890',
                style: TextStyle(fontSize: 18, color: Color(0xFF5B9C3D)),
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
                    color: Color(0xFF38761D),
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
                    buildSettingsItem(
                      context: context,
                      icon: Icons.person,
                      title: 'Edit Profile',
                      hasDivider: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfileScreen(),
                          ),
                        );
                      },
                    ),
                    buildSettingsItem(
                      context: context,
                      icon: Icons.notifications,
                      title: 'Notifications',
                      hasDivider: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationsScreen(),
                          ),
                        );
                      },
                    ),
                    buildSettingsItem(
                      context: context,
                      icon: Icons.lock,
                      title: 'Privacy',
                      hasDivider: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyScreen(),
                          ),
                        );
                      },
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

  Widget buildSettingsItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool hasDivider,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Icon(icon, color: Color(0xFF5C4033), size: 24),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, color: Color(0xFF333333)),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, color: Color(0xFF808080), size: 16),
              ],
            ),
          ),
        ),
        if (hasDivider)
          const Divider(height: 1, color: Color(0xFFE0E0E0), indent: 20, endIndent: 20),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// EDIT PROFILE SCREEN
// ---------------------------------------------------------------------------
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Ali Hassan');
  final _emailController = TextEditingController(text: 'ali.hassan@email.com');
  final _phoneController = TextEditingController(text: '123-456-7890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF38761D),
        foregroundColor: Colors.white,
        title: const Text('Edit Profile'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          //  Added for overflow prevention
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Profile Image
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFFE0D9C7), width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 58,
                          backgroundColor: Color(0xFF38761D),
                          child: Icon(Icons.person, size: 60, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF38761D),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt, color: Colors.white),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Camera feature would open here'),
                                  backgroundColor: Color(0xFF38761D),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Form Fields
                buildTextInput(
                  controller: _nameController,
                  label: 'Full Name',
                  icon: Icons.person,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Please enter your name' : null,
                ),
                const SizedBox(height: 20),
                buildTextInput(
                  controller: _emailController,
                  label: 'Email Address',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your email';
                    if (!value.contains('@')) return 'Please enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                buildTextInput(
                  controller: _phoneController,
                  label: 'Phone Number',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Please enter your phone number' : null,
                ),

                const SizedBox(height: 30),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Profile updated successfully!'),
                            backgroundColor: Color(0xFF38761D),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF38761D),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

  Widget buildTextInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFF5C4033)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF38761D), width: 2),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
// ---------------------------------------------------------------------------
// NOTIFICATIONS SCREEN
// ---------------------------------------------------------------------------
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool pushNotifications = true;
  bool emailNotifications = false;
  bool smsNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF38761D),
        foregroundColor: Colors.white,
        title: const Text('Notifications'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              buildNotificationOption(
                title: 'Push Notifications',
                value: pushNotifications,
                onChanged: (val) => setState(() => pushNotifications = val),
              ),
              const Divider(color: Color(0xFFE0E0E0)),
              buildNotificationOption(
                title: 'Email Notifications',
                value: emailNotifications,
                onChanged: (val) => setState(() => emailNotifications = val),
              ),
              const Divider(color: Color(0xFFE0E0E0)),
              buildNotificationOption(
                title: 'SMS Notifications',
                value: smsNotifications,
                onChanged: (val) => setState(() => smsNotifications = val),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationOption({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Color(0xFF333333)),
      ),
      trailing: Switch(
        activeColor: const Color(0xFF38761D),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// PRIVACY SCREEN
// ---------------------------------------------------------------------------
class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool locationAccess = true;
  bool profileVisibility = true;
  bool dataSharing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF38761D),
        foregroundColor: Colors.white,
        title: const Text('Privacy'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              buildPrivacyOption(
                title: 'Allow Location Access',
                value: locationAccess,
                onChanged: (val) => setState(() => locationAccess = val),
              ),
              const Divider(color: Color(0xFFE0E0E0)),
              buildPrivacyOption(
                title: 'Profile Visibility',
                value: profileVisibility,
                onChanged: (val) => setState(() => profileVisibility = val),
              ),
              const Divider(color: Color(0xFFE0E0E0)),
              buildPrivacyOption(
                title: 'Allow Data Sharing',
                value: dataSharing,
                onChanged: (val) => setState(() => dataSharing = val),
              ),
              const SizedBox(height: 30),
              const Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF38761D),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your privacy is important to us. We ensure that your personal data '
                    'is secure and never shared without your consent. You can modify '
                    'your privacy preferences at any time.',
                style: TextStyle(fontSize: 16, color: Color(0xFF333333), height: 1.4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPrivacyOption({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Color(0xFF333333)),
      ),
      trailing: Switch(
        activeColor: const Color(0xFF38761D),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
