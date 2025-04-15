import 'package:flutter/material.dart';
import 'country_page.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  List<String> selectedInterests = [];

  final List<Map<String, String>> interests = [
    {"title": "Travel & Adventures", "icon": "icons/travel.png"},
    {"title": "Music", "icon": "icons/music.png"},
    {"title": "Art", "icon": "icons/art.png"},
    {"title": "Food & Drink", "icon": "icons/food.png"},
    {"title": "Home & Lifestyle", "icon": "icons/home.png"},
    {"title": "Others"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEECEB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: const Text(
          "Select Your 3 Interests",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Text(
              "Later you can add more in your account :)",
              style: TextStyle(fontSize: 14, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: interests.map((item) {
                  final isSelected = selectedInterests.contains(item["title"]);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedInterests.remove(item["title"]);
                        } else if (selectedInterests.length < 3) {
                          selectedInterests.add(item["title"]!);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color.fromARGB(255, 160, 111, 250) : Colors.transparent,
                        border: Border.all(
                          color: const Color.fromARGB(255, 160, 111, 255),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         if (item.containsKey("icon"))
                        Image.asset(item["icon"]!, height: 50),

                         const SizedBox(height: 10),

                         Text(
                         item["title"]!,
                       textAlign: TextAlign.center,
                       style: const TextStyle(
                       fontSize: 16,
                         fontWeight: FontWeight.w600,
                          color: Colors.black87,
                       ),
                     ),
                   ],
                  ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedInterests.length == 3
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CountryPage()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                   fontSize: 16,
                   color: Colors.white, 
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}