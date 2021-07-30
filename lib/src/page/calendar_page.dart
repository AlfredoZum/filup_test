import 'package:filup_test/src/component/calendar_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// component
import 'package:filup_test/src/component/calendar_component.dart';

// Utils
import 'package:filup_test/src/util/size_config.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(750, 1334));

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        backgroundColor: Colors.deepPurple[600],
        elevation: 0.0,
        title: const Text('Calender'),
      ),
      body: _bodyCalendar(),
    );
  }

  Widget _bodyCalendar(){
    return Container(
      child: Column(
        children: <Widget>[
          CalendarComponent(),
          CalendarDays(),
        ],
      ),
    );
  }
}
