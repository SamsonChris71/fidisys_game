import 'package:fidisys_game/models/list_item.dart';
import 'package:flutter/material.dart';

const kTextFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
  borderRadius: kBorderRadius,
);

const kBorderRadius = const BorderRadius.all(
  const Radius.circular(10.0),
);

List<ListItem> kCategoryItems = [
  ListItem(1, 'All'),
  ListItem(2, 'Action'),
  ListItem(3, 'Adventure'),
  ListItem(4, 'Arcade'),
  ListItem(5, 'Board'),
  ListItem(6, 'Card'),
  ListItem(7, 'Casino'),
  ListItem(8, 'Casual'),
  ListItem(9, 'Educational'),
  ListItem(10, 'Music'),
  ListItem(11, 'Puzzle'),
  ListItem(12, 'Racing'),
  ListItem(13, 'Role Playing'),
  ListItem(14, 'Simulation'),
  ListItem(15, 'Sports'),
  ListItem(16, 'Strategy'),
  ListItem(17, 'Trivia'),
  ListItem(18, 'Word'),
];
