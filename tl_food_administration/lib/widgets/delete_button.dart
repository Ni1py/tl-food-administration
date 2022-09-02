import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:tl_food_administration/data/dto/dish_dto.dart';
import 'package:tl_food_administration/utils/hoverable.dart';

part 'delete_button.g.dart';

@swidget
Widget _deleteButton({required ValueNotifier<List<DishDto>> dishes}) {
  return Padding(
    padding: const EdgeInsets.only(right: 17.0),
    child: Hoverable(
        child: (isHover) => GestureDetector(
            onTap: () => dishes.value = [],
            child: Icon(
              Icons.delete_outline,
              shadows: isHover
                  ? [
                      const Shadow(
                          color: Colors.black45,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 0.1)
                    ]
                  : [],
            ))),
  );
}
