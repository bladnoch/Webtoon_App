import 'package:apptoon/services/api_service.dart';
import 'package:flutter/material.dart';

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';

/// @category detail_screen.dart: displays image when user clicks the webtoon image
/// @author dounguk Kim
/// @since 6/24/2023
/// @version v0.0.1


/// this class was originally the statelesswidget but
/// some variables are needing to use initState()
/// Therefor this class is modified to statefulwidget
class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;


  void initState(){
    super.initState();
    webtoon=ApiService.getToonById(widget.id);
    episodes=ApiService.getLatestEpisodesById(widget.id);
  }
  @override
  Widget build(BuildContext context) {

    //load appbar to show display title on appbar when touch the image.
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          elevation: 2,
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 24,
            fontWeight: FontWeight.w400,
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50,),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// tag: id
                  /// connect containers
                  /// connected with webtoon_widget.dart
                  Hero(
                    tag: widget.id,
                    child: Container(
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
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,

              ),
              FutureBuilder(
                future: webtoon,
                builder: (context,snapshot){
                  if(snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data!.about,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return Text("...");
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Column(
                      children: [
                        for(var episode in snapshot.data!)
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green.shade400,


                              //
                              boxShadow: [
                              BoxShadow(
                              blurRadius: 15,
                              offset: Offset(10,10),
                              color: Colors.black.withOpacity(0.5),
                            ),],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Text(episode.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.white,),
                              ],),
                            ),
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
