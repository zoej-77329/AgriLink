import 'package:flutter/material.dart';

class CropCalendar extends StatelessWidget {
  final List<Map<String, dynamic>> crops = [
    {
      'name': 'Wheat',
      'planting': 'November - December',
      'harvesting': 'April - May',
      'icon': Icons.grass,
    },
    {
      'name': 'Rice',
      'planting': 'June - July',
      'harvesting': 'October - November',
      'icon': Icons.eco,
    },
    {
      'name': 'Sugarcane',
      'planting': 'February - March',
      'harvesting': 'December - January',
      'icon': Icons.local_florist,
    },
    {
      'name': 'Maize',
      'planting': 'February - March',
      'harvesting': 'July - August',
      'icon': Icons.spa,
    },
    {
      'name': 'Cotton',
      'planting': 'April - May',
      'harvesting': 'October - November',
      'icon': Icons.nature, // 🌿
    },
    {
      'name': 'Potato',
      'planting': 'October - November',
      'harvesting': 'February - March',
      'icon': Icons.emoji_nature, // 🥔
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E9), // soft beige
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Crop Calendar',
          style: TextStyle(
            color: Color(0xFF2E6B36), // green tone like login button
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF2E6B36)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: crops.length,
          itemBuilder: (context, index) {
            final crop = crops[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(
                  crop['icon'],
                  color: const Color(0xFF2E6B36),
                  size: 36,
                ),
                title: Text(
                  crop['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E6B36),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Text(
                      "🌱 Planting: ${crop['planting']}",
                      style: const TextStyle(color: Colors.black87),
                    ),
                    Text(
                      "🌾 Harvesting: ${crop['harvesting']}",
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

