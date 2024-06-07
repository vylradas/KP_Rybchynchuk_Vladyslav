import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<String> {
  TimeCubit() : super('hh:mm');

  void setTime(String time) {
    emit(time);
    print('TimeCubit: setting time to $time');
  }
}