import 'package:flutter/material.dart';

class CalendarBloc {

  final List<String> listDaysWeek =
  <String>['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

  final List<List<Map>> listDays = <List<Map>>[
    // ignore: always_specify_types, lines_longer_than_80_chars
    <Map>[{'day': 27, 'last_month': true}, {'day': 28, 'last_month': true}, {'day': 29, 'last_month': true}, {'day': 30, 'last_month': true}, {'day': 31, 'last_month': true}, {'day': 1}, {'day': 2}],
    // ignore: always_specify_types, lines_longer_than_80_chars
    <Map>[{'day': 3, 'color': Colors.red}, {'day': 4}, {'day': 5}, {'day': 6}, {'day': 7}, {'day': 8, 'color': Colors.green}, {'day': 9}],
    // ignore: always_specify_types, lines_longer_than_80_chars
    <Map>[{'day': 10}, {'day': 11}, {'day': 12}, {'day': 13}, {'day': 14}, {'day': 15}, {'day': 16}],
    // ignore: always_specify_types, lines_longer_than_80_chars
    <Map>[{'day': 17}, {'day': 18}, {'day': 19, 'color': Colors.orange}, {'day': 20}, {'day': 21}, {'day': 22, 'color': Colors.green}, {'day': 23}],
    // ignore: always_specify_types, lines_longer_than_80_chars
    <Map>[{'day': 24}, {'day': 25}, {'day': 26}, {'day': 27}, {'day': 28}, {'day': 29}, {'day': 30}],
  ];

  final List<Map<String, dynamic>> task = [
    {
      'type': 'Holiday',
      'task': 'Public Holiday',
      'date': '03 Jul 2021 Mon',
      'color': Colors.red,
    },
    {
      'type': 'Test',
      'task': 'Geometric Weekly test',
      'date': '08 Jun 2021 Mon',
      'color': Colors.green,
    },
    {
      'type': 'Event',
      'task': 'Event import',
      'date': '19 Jun 2021 Mon',
      'color': Colors.orange,
    },
    {
      'type': 'Test',
      'task': 'Test flutter',
      'date': '22 Jun 2021 Mon',
      'color': Colors.green,
    }
  ];

  List<Widget> getDaysWeek(TextStyle style) => listDaysWeek
      .map((String day) => Text(day, style: style)).toList();


  List<Widget> getDays(TextStyle style, int index) {

    return listDays[index].map((Map item) {

      TextStyle _style = style;

      if(item['last_month'] != null){
        _style = _style.copyWith(color: Colors.grey[400]);
      }

      final TextStyle _styleTask = style.copyWith(color: Colors.white);
      if( item['color'] != null ){
        return Container(
          alignment: Alignment.center,
          width: 35.0,
          child: Container(
            width: 25.0,
            height: 25.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item['color'] as Color,
            ),
            child: Center(
              child: Text(item['day'].toString(), style: _styleTask),
            ),
          ),
        );
      }

      return Container(
        alignment: Alignment.center,
        width: 35.0,
        child: Text(item['day'].toString(), style: _style),
      );
    }).toList();

  }

}