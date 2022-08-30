// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class Table extends StatelessWidget {
  const Table(this.dishes, {Key? key}) : super(key: key);

  final List<DishDto> dishes;

  @override
  Widget build(BuildContext _context) => _table(dishes);
}

class _TableRow extends StatelessWidget {
  const _TableRow(
      {Key? key, required this.text, required this.dishes, required this.type})
      : super(key: key);

  final String text;

  final List<DishDto> dishes;

  final int type;

  @override
  Widget build(BuildContext _context) =>
      __tableRow(text: text, dishes: dishes, type: type);
}
