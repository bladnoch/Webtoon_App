
/// @category: webtoon_detail_model.dart: get a detail of webtoon info
/// @author dounguk Kim
/// @since 6/25/2023
/// @version v0.0.1


class WebtoonDetailModel{
  final String title,about,genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic>json):
        title=json['title'],
        about=json['about'],
        genre=json['genre'],
        age=json['age'];
}