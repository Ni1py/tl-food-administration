import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:tl_food_administration/dto/dish_dto.dart';

part 'date_picker.g.dart';

@hwidget
Widget _datePicker() {
  final _calendarFormat = useState(CalendarFormat.month);
  final _firstDay = DateTime(1990, 1);
  final _lastDay = DateTime(2050, 12);
  final _selectedDay = useState(DateTime.now());
  final _focusedDay = useState(DateTime.now());
  final _calendarMenu = useState({
    '8/21/2022': DishDto.dishes,
    '8/22/2022': DishDto.dishes.where((dish) => dish.type == 1).toList(),
    '8/23/2022': DishDto.dishes.where((dish) => dish.type == 2).toList()
  });

  List<DishDto> _getMenuForDay(DateTime day) {
    return _calendarMenu.value[DateFormat.yMd().format(day)] ?? [];
  }

  return Column(
    children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 200.0),
          child: TableCalendar(
            focusedDay: _focusedDay.value,
            firstDay: _firstDay,
            lastDay: _lastDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Неделя',
              CalendarFormat.twoWeeks: 'Месяц',
              CalendarFormat.week: '2 недели'
            },
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle:
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              weekendStyle:
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            calendarStyle: const CalendarStyle(
                markerDecoration: BoxDecoration(
                    color: Color(0xff008000), shape: BoxShape.circle)),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay.value, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              _selectedDay.value = selectedDay;
              _focusedDay.value = focusedDay;
              print(DateFormat.yMd().format(selectedDay));
            },
            calendarFormat: _calendarFormat.value,
            onFormatChanged: (format) {
              _calendarFormat.value = format;
            },
            eventLoader: (day) {
              return _getMenuForDay(day);
            },
            locale: 'ru_Ru',
          )),
      const Gap(20.0),
      Text(DateFormat.yMMMMd('ru_RU').format(_selectedDay.value)),
    ],
  );
}
