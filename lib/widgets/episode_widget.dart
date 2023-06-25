import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../models/webtoon_episode_model.dart';

/// @category episode_widget.dart: displays image when user clicks the webtoon image
/// @author dounguk Kim
/// @since 6/26/2023
/// @version v0.0.1

class Episode extends StatelessWidget {
  const Episode({
    super.key,

    required this.episode,
    required this.webtoonId,
  });

  /// in lesson
  /// const Episode({
  /// key? key,
  /// required this.episode,
  /// }) : super(key: key);
  ///
  final WebtoonEpisodeModel episode;
  final String webtoonId;

  onButtonTap() async {
    await launchUrlString("https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${(int.parse(episode.id)+1).toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
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
    );
  }
}