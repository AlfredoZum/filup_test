import 'package:filup_test/src/bloc/calendar_bloc.dart';
import 'package:filup_test/src/bloc/provider.dart';
import 'package:flutter/material.dart';

// Utils
import 'package:filup_test/src/util/size_config.dart';

class CalendarComponent extends StatelessWidget {

  CalendarBloc? calendarBloc;

  @override
  Widget build(BuildContext context) {

    calendarBloc = Provider.calendarBloc(context);

    return Column(
      children: <Widget>[
        _headerDate(context),
        _headerDays(context),
        _calendarBody(context),
      ],
    );
  }

  Widget _headerDate(BuildContext ctx){

    final TextStyle _style = Theme.of(ctx).textTheme.headline6!.copyWith(
      color: Colors.white
    );

    return Container(
      height: SizeConfig.row10 * 5,
      color: Colors.deepPurple[600],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            iconSize: 30.0,
            color: Colors.white,
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () => print('holaa'),
          ),
          Text('June, 2021', style: _style),
          IconButton(
            iconSize: 30.0,
            color: Colors.white,
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () => print('holaa'),
          ),
        ],
      ),
    );
  }

  Widget _headerDays(BuildContext ctx){

    final TextStyle _style = Theme.of(ctx).textTheme.subtitle2!;

    final List<Widget> daysW = calendarBloc!.getDaysWeek(_style);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.row20),
      height: SizeConfig.row10 * 3.5,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: daysW,
      ),
    );
  }

  Widget _calendarBody(BuildContext ctx){

    // final List<Widget> daysW = calendarBloc!.getAllDays(_style);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.row20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _showRowDays(ctx, 0),
          _showRowDays(ctx, 1),
          _showRowDays(ctx, 2),
          _showRowDays(ctx, 3),
          _showRowDays(ctx, 4),
        ],
      ),
    );
  }

  Widget _showRowDays(BuildContext ctx, int index){

    final TextStyle _style = Theme.of(ctx).textTheme.subtitle2!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.row10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: calendarBloc!.getDays(_style, index),
      ),
    );
  }

}
