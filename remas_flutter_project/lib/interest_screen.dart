import 'package:flutter/material.dart';
import 'country_selection_screen.dart';

class InterestScreen extends StatefulWidget {
  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final List<Map<String, String>> interests = [
    {"label": "Travel & Adventures", "image": "images/travel.jpg"},
    {"label": "Music", "image": "images/Music.jpg"},
    {"label": "Art", "image": "images/art.jpg"},
    {"label": "Food & Drink", "image": "images/food.jpg"},
    {"label": "Home & Lifestyle", "image": "images/home.jpg"},
    {"label": "Others", "image": ""},
  ];

  List<String> selectedInterests = [];

  void _onItemTap(String label) {
    setState(() {
      if (selectedInterests.contains(label)) {
        selectedInterests.remove(label);
      } else {
        if (selectedInterests.length < 3) {
          selectedInterests.add(label);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You can select up to 3 interests only.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  bool isSelected(String label) {
    return selectedInterests.contains(label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEECEB),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Select Your 3 Interests",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("Later you can add more in your account :)"),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 1,
                      children: interests.map((item) {
                        final label = item['label']!;
                        final isSelectedBox = isSelected(label);

                        return InkWell(
                          onTap: () => _onItemTap(label),
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelectedBox
                                  ? Colors.purple.shade100
                                  : Color(0xFFFEECEB),
                              border: Border.all(
                                color: Colors.purple.shade200,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (item['image'] != "")
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isSelectedBox
                                          ? Colors.white
                                          : Colors.purple.shade100,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      item['image']!,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                SizedBox(height: 10),
                                Flexible(
                                  child: Text(
                                    label,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedInterests.length == 3
                      ? Colors.red
                      : Colors.grey,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: selectedInterests.length == 3
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountrySelectionScreen(),
                          ),
                        );
                      }
                    : null,
                child: Text("CONTINUE", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}