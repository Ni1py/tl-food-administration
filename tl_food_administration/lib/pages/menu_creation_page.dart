import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:tl_food_administration/data/dto/dish_dto.dart';
import 'package:tl_food_administration/data/dto/menu_dto.dart';
import 'package:tl_food_administration/widgets/date_picker.dart';
import 'package:tl_food_administration/widgets/helper.dart';
import 'package:tl_food_administration/widgets/menu_table.dart';

part 'menu_creation_page.g.dart';

@hwidget
Widget _menuCreationPage(List<DishDto> dishes) {
  final ValueNotifier<String?> _vendor = useState(null);

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 450.0),
      child: Column(
        children: [
          const Text('Формирование меню',
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
          const Gap(20.0),
          DatePicker(menus: MenuDto.menus),
          const Gap(20.0),
          _VendorRow(dishes: dishes, vendor: _vendor),
          const Gap(20.0),
          const Helper(),
          const Gap(10.0),
          MenuTable(
            dishes: dishes,
            vendor: _vendor.value ?? '',
          )
        ],
      ),
    ),
  );
}

@swidget
Widget __vendorRow(
    {required List<DishDto> dishes, required ValueNotifier<String?> vendor}) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    const Text('Поставщик:', style: TextStyle(fontWeight: FontWeight.bold)),
    const Gap(10.0),
    DropdownButton<String>(
      hint: const Text('Выберите поставщика'),
      value: vendor.value,
      elevation: 16,
      underline: const SizedBox(), //DropdownButtonHideUnderline
      onChanged: (val) {
        vendor.value = val;
      },
      items: dishes
          .map((dish) => dish.vendor)
          .toSet()
          .map((vendor) => DropdownMenuItem(value: vendor, child: Text(vendor)))
          .toList(),
    ),
  ]);
}
