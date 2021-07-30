import 'package:filup_test/src/bloc/provider.dart';
import 'package:filup_test/src/util/size_config.dart';
import 'package:flutter/material.dart';

class CalendarDays extends StatelessWidget {

  CalendarBloc? calendarBloc;

  @override
  Widget build(BuildContext context) {

    calendarBloc = Provider.calendarBloc(context);

    return Expanded(
      child: Column(
        children: <Widget>[
          _typesDays(),
          _listTypesDays(),
        ],
      ),
    );
  }

  Widget _typesDays(){
    return Container(
      height: SizeConfig.row10 * 4,
      color: Colors.grey[300],
      child: Row(
        children: <Widget>[
          _typeDay('Test', Colors.green),
          _typeDay('Event', Colors.orange),
          _typeDay('Holiday', Colors.red),
        ],
      ),
    );
  }

  Widget _typeDay(String title, MaterialColor color) {
    return Container(
      height: SizeConfig.row10 * 2.5,
      width: SizeConfig.row10 * 9,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.row10),
      padding: EdgeInsets.all(SizeConfig.row10 / 3),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.row10 / 2,
              left: 5.0,
            ),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          Center(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _listTypesDays(){
    return Expanded(
      child: Container(
        color: Colors.grey[300],
        child: ListView.builder(
          itemCount: calendarBloc!.task.length,
          itemBuilder: (context, index) =>
              _cardTask(context, calendarBloc!.task[index]),
        ),
      ),
    );
  }

  Widget _cardTask(BuildContext ctx, Map<String, dynamic> task){

    final TextStyle _styleType = Theme.of(ctx).textTheme.bodyText2!.copyWith(
        color: task['color'] as Color
    );

    final TextStyle _styleTask = Theme.of(ctx).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.bold
    );

    final TextStyle? _styleDate = Theme.of(ctx).textTheme.subtitle2;

    return SizedBox(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 3.0),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.row10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(task['type'].toString(), style: _styleType),
                  SizedBox(height: SizeConfig.row10),
                  Text(task['task'].toString(), style: _styleTask),
                ],
              ),
              Text(task['date'].toString(), style: _styleDate)
            ],
          ),
        ),
      ),
    );
  }

}
