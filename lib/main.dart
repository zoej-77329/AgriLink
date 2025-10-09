import 'dart:convert';
import 'package:flutter/material.dart';
import 'foodcard.dart';
import 'navbar.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const AgriLinkApp());
}

class AgriLinkApp extends StatelessWidget {
  const AgriLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> items = [];
  int _selectedIndex = 0;

  final Color appGreen = const Color(0xFF4A6B25); // Olive Green
  final Color backgroundColor = const Color(0xFFFFF7ED); // Warm beige background

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response =
    await rootBundle.loadString('lib/data/vegetables.json');
    final data = json.decode(response);
    setState(() {
      items = data;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            color: backgroundColor, // ✅ Fix AppBar color while scrolling
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          'AgriLink',
                          style: TextStyle(
                            color: appGreen,
                            fontWeight: FontWeight.w900,
                            fontSize: 36,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, color: appGreen, size: 33),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon:
                          Icon(Icons.shopping_cart, color: appGreen, size: 33),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // 🔍 Search Bar
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.search,
                            color: Color(0xFF5C5C5C),
                            size: 28,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF4A4A4A),
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Color(0xFF4A4A4A),
                                  fontSize: 18,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.only(top: 2),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 10),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return FoodCard(
              name: item['name'],
              price: item['price'],
              location: item['location'],
              image: item['image'],
              appGreen: appGreen,
              backgroundColor: backgroundColor,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
