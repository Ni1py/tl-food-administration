// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_select.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class MultiSelect extends StatelessWidget {
  const MultiSelect(
      {Key? key,
      required this.dishes,
      required this.type,
      required this.onConfirm,
      required this.titleText})
      : super(key: key);

  final List<DishDto> dishes;

  final int type;

  final void Function(List<dynamic>) onConfirm;

  final String titleText;

  @override
  Widget build(BuildContext _context) => _multiSelect(
      dishes: dishes, type: type, onConfirm: onConfirm, titleText: titleText);
}
