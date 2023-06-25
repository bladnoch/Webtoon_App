
import 'dart:convert';

/// @category: webtoon_episode_model.dart
/// @author dounguk Kim
/// @since 6/25/2023
/// @version v0.0.1

class WebtoonEpisodeModel{
  final String id,title, rating, date;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json):
        id=json['id'],
        title=json['title'],
        rating=json['rating'],
        date=json['date'];
}
