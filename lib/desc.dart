import 'package:flutter/material.dart';

class Desc extends StatelessWidget {
  const Desc({Key? key, required this.daily}) : super(key: key);

  final List daily;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(daily[0])),
          body: Center(child: Text(daily[1]))),
    );
  }
}
