import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed:() {showDialog(
            context: context,
             builder: (context){
              return AlertDialog(
            title: Text("Error!"),
            content: Text('Wrong password'),
            actions: [
              ElevatedButton(
              onPressed:(){
                Navigator.pop(context);
              },
              child: Text('cancel')),
              ],
              );
              },
              );
              },
               child: Text('alert'),
               ),
               ),
               );
               }
               }
  