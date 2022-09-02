// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_creation_page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class MenuCreationPage extends HookWidget {
  const MenuCreationPage(this.dishes, {Key? key}) : super(key: key);

  final List<DishDto> dishes;

  @override
  Widget build(BuildContext _context) => _menuCreationPage(dishes);
}

class _VendorRow extends StatelessWidget {
  const _VendorRow({Key? key, required this.dishes, required this.vendor})
      : super(key: key);

  final List<DishDto> dishes;

  final ValueNotifier<String?> vendor;

  @override
  Widget build(BuildContext _context) =>
      __vendorRow(dishes: dishes, vendor: vendor);
}
