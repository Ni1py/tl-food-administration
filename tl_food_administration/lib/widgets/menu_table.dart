import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:tl_food_administration/data/dto/dish_dto.dart';
import 'package:tl_food_administration/widgets/delete_button.dart';
import 'package:tl_food_administration/widgets/multi_chip.dart';
import 'package:tl_food_administration/widgets/multi_select.dart';
import 'package:tl_food_administration/widgets/save_button.dart';

part 'menu_table.g.dart';

final _border = Border.all(color: const Color(0xffdcdddc), width: 1);

@hwidget
Widget _menuTable({required List<DishDto> dishes, required String vendor}) {
  final ValueNotifier<List<DishDto>> _selectedSalatsList = useState([]);
  final ValueNotifier<List<DishDto>> _selectedSoupsList = useState([]);
  final ValueNotifier<List<DishDto>> _selectedGarnishesList = useState([]);
  final ValueNotifier<List<DishDto>> _selectedSecondCoursesList = useState([]);
  final _vendorDishes = dishes.where((dish) => dish.vendor == vendor).toList();

  return Column(
    children: [
      _TableRow(
        text: 'Салат',
        dishesForSelect: _vendorDishes,
        dishesForChips: _selectedSalatsList,
        type: 0,
        onConfirm: (val) => _selectedSalatsList.value = val.cast<DishDto>(),
        titleText: 'САЛАТЫ',
      ),
      _TableRow(
        text: 'Суп',
        dishesForSelect: _vendorDishes,
        dishesForChips: _selectedSoupsList,
        type: 1,
        onConfirm: (val) => _selectedSoupsList.value = val.cast<DishDto>(),
        titleText: 'СУПЫ',
      ),
      _TableRow(
        text: 'Гарнир',
        dishesForSelect: _vendorDishes,
        dishesForChips: _selectedGarnishesList,
        type: 2,
        onConfirm: (val) => _selectedGarnishesList.value = val.cast<DishDto>(),
        titleText: 'ГАРНИРЫ',
      ),
      _TableRow(
        text: 'Второе блюдо',
        dishesForSelect: _vendorDishes,
        dishesForChips: _selectedSecondCoursesList,
        type: 3,
        onConfirm: (val) =>
            _selectedSecondCoursesList.value = val.cast<DishDto>(),
        titleText: 'ВТОРЫЕ БЛЮДА',
      ),
      const Gap(20.0),
      const SaveButton()
    ],
  );
}

@swidget
Widget __tableRow(
    {required String text,
    required List<DishDto> dishesForSelect,
    required ValueNotifier<List<DishDto>> dishesForChips,
    required int type,
    required void Function(List<dynamic>) onConfirm,
    required String titleText}) {
  return DecoratedBox(
    decoration: BoxDecoration(border: _border),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 110.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(text, style: const TextStyle(fontSize: 15.0)),
              )),
          const _VerticalStrip(),
          MultiSelect(
            dishes: dishesForSelect,
            type: type,
            onConfirm: onConfirm,
            titleText: titleText,
          ),
          const _VerticalStrip(),
          MultiChip(dishes: dishesForChips),
          const _VerticalStrip(),
          DeleteButton(dishes: dishesForChips)
        ],
      ),
    ),
  );
}

@swidget
Widget __verticalStrip() {
  return const VerticalDivider(color: Color(0xffdcdddc), width: 1.0);
}
