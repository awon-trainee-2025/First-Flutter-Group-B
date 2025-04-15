import 'package:flutter/material.dart';
import 'package:my_task/Page2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1tState();
}

class _Page1tState extends State<Page1> {
  final List<Map<String, dynamic>> interests = [
    {'title': 'Travel & Adventures', 'image': 'Images/travel-bag.png'},
    {'title': 'Music', 'image': 'Images/musical-note.png'},
    {'title': 'Art', 'image': 'Images/paint-palette.png'},
    {'title': 'Food & Drink', 'image': 'Images/burger.png'},
    {'title': 'Home & Lifestyle', 'image': 'Images/house.png'},
    {'title': 'Others' , 'image': 'Images/other.png'}, 
  ];

  List<bool> selectedItems = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 237, 209),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Select Your 3 Interests',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),

         Text(
                  'Later you can add more in your account :)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

            Expanded(
                  child: GridView.builder(
                    itemCount: interests.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 130,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItems[index] = !selectedItems[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedItems[index]
                                ? Colors.pink.shade100
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                            padding: const EdgeInsets.all(12),
                          child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    if (interests[index]['image'] != null && interests[index]['image'].toString().trim().isNotEmpty)
      Image.asset(
        interests[index]['image'],
        width: 40,
        height: 40,
      ),
    SizedBox(height: 8),
    Text(
      interests[index]['title'] ?? '',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  ],
),
                        ),
                      );
                    },
                  ),
                ), 
                SizedBox(height: 16),

      ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
   onPressed: () {
                    int selectedCount =
                        selectedItems.where((item) => item).length;
                    if (selectedCount == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page2()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select exactly 3 interests.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


