import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter', style: TextStyle(fontSize: 30)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter = counter + 1;
                });
              },
              child: Text('+'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (counter > 0) {
                    counter = counter - 1;
                  }
                });
              },
              child: Text('-'),
            ),
          ],
        ),
      ),
    );
  }
}
