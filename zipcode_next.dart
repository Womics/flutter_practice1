import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NextPage extends StatefulWidget {
  final String zipcode;

  NextPage({required this.zipcode});

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String result = 'データを取得しています...';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    String url = "https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + widget.zipcode;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        result = data['results'] != null
            ? data['results'][0]['address1'] +
            data['results'][0]['address2'] +
            data['results'][0]['address3']
            : '郵便番号が見つかりませんでした';
      });
    } else {
      setState(() {
        result = 'データの取得に失敗しました';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text(result),
      ),
    );
  }
}
