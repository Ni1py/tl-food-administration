import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tl_food_administration/data/dto/dish_dto.dart';
import 'package:tl_food_administration/utils/hoverable.dart';

part 'multi_select.g.dart';

@swidget
Widget _multiSelect(
    {required List<DishDto> dishes,
    required int type,
    required void Function(List<dynamic>) onConfirm,
    required String titleText}) {
  return SizedBox(
    width: 45.0,
    child: Hoverable(
      child: (isHover) => MultiSelectDialogField(
        decoration: const BoxDecoration(),
        buttonText: const Text(''),
        buttonIcon: Icon(
          Icons.add_circle_outline,
          size: 25.0,
          shadows: isHover
              ? [
                  const Shadow(
                      color: Colors.black45,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 0.1)
                ]
              : [],
        ),
        items: dishes
            .where((dish) => dish.type == type)
            .map((dish) => MultiSelectItem(
                dish, '${dish.name} (${dish.price.toString()})'))
            .toList(),
        listType: MultiSelectListType.LIST,
        searchable: true,
        searchHint: '',
        onConfirm: onConfirm,
        title: Text(titleText),
        chipDisplay: MultiSelectChipDisplay.none(),
      ),
    ),
  );
}
