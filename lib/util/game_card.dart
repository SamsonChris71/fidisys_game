import 'package:fidisys_game/util/heart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameCard extends StatelessWidget {
  final String imageURL;
  final int likes;
  final String gameTitle;
  final String gameDesc;
  final String minPlayers;
  final String maxPlayers;
  final BuildContext buildContext;
  final bool isLiked;
  final Function likeGame;
  const GameCard({
    Key key,
    @required this.imageURL,
    @required this.likes,
    @required this.gameTitle,
    @required this.gameDesc,
    @required this.minPlayers,
    @required this.maxPlayers,
    @required this.buildContext,
    @required this.isLiked,
    @required this.likeGame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFF292333),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageURL), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: likeGame,
                      child: CustomPaint(
                        size: Size(20, 20),
                        painter: isLiked
                            ? HeartPainterLiked()
                            : HeartPainterUnliked(),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$likes',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  gameTitle,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  gameDesc,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.025,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Theme.of(context).backgroundColor,
                      border: Border.all(
                        color: Color(0xFFFCBC3C),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Play',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Icon(
                    Icons.people_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '$minPlayers - $maxPlayers  Players',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
