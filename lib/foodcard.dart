import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String price;
  final String location;
  final String image;
  final Color appGreen;
  final Color backgroundColor;

  const FoodCard({
    Key? key,
    required this.name,
    required this.price,
    required this.location,
    required this.image,
    required this.appGreen,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Image Box
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Image.asset(
              image,
              width: 160,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),

          // Right Info Box
          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 18,
                      color: appGreen,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.grey, size: 18),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          location,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(color: appGreen, width: 1.2),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: Text(
                        "Contact Farmer",
                        style: TextStyle(
                          color: appGreen,
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
