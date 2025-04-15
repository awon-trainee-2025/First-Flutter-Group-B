import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2 > {

final List<Map<String, dynamic>> countries = [
    {'name': 'Saudi Arabia', 'flag': 'Images/flag.png'},
    {'name': 'UAE', 'flag': 'Images/united-arab-emirates.png'},
    {'name': 'Qatar', 'flag': 'Images/qatar.png'},
    {'name': 'Kuwait', 'flag': 'Images/kuwait.png'},
    {'name': 'Bahrain', 'flag': 'Images/bahrain.png'},
    {'name': 'Italy', 'flag': 'Images/italy.png'},
    {'name': 'Austria', 'flag': 'Images/austria.png'},
  ];
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 246, 237, 209),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Country Selection',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: countries.map((country) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCountry = country['name'];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedCountry == country['name']
                            ? Colors.pink.shade100
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            country['flag'],
                            width: 40,
                            height: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            country['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            // زر Save فقط للتصميم بدون أي وظيفة
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
              onPressed: () {},  // هنا يمكنك إضافة الوظيفة عند الضغط
              child: Text('Save' ,  style: TextStyle(fontSize: 18, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}