import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fidisys_game/constants.dart';
import 'package:fidisys_game/controller/update_game_controller.dart';
import 'package:fidisys_game/models/list_item.dart';
import 'package:fidisys_game/screens/add_game_screen.dart';
import 'package:fidisys_game/util/custom_button.dart';
import 'package:fidisys_game/util/game_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeScreenKey = GlobalKey<ScaffoldState>();
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  @override
  void initState() {
    super.initState();
    // _selectedItem = kCategoryItems.first;
    _dropdownMenuItems = buildDropDownMenuItems(kCategoryItems);
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      key: _homeScreenKey,
      appBar: AppBar(
        title: Text(
          'FidiGames',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 35.0,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Theme.of(context).backgroundColor,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        style: GoogleFonts.poppins(color: Colors.white),
                        dropdownColor: Color(0xFF292333),
                        hint: Text(
                          'Categories',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        value: _selectedItem,
                        items: _dropdownMenuItems,
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value;
                          });
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: (_selectedItem == null || _selectedItem.name == 'All')
                    ? StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('games')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          return ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: GameCard(
                                  imageURL: document.data()['imageURL'],
                                  gameDesc: document.data()['gameDesc'],
                                  gameTitle: document.data()['gameName'],
                                  likes: document.data()['likes'],
                                  maxPlayers: document.data()['maxPlayers'],
                                  minPlayers: document.data()['minPlayers'],
                                  buildContext: _homeScreenKey.currentContext,
                                  isLiked: document.data()['isLiked'],
                                  likeGame: () {
                                    UpdateGameController.updateGame(document);
                                  },
                                ),
                              );
                            }).toList(),
                          );
                        })
                    : StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('games')
                            .where('gameCategory',
                                isEqualTo: _selectedItem.name)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          return ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: GameCard(
                                  imageURL: document.data()['imageURL'],
                                  gameDesc: document.data()['gameDesc'],
                                  gameTitle: document.data()['gameName'],
                                  likes: document.data()['likes'],
                                  maxPlayers: document.data()['maxPlayers'],
                                  minPlayers: document.data()['minPlayers'],
                                  buildContext: _homeScreenKey.currentContext,
                                  isLiked: document.data()['isLiked'],
                                  likeGame: () {},
                                ),
                              );
                            }).toList(),
                          );
                        }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: CustomButton(
          buildContext: context,
          label: '+ Add Game',
          onTapFunc: () {
            Navigator.pushNamed(context, AddGameScreen.routeName);
          },
        ),
      ),
    );
  }
}
