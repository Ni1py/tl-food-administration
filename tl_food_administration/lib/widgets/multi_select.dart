import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tl_food_administration/dto/dish_dto.dart';

part 'multi_select.g.dart';

@hwidget
Widget _multiSelect({required List<DishDto> dishes, required int type}) {
  List<MultiSelectItem> _getDishes() {
    return dishes
        .where((dish) => dish.type == type)
        .map((dish) =>
            MultiSelectItem(dish, '${dish.name} (${dish.price.toString()})'))
        .toList();
  }

  return MultiSelectChipField(
    items: _getDishes(),
    icon: const Icon(Icons.check),
    scroll: false,
    searchable: true,
    searchHint: '',
    showHeader: false,
  );
}
