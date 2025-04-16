import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select your 3 interest'),
            Text('kuhgjyftuiygtf8i'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    child: Text('travel'),
                    width: 150,
                    height: 150,
                    color: Colors.pink),
                // SizedBox(),
                Container(
                    child: Text('travel'),
                    width: 150,
                    height: 150,
                    color: Colors.pink),
              ],
            )
          ],
        ),
      ),
    );
  }
}
