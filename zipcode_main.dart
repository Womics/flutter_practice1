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
      ),
    );
  }
}

class Home extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: '郵便番号を入力'),
          ),
          ElevatedButton(
            onPressed: () {
              final zipcode = controller.text;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextPage(zipcode: zipcode)),
              );
            },
            child: Text("検索"),
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(300),
            ),
          ),
        ],
      ),
    );
  }
}
