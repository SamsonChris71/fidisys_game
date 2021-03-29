import 'dart:io';

import 'package:fidisys_game/constants.dart';
import 'package:fidisys_game/controller/add_game_controller.dart';
import 'package:fidisys_game/models/game.dart';
import 'package:fidisys_game/models/list_item.dart';
import 'package:fidisys_game/util/custom_button.dart';
import 'package:fidisys_game/util/custom_dialog_box.dart';
import 'package:fidisys_game/util/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddGameScreen extends StatefulWidget {
  static String routeName = '/addGame';
  @override
  _AddGameScreenState createState() => _AddGameScreenState();
}

class _AddGameScreenState extends State<AddGameScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final urlController = TextEditingController();
  final minController = TextEditingController();
  final maxController = TextEditingController();

  final _addGameScreenKey = GlobalKey<ScaffoldState>();
  final _submitformKey = GlobalKey<FormState>();

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  File image;
  String imageURL;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
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
      key: _addGameScreenKey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            }),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _submitformKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Name of the game',
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                  SizedBox(height: 16.0),
                  CustomTextfield(
                    buildContext: context,
                    controller: titleController,
                    width: 0.9,
                    keyboardInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                  SizedBox(height: 16.0),
                  CustomTextfield(
                    buildContext: context,
                    controller: descController,
                    width: 0.9,
                    keyboardInputType: TextInputType.multiline,
                    multiline: 1,
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    'Game URL',
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                  SizedBox(height: 16.0),
                  CustomTextfield(
                    buildContext: context,
                    controller: urlController,
                    width: 0.9,
                    keyboardInputType: TextInputType.url,
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    'Players count',
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text(
                        'Minimum count',
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                      ),
                      SizedBox(width: 16.0),
                      CustomTextfield(
                        buildContext: context,
                        controller: minController,
                        width: 0.09,
                        keyboardInputType: TextInputType.number,
                      ),
                      SizedBox(width: 25.0),
                      Text(
                        'Maximum count',
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                      ),
                      SizedBox(width: 16.0),
                      CustomTextfield(
                        buildContext: context,
                        controller: maxController,
                        width: 0.09,
                        keyboardInputType: TextInputType.number,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    'Category',
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50.0,
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      color: Color(0xFF292333),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          style: GoogleFonts.poppins(color: Colors.white),
                          dropdownColor: Color(0xFF292333),
                          hint: Text(
                            'Choose the category of game',
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
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
                  SizedBox(height: 50.0),
                  GestureDetector(
                    onTap: () async {
                      PickedFile pickedFile =
                          await picker.getImage(source: ImageSource.gallery);

                      if (pickedFile != null) {
                        setState(() {
                          image = File(pickedFile.path);
                        });
                        print('Image Picked: ${image.path}');
                      } else {
                        print('No image selected.');
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.0),
                        color: Color(0xFF292333),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.ios_share,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 35.0),
                          Text(
                            'Upload an image',
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child: Text(
                      image == null
                          ? 'No image selected'
                          : image.path.split('/').last,
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.025),
                    ),
                  ),
                  SizedBox(height: 55.0),
                  Center(
                    child: CustomButton(
                        label: 'Submit',
                        onTapFunc: () async {
                          if (_submitformKey.currentState.validate()) {
                            if (_selectedItem == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please select an category.',
                                  ),
                                ),
                              );
                            } else if (image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please select an image.',
                                  ),
                                ),
                              );
                            } else {
                              customDialogBox('Uploading Image...',
                                  _addGameScreenKey.currentContext);
                              imageURL =
                                  await AddGameController.uploadImage(image);
                              Navigator.of(_addGameScreenKey.currentContext)
                                  .pop();
                              customDialogBox('Uploading Game Data...',
                                  _addGameScreenKey.currentContext);
                              Game game = Game(
                                  name: titleController.text.trim(),
                                  description: descController.text.trim(),
                                  url: urlController.text.trim(),
                                  minCount: minController.text.trim(),
                                  maxCount: maxController.text.trim(),
                                  category: _selectedItem.name,
                                  image: imageURL,
                                  likes: 0);

                              AddGameController.addGame(game, context);
                            }
                          }
                        },
                        buildContext: context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
