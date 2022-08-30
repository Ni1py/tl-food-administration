import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tl_food_administration/dto/menu_dto.dart';
import 'package:tl_food_administration/pages/menu_creation_page.dart';

part 'main.g.dart';

void main() => initializeDateFormatting()
    .then((_) => runApp(const _TlFoodAdministrationApp()));

@swidget
Widget __tlFoodAdministrationApp(BuildContext context) {
  return MaterialApp(
    title: 'TL-Food-Administration',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Scaffold(
      body: MenuCreationPage(MenuDto.menus[0].dishes),
    ),
    debugShowCheckedModeBanner: false,
  );
}
