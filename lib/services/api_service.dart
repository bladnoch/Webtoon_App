import 'package:http/http.dart' as http;



class ApiService{
  final String baseUrl="https://webtoon-crawler.nomadcoders.workers.dev";
  final String today="today";

  void getTodaysToons() async{ //await을 사용하기 위해선 async가 필요하다.
    final url=Uri.parse("$baseUrl/$today");
    final responce = await http.get(url); //await : 이 구문이 실행되서 데이터를 가졍올때까지 기다린다.
    if(responce.statusCode==200){ //200 : 성공
      print(responce.body);

      return;
    }
    throw Error();
  }

}