import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'delete_button.g.dart';

@swidget
Widget _deleteButton() {
  return IconButton(onPressed: (){}, icon: const Icon(Icons.delete));
}