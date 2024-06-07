import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_everyday/cubits/type_cubit/type_cubit.dart';
import 'package:plan_everyday/provider/radio_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioWidget extends StatelessWidget {
  final Color typeColor;
  final String titleRadio;
  final int valueInput;
  final Function onChangeValue;

  const RadioWidget({
    Key? key,
    required this.typeColor,
    required this.titleRadio,
    required this.valueInput,
    required this.onChangeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypeCubit, int>(
      builder: (context, selectedType) {
        return RadioListTile<int>(
          value: valueInput,
          groupValue: selectedType,
          onChanged: (value) => onChangeValue(),
          title: Text(
            titleRadio,
            style: TextStyle(
              color: typeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          activeColor: typeColor,
        );
      },
    );
  }
}