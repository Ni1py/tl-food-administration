import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:tl_food_administration/widgets/hovered_widget.dart';

part 'save_button.g.dart';

@swidget
Widget _saveButton() {
  return HoveredWidget(child: (isHovered) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: isHovered ? Colors.blueGrey[200] : Colors.blueGrey[100],
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(3.0))),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Сохранить', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
        ));
  });
}
