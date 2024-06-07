import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'date_state.dart';

class DateCubit extends Cubit<String> {
  DateCubit() : super('dd/mm/yy');

  void setDate(String date) {
    emit(date);
    print('DateCubit: setting date to $date');
  }
}