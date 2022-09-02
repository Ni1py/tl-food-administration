import 'package:tl_food_administration/data/dto/dish_dto.dart';

class MenuDto {
  //final DateTime date;
  final String date;
  final List<DishDto> dishes;

  MenuDto(this.date, this.dishes);

  static final menus = [
    MenuDto('9/29/2022', DishDto.dishes),
    MenuDto('9/22/2022', DishDto.dishes),
    MenuDto('9/21/2022', DishDto.dishes),
    MenuDto(
        '9/28/2022', DishDto.dishes.where((dish) => dish.type == 1).toList()),
    MenuDto(
        '9/27/2022', DishDto.dishes.where((dish) => dish.type == 2).toList())
  ];
}
