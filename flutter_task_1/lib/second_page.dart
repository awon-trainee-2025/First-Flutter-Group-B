import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<SecondPage> {
  String? selectedCountry;

  final List<Map<String, String>> countries = [
    {'name': 'Ukraine', 'flag': 'images/ukraine.png'},
    {'name': 'Australia', 'flag': 'images/australia.png'},
    {'name': 'Kazakhstan', 'flag': 'images/kazakhstan.png'},
    {'name': 'Saudi Arabia', 'flag': 'images/sa.png'},
    {'name': 'Slovenia', 'flag': 'images/slovenia.png'},
    {'name': 'Czech', 'flag': 'images/cz.png'},
    {'name': 'Netherlands', 'flag': 'images/nl.png'},
    {'name': 'Poland', 'flag': 'images/poland.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Country Selection',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Find Yours',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: countries.map((country) {
                  return RadioListTile(
                    title: Row(
                      children: [
                        Image.asset(country['flag']!, width: 30),
                        SizedBox(width: 10),
                        Text(country['name']!),
                      ],
                    ),
                    value: country['name'],
                    groupValue: selectedCountry,
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value.toString();
                      });
                    },
                    activeColor: Colors.red,
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text('SAVE'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}