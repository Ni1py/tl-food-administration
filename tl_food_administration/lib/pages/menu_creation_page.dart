import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:tl_food_administration/dto/dish_dto.dart';
import 'package:tl_food_administration/widgets/date_picker.dart';
import 'package:tl_food_administration/widgets/save_button.dart';
import 'package:tl_food_administration/widgets/table.dart' as table;

part 'menu_creation_page.g.dart';

const vendors = ['Моторин', 'Звениговский'];

@swidget
Widget _menuCreationPage(List<DishDto> dishes) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const Text('Формирование меню',
            style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
        const Gap(20.0),
        const DatePicker(),
        const Gap(20.0),
        const _VendorRow(),
        const Gap(20.0),
        table.Table(dishes),
        const Gap(20.0),
        const SaveButton()
      ],
    ),
  );
}

@hwidget
Widget __vendorRow() {
  final ValueNotifier<String?> _vendor = useState(null);

  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    const Text('Поставщик:', style: TextStyle(fontWeight: FontWeight.bold)),
    const Gap(10.0),
    DropdownButton<String>(
      hint: const Text(''),
      value: _vendor.value,
      elevation: 16,
      underline: const SizedBox(), //DropdownButtonHideUnderline
      onChanged: (val) {
        _vendor.value = val;
      },
      items: vendors
          .map((vendor) => DropdownMenuItem(value: vendor, child: Text(vendor)))
          .toList(),
    ),
  ]);
}
