import 'package:tl_food_administration/dto/dish_dto.dart';

class MenuDto {
  //final DateTime date;
  final String date;
  final List<DishDto> dishes;

  MenuDto(this.date, this.dishes);

  static final menus = [
    MenuDto('8/29/2022', DishDto.dishes),
    MenuDto(
        '8/28/2022', DishDto.dishes.where((dish) => dish.type == 1).toList()),
    MenuDto(
        '8/27/2022', DishDto.dishes.where((dish) => dish.type == 2).toList())
  ];
}
