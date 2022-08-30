import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'add_button.g.dart';

@swidget
Widget _addButton() {
  return IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline));
}
