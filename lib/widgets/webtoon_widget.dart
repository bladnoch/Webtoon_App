import 'package:apptoon/screen/detail_screen.dart';
import 'package:flutter/material.dart';

/// @category Webtoon: seperated from home_screen. displays image of webtoon image
/// @author dounguk Kim
/// @since 6/24/2023
/// @version v0.0.1


class Webtoon extends StatelessWidget {

  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context)=>DetailScreen(
                title: title,
                thumb: thumb,
                id: id,
              ),
              fullscreenDialog: true,
            ),
        );
      },
      child: Column(
          children: [
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

            SizedBox(height: 10,),
            Text(title,
              style: TextStyle(fontSize: 22,
              ),
            ),
          ],
        ),
    );
  }
}
