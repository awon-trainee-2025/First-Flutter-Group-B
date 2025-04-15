import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interest Selector',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: InterestScreen(),
    );
  }
}

class InterestScreen extends StatelessWidget {
  final List<Map<String, dynamic>> interests = [
    {"label": "Travel & Adventures", "icon": Icons.travel_explore},
    {"label": "Music", "icon": Icons.music_note},
    {"label": "Art", "icon": Icons.brush},
    {"label": "Food & Drink", "icon": Icons.local_dining},
    {"label": "Home & Lifestyle", "icon": Icons.home},
    {"label": "Others", "icon": Icons.more_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEECEB),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(
              "Select Your 3 Interests",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text("Later you can add more in your account :)"),
            SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                itemCount: interests.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.purple.shade100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.purple.shade100,
                          child: Icon(interests[index]['icon'], color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Text(interests[index]['label'],
                            textAlign: TextAlign.center),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountrySelectionScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: Text("CONTINUE", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CountrySelectionScreen extends StatefulWidget {
  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String selectedCountry = "Ukraine";

  final List<String> countries = [
    "Ukraine",
    "Australia",
    "Kazakhstan",
    "Europe",
    "Slovenia",
    "Czech",
    "Netherlands",
    "Poland"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEECEB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFEECEB),
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text("Country Selection", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find Yours',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                String country = countries[index];
                return RadioListTile(
                  title: Text(country),
                  value: country,
                  groupValue: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value!;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                // Save action
              },
              child: Text("SAVE", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
