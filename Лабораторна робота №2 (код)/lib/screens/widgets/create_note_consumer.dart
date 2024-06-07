import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:plan_everyday/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:plan_everyday/cubits/date_cubit/date_cubit.dart';
import 'package:plan_everyday/cubits/time_cubit/time_cubit.dart';
import 'package:plan_everyday/cubits/type_cubit/type_cubit.dart';
import 'package:plan_everyday/provider/radio_provider.dart';
import 'package:plan_everyday/provider/date_time_provider.dart';
import 'package:plan_everyday/screens/widgets/date_time_widget.dart';
import 'package:plan_everyday/screens/widgets/radio_widget.dart';

class ChooseTypeWidget extends StatelessWidget {
  const ChooseTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioWidget(
            typeColor: Color.fromARGB(255, 85, 255, 0),
            titleRadio: 'Event',
            valueInput: 1,
            onChangeValue: () => BlocProvider.of<TypeCubit>(context).selectType(1),
          ),
        ),
        Expanded(
          child: RadioWidget(
            typeColor: Color.fromARGB(255, 255, 21, 0),
            titleRadio: 'Task',
            valueInput: 2,
            onChangeValue: () => BlocProvider.of<TypeCubit>(context).selectType(2),
          ),
        ),
        Expanded(
          child: RadioWidget(
            typeColor: Colors.yellowAccent,
            titleRadio: 'Note',
            valueInput: 3,
            onChangeValue: () => BlocProvider.of<TypeCubit>(context).selectType(3),
          ),
        ),
      ],
    );
  }
}

class ChooseDateTime extends StatelessWidget {
  const ChooseDateTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final date = context.watch<DateCubit>().state;
    final time = context.watch<TimeCubit>().state;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DateTimeWidget(
          titleText: 'Date', 
          valueText: date, 
          iconSection: CupertinoIcons.calendar,
          onTap: () async {
            final getValue = await showDatePicker(
              context: context, 
              initialDate: DateTime.now(), 
              firstDate: DateTime(2000), 
              lastDate: DateTime(2030));
          
              if(getValue != null){
                final format = DateFormat.yMd();
                context.read<DateCubit>().setDate(format.format(getValue));
              }
          },
        ),
        SizedBox(width: 12),
        DateTimeWidget(
          titleText: 'Time', 
          valueText: time, 
          iconSection: CupertinoIcons.clock,
          onTap: () async {
            final getTime = await showTimePicker(
              context: context, 
              initialTime: TimeOfDay.now()
            );
          
            if(getTime != null){
              context.read<TimeCubit>().setTime(getTime.format(context));
            }
          },
        ),
      ],
    );
  }
}