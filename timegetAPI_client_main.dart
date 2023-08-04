import 'package:flutter/material.dart';
import 'next.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NextPage()),
          );
        },
        child: Text("現在日時を取得"),
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(300),
        ),
      ),
    );
  }
}
