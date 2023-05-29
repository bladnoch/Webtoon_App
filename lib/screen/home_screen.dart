import 'package:apptoon/models/webtoon_model.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Future<List<WebtoonModel>> webtoons= ApiService.getTodaysToons();

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
        builder: (context,future){
          if(future.hasData){
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: future.data!.length,
              itemBuilder: (context, index){
                print(index);
                var webtoon = future.data![index];
                return Text(webtoon.title);
              },
            );
          }
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}
