import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/webtoon_model.dart';



class ApiService{
  final String baseUrl="https://webtoon-crawler.nomadcoders.workers.dev";
  final String today="today";

  Future<List<WebtoonModel>> getTodaysToons() async{ //await을 사용하기 위해선 async가 필요하다.
    List<WebtoonModel> webtoonInstances=[];
    final url=Uri.parse("$baseUrl/$today");
    final responce = await http.get(url); //await : 이 구문이 실행되서 데이터를 가졍올때까지 기다린다.

    if(responce.statusCode==200){ //200 : 성공
      final List<dynamic> webtoons=jsonDecode(responce.body);
      for (var webtoon in webtoons){
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

}