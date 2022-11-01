import 'package:flutter/material.dart';

import 'movies_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Navigate'),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const MainMoviesScreen()));
          },
        ),
      ),
    );
  }
}
