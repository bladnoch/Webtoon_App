import 'package:apptoon/models/webtoon_model.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Future<List<WebtoonModel>> webtoons= ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        title: Text("오늘의 웹툰",
        style: TextStyle(fontSize: 24,
        fontWeight: FontWeight.w400,
        ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Text("here is text");
          }
            return Text("here is no text");
        },
      ),
    );
  }
}
