import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tl_food_administration/data/dto/dish_dto.dart';

part 'multi_chip.g.dart';

@swidget
Widget _multiChip({required ValueNotifier<List<DishDto>> dishes}) {
  return SizedBox(
    width: 300.0,
    child: MultiSelectChipDisplay(
      icon: Icon(
        Icons.close,
        color: Colors.indigo[900],
      ),
      items: dishes.value
          .map((dish) =>
              MultiSelectItem(dish, '${dish.name} (${dish.price.toString()})'))
          .toList(),
      onTap: (DishDto val) => dishes.value =
          dishes.value.where((element) => element.id != val.id).toList(),
      scroll: false,
    ),
  );
}
