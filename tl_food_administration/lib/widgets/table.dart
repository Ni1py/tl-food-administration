import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:tl_food_administration/dto/dish_dto.dart';
import 'package:tl_food_administration/widgets/add_button.dart';
import 'package:tl_food_administration/widgets/delete_button.dart';
import 'package:tl_food_administration/widgets/multi_select.dart';

part 'table.g.dart';

const _border = BorderSide(color: Color(0xffdcdddc), width: 1);

@swidget
Widget _table(List<DishDto> dishes) {
  // return DataTable(
  //   border: const TableBorder(
  //       right: _border,
  //       top: _border,
  //       left: _border,
  //       bottom: _border,
  //       horizontalInside: _border,
  //       verticalInside: _border),
  //   columns: <String>['', '', '', '', '']
  //       .map((e) => DataColumn(label: Text(e)))
  //       .toList(),
  //   rows: [
  //     DataRow(cells: [
  //       const DataCell(Text('Салат')),
  //       DataCell(MultiSelect(dishes: dishes, type: 0)),
  //       const DataCell(AddButton()),
  //       DataCell(MultiSelect(dishes: dishes, type: 0)),
  //       const DataCell(DeleteButton())
  //     ])
  //   ],
  // );
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _TableRow(text: 'Салат', dishes: dishes, type: 0),
      _TableRow(text: 'Суп', dishes: dishes, type: 1),
      _TableRow(text: 'Гарнир', dishes: dishes, type: 2),
      _TableRow(text: 'Второе блюдо', dishes: dishes, type: 3)
    ],
  );
}

@swidget
Widget __tableRow(
    {required String text, required List<DishDto> dishes, required int type}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      MultiSelect(dishes: dishes, type: type),
      const AddButton(),
      MultiSelect(dishes: dishes, type: type),
      const DeleteButton()
    ],
  );
}
