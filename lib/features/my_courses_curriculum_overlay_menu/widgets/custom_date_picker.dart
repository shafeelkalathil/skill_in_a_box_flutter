import 'package:flutter/material.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({required this.focusedDay,
    super.key, this.selectedDay, this.onDaySelected,});

  final DateTime focusedDay;
  final DateTime? selectedDay;
  final void Function(DateTime, DateTime)? onDaySelected;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        color: dark ? const Color(0xff2C2C2E) : null,
      ),
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child: TableCalendar(
        firstDay: DateTime(2000),
        lastDay: DateTime(2100),
        focusedDay: focusedDay,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        onDaySelected: onDaySelected,
        daysOfWeekHeight: 20,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: body1.copyWith(
            color: dark ? const Color(0xffD3D3D3) : null,
          ),
          weekendStyle: body1.copyWith(
            color: dark ? const Color(0xffD3D3D3) : null,
          ),
        ),
        headerStyle: HeaderStyle(
          headerMargin: EdgeInsets.all(context.screenWidth*0.06),
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: heading3.copyWith(
              color: dark ? Colors.white : silverChalice.shade900,),
          leftChevronIcon: Icon(Icons.arrow_back_ios,size: 15,
              color: dark ? Colors.white : silverChalice.shade900,),
          rightChevronIcon: Icon(Icons.arrow_forward_ios, size: 15,
              color: dark ? Colors.white : silverChalice.shade900,),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: orange.shade100,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: orange.shade500,
            shape: BoxShape.circle,
          ),
          todayTextStyle: const TextStyle(color: Colors.black),
          selectedTextStyle: const TextStyle(color: Colors.white),
          defaultTextStyle: const TextStyle(color: Colors.black),
          weekendTextStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
