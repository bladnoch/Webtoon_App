import 'package:apptoon/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';
import '../widgets/episode_widget.dart';

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
  late SharedPreferences prefs;

  bool isLiked=false;

  Future initPrefs() async{
    prefs = await SharedPreferences.getInstance();
    final likedToons=prefs.getStringList('likedToons');
    if(likedToons !=null){
      if(likedToons.contains(widget.id)==true){
        isLiked = true;
        setState(() {
          isLiked= true;
        });
      }
    } else{
      await prefs.setStringList('likedToons', []);
    }
  }

  void initState(){
    super.initState();
    webtoon=ApiService.getToonById(widget.id);
    episodes=ApiService.getLatestEpisodesById(widget.id);
    initPrefs();

  }

  onHeartTap() async {
    final likedToons=prefs.getStringList('likedToons');
    if(likedToons!=null){
      if(isLiked){
        likedToons.remove(widget.id);
      } else{
        likedToons.add(widget.id);
      }
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked=!isLiked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    //load appbar to show display title on appbar when touch the image.
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          actions: [
            IconButton(onPressed: onHeartTap,
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_outline,),),
          ],
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
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,),
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

// class Episode extends StatelessWidget {
//   const Episode({
//     super.key,
//     required this.episode,
//   });
//
//   /// in lesson
//   /// const Episode({
//   /// key? key,
//   /// required this.episode,
//   /// }) : super(key: key);
//
//   final WebtoonEpisodeModel episode;
//
//   onButtonTap() async {
//     await launchUrlString("https://google.com");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.green.shade400,
//         //
//         boxShadow: [
//         BoxShadow(
//         blurRadius: 15,
//         offset: Offset(10,10),
//         color: Colors.black.withOpacity(0.5),
//       ),],
//
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//           Text(episode.title,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//           ),
//           Icon(
//             Icons.chevron_right_rounded,
//             color: Colors.white,),
//         ],),
//       ),
//     );
//   }
// }
