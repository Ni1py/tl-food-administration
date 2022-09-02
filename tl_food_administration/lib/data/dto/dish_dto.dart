class DishDto {
  final int id;
  final String vendor;
  final String name;
  final double price;
  final String description;
  final int type;
  final String weight;
  final String imagePath;

  DishDto(
    this.id,
    this.vendor,
    this.name,
    this.price,
    this.description,
    this.type,
    this.weight,
    this.imagePath,
  );

  static final defaultDish = [DishDto(0, '', '', 0, '', 0, '', '')];

  static final dishes = [
    DishDto(
      0,
      'Моторин',
      'Борщ',
      100.0,
      'Самый вкусный борщ',
      1,
      '80',
      '',
    ),
    DishDto(
      1,
      'Моторин',
      'Котлета по-киевски',
      60.0,
      'Куриная',
      3,
      '50',
      '',
    ),
    DishDto(
      2,
      'Моторин',
      'Макароны по-флотски',
      75.0,
      'Самые мясные',
      3,
      '60',
      '',
    ),
    DishDto(
      3,
      'Моторин',
      'Паста болоньезе',
      80.0,
      'Говядина',
      2,
      '80',
      '',
    ),
    DishDto(
      4,
      'Звениговский',
      'Салат Греческий',
      150.0,
      'Самый вкусный',
      0,
      '90',
      '',
    ),
    DishDto(
      5,
      'Моторин',
      'Макароны по-морскому',
      75.0,
      'Самые мясные',
      3,
      '60',
      '',
    ),
    DishDto(
      6,
      'Моторин',
      'Котлета по-деревенски',
      80.0,
      'Самые сочная',
      3,
      '60',
      '',
    ),
    DishDto(
      7,
      'Моторин',
      'Городская котлета',
      80.0,
      'Самые сочная',
      3,
      '60',
      '',
    ),
  ];
}
