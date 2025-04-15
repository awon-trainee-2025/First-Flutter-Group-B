import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  int selectedIndex = -1;

  final List<Map<String, String>> countries = [
    {"name": "Ukraine", "flag": "flags/ukraine.png"},
    {"name": "Australia", "flag": "flags/australia.png"},
    {"name": "Kazakhstan", "flag": "flags/kazakhstan.png"},
    {"name": "Europe", "flag": "flags/europe.png"},
    {"name": "Slovenia", "flag": "flags/slovenia.png"},
    {"name": "Czech", "flag": "flags/czech.png"},
    {"name": "Netherlands", "flag": "flags/netherlands.png"},
    {"name": "Poland", "flag": "flags/poland.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEECEB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Country Selection",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Find Yours",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.redAccent.withOpacity(0.2) : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        countries[index]["flag"]!,
                        width: 35,
                      ),
                      title: Text(
                        countries[index]["name"]!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: Radio(
                        activeColor: Colors.redAccent,
                        value: index,
                        groupValue: selectedIndex,
                        onChanged: (value) {
                          setState(() {
                            selectedIndex = value!;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                 
                },
                child: const Text(
                  "SAVE",
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