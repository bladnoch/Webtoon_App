import 'package:flutter/material.dart';

/// @category detail_screen.dart: displays image when user clicks the webtoon image
/// @author dounguk Kim
/// @since 6/24/2023
/// @version v0.0.1


class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

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
            title,
            style: TextStyle(fontSize: 24,
            fontWeight: FontWeight.w400,
            ),
          ),
        ),
      body: Column(
        children: [
          SizedBox(
              height: 50,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// tag: id
              /// connect containers
              /// connected with webtoon_widget.dart
              Hero(
                tag: id,
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
                  child: Image.network(thumb),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
