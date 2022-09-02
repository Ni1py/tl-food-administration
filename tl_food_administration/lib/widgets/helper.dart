import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:tl_food_administration/utils/hoverable.dart';

part 'helper.g.dart';

@hwidget
Widget _helper() {
  final isTap = useState(false);

  return Row(
    children: [
      Hoverable(
          child: (isHover) => GestureDetector(
                child: Icon(
                  isTap.value ? Icons.help_outlined : Icons.help_outline,
                  size: 30.0,
                  shadows: isHover
                      ? [
                          const Shadow(
                              color: Colors.black45,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 0.1)
                        ]
                      : [],
                ),
                onTap: () => isTap.value = !isTap.value,
              )),
      isTap.value ? const Gap(10.0) : const SizedBox.shrink(),
      isTap.value
          ? Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0) +
                      const EdgeInsets.symmetric(vertical: 5.0) +
                      const EdgeInsets.only(bottom: 10.0),
                  child: RichText(
                      text: const TextSpan(
                    style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Подготовка к добавлению меню: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ' для того чтобы блюда для выбора отобразились, вы должны выбрать поставщика.\n'),
                      TextSpan(
                          text: 'Добавление меню: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'чтобы добавить меню через таблицу, надо нажать на '),
                      TextSpan(
                          text: '+',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0)),
                      TextSpan(
                          text:
                              ' рядом с нужной категорией, потом в сплывающем окне выбрать нужные блюда, нажать на кнопку '),
                      TextSpan(
                          text: 'OK',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ', а затем на кнопку '),
                      TextSpan(
                          text: 'Сохранить',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' под таблицей.\n'),
                      TextSpan(
                          text: 'Удаление из меню: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'чтобы удалить блюдо из категории, нужно просто нажать на него в столбце, где оно отображается. Для того чтобы удалить все блюда из категории, нужно нажать на кнопку '),
                      TextSpan(
                          text: 'Корзина',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ' рядом с той категорией, которую хотите удалить.')
                    ],
                  )),
                ),
              ),
            )
          : const SizedBox.shrink()
    ],
  );
}
