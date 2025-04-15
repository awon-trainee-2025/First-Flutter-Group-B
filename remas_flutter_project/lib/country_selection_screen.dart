import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatefulWidget {
  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String selectedCountry = "Saudi Arabia";

  final List<Map<String, String>> countries = [
    {"name": "Saudi Arabia", "flag": "images/saudi.png"},
    {"name": "Kuwait", "flag": "images/kuwait.png"},
    {"name": "United Arab Emirates", "flag": "images/uae.png"},
    {"name": "Lebanon", "flag": "images/lebanon.png"},
    {"name": "Spain", "flag": "images/spain.png"},
    {"name": "Jordan", "flag": "images/jordan.png"},
    {"name": "Iraq", "flag": "images/iraq.png"},
    {"name": "Oman", "flag": "images/oman.png"},
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
                final country = countries[index];
                return RadioListTile(
                  value: country['name']!,
                  groupValue: selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value!;
                    });
                  },
                  title: Row(
                    children: [
                      Image.asset(country['flag']!, width: 30, height: 20),
                      SizedBox(width: 10),
                      Text(country['name']!),
                    ],
                  ),
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                // Save selection or proceed
              },
              child: Text("SAVE", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}