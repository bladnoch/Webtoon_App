import 'package:apptoon/screen/detail_screen.dart';
import 'package:flutter/material.dart';

/// @category Webtoon: This class detects all the touching actions of webtoon images
/// seperated from home_screen.
/// displays image of webtoon image
///
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
    //detects screen actions
    return GestureDetector(
      //checks taps
      onTap: (){

        //when taps screen
        Navigator.push(context,

            //image animation
            MaterialPageRoute(

              ///DetailScreen: detail_screen.dart
              ///technically DetailScreen widget is floating on the screen
              ///this also contains scaffold appbar
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

            /// tag: id
            /// connect containers
            /// connected with detail_screen.dart
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
