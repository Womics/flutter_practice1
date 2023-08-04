import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NextPage extends StatelessWidget {
  final String zipcode;

  NextPage({required this.zipcode});

  Future<String> getData() async {
    String url = "https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + zipcode;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['results'] != null
          ? data['results'][0]['address1'] +
              data['results'][0]['address2'] +
              data['results'][0]['address3']
          : '郵便番号が見つかりませんでした';
    } else {
      return 'データの取得に失敗しました';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('データを取得しています...');
            } else if (snapshot.hasError) {
              return Text('エラーが発生しました');
            } else {
              return Text(snapshot.data ?? 'データがありません');
            }
          },
        ),
      ),
    );
  }
}
