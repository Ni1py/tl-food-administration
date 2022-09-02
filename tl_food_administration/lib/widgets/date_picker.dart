import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:tl_food_administration/data/dto/dish_dto.dart';
import 'package:tl_food_administration/data/dto/menu_dto.dart';

part 'date_picker.g.dart';

@hwidget
Widget _datePicker({required List<MenuDto> menus}) {
  final _calendarFormat = useState(CalendarFormat.month);
  final _firstDay = DateTime(1990, 1);
  final _lastDay = DateTime(2050, 12);
  final _selectedDay = useState(DateTime.now());
  final _focusedDay = useState(DateTime.now());

  List<DishDto> _getMenuForDay(DateTime day) {
    return menus
            .where((menu) => menu.date == DateFormat.yMd().format(day))
            .map((menu) => menu.dishes)
            .toList()
            .isEmpty
        ? []
        : DishDto.defaultDish;
  }

  return Column(
    children: [
      SizedBox(
        width: 400.0,
        child: TableCalendar(
          focusedDay: _focusedDay.value,
          firstDay: _firstDay,
          lastDay: _lastDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableCalendarFormats: const {
            CalendarFormat.month: 'Месяц',
            CalendarFormat.twoWeeks: '2 недели',
            CalendarFormat.week: 'Неделя'
          },
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle:
                TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            weekendStyle:
                TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          calendarStyle: const CalendarStyle(
              markerSizeScale: 0.4,
              markerDecoration:
                  BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.green,
                    offset: Offset(0.0, -17.0),
                    blurRadius: 40.0,
                    spreadRadius: 11.0,
                    blurStyle: BlurStyle.inner),
                BoxShadow(
                    color: Colors.green,
                    offset: Offset(0.0, -17.0),
                    blurRadius: 2.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer)
              ])),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay.value, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            _selectedDay.value = selectedDay;
            _focusedDay.value = focusedDay;
          },
          calendarFormat: _calendarFormat.value,
          onFormatChanged: (format) {
            _calendarFormat.value = format;
          },
          eventLoader: (day) {
            return _getMenuForDay(day);
          },
          locale: 'ru_Ru',
        ),
      ),
      const Gap(20.0),
      Text(DateFormat.yMMMMd('ru_RU').format(_selectedDay.value)),
    ],
  );
}
