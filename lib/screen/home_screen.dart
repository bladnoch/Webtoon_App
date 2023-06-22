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

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> future) {
    return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: future.data!.length,
            padding: EdgeInsets.symmetric( vertical: 10 , horizontal: 20),
            itemBuilder: (context, index){
              // print(index);
              var webtoon = future.data![index];
              return Column(
                children: [
                  Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: Offset(10,10),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ]
                    ),
                    child: Image.network(webtoon.thumb),
                  ),

                  SizedBox(height: 10,),
                  Text(webtoon.title,
                    style: TextStyle(fontSize: 22,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index)=> SizedBox(width: 40,),
          );
  }
}
