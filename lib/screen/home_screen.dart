import 'package:apptoon/models/webtoon_model.dart';
import 'package:apptoon/widgets/webtoon_widget.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

/// @home_screen.dart: all materials of home screen
/// @author dounguk Kim
/// @since 5/5/2023)
/// @version v0.0.1


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
        builder: (context,snapshot){

          if(snapshot.hasData){
            return Column(
              children: [
                SizedBox(height: 50,),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }

  /**
   * makeList() mathod
   * this brings webtoon image with multiple image options.
   */
  ListView makeList(AsyncSnapshot<List<WebtoonModel>> future) {
    return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: future.data!.length,
            padding: EdgeInsets.symmetric( vertical: 10 , horizontal: 20),
            itemBuilder: (context, index){
              // print(index);
              var webtoon = future.data![index];
              return Webtoon(
                title: webtoon.title,
                thumb: webtoon.thumb,
                id: webtoon.id,
              );
            },
            separatorBuilder: (context, index)=> SizedBox(width: 40,),
          );
  }
}
