import 'package:flutter/material.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<Map<String, String>> interests = [
    {'label': 'Travel & Adventures', 'image': 'images/Travel1.png'},
    {'label': 'Music', 'image': 'images/Music2.png'},
    {'label': 'Art', 'image': 'images/Art.png'},
    {'label': 'Food & Drink', 'image': 'images/Food & Drink.png'},
    {'label': 'Home & Lifestyle', 'image': 'images/Home & Lifestyle.png'},
    {'label': 'Others'},
  ];

  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3F3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Text(
              'Select Your 3 Interests',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'Later you can add more in your account :)',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int columns = constraints.maxWidth > 600 ? 3 : 2;

                  return GridView.count(
                    crossAxisCount: columns,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: interests.map((item) {
                      final isSelected = selected.contains(item['label']);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            final label = item['label']!;
                            if (isSelected) {
                              selected.remove(label);
                            } else if (selected.length < 3) {
                              selected.add(label);
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.purple[200] : Color(0xFFE7C6FF),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: isSelected
                                ? [BoxShadow(color: Colors.purple, blurRadius: 6)]
                                : [],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (item['image'] != null)
                                Image.asset(
                                  item['image']!,
                                  width: 60,
                                  height: 60,
                                ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  item['label']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: selected.length == 3
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('CONTINUE'),
            ),
          ],
        ),
      ),
    );
  }
}