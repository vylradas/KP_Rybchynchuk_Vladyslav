import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'type_state.dart';

class TypeCubit extends Cubit<int> {
  TypeCubit() : super(1); // Assuming default type is 'Event'

  void selectType(int type) {
    emit(type);
    print('TypeCubit: setting type to $type');
  }
}
