import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NextPage extends StatelessWidget {
  Future<String> getTime() async {
    String url = "https://us-central1-waseda-android.cloudfunctions.net/get-time/";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print((DateTime.parse(data["now"])));
      return (data['now']);
    } else {
      throw Exception('現在日時の取得に失敗しました'); // エラーを投げるように変更
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('現在日時'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: getTime(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('現在日時を取得しています...');
            } else if (snapshot.hasError) {
              return Text('エラーが発生しました: ${snapshot.error}'); // エラー内容を表示
            } else {
              return Text('現在日時: ' + (snapshot.data ?? 'データがありません'),
                  style: TextStyle(fontSize: 20));
            }
          },
        ),
      ),
    );
  }
}
