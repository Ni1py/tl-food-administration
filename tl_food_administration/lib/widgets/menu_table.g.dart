// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_table.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class MenuTable extends HookWidget {
  const MenuTable({Key? key, required this.dishes, required this.vendor})
      : super(key: key);

  final List<DishDto> dishes;

  final String vendor;

  @override
  Widget build(BuildContext _context) =>
      _menuTable(dishes: dishes, vendor: vendor);
}

class _TableRow extends StatelessWidget {
  const _TableRow(
      {Key? key,
      required this.text,
      required this.dishesForSelect,
      required this.dishesForChips,
      required this.type,
      required this.onConfirm,
      required this.titleText})
      : super(key: key);

  final String text;

  final List<DishDto> dishesForSelect;

  final ValueNotifier<List<DishDto>> dishesForChips;

  final int type;

  final void Function(List<dynamic>) onConfirm;

  final String titleText;

  @override
  Widget build(BuildContext _context) => __tableRow(
      text: text,
      dishesForSelect: dishesForSelect,
      dishesForChips: dishesForChips,
      type: type,
      onConfirm: onConfirm,
      titleText: titleText);
}

class _VerticalStrip extends StatelessWidget {
  const _VerticalStrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => __verticalStrip();
}
