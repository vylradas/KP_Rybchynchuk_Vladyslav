import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:plan_everyday/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:plan_everyday/cubits/date_cubit/date_cubit.dart';
import 'package:plan_everyday/cubits/time_cubit/time_cubit.dart';
import 'package:plan_everyday/cubits/type_cubit/type_cubit.dart';
import 'package:plan_everyday/models/note_model.dart';
import 'package:plan_everyday/screens/widgets/create_note_consumer.dart';
import 'package:plan_everyday/screens/widgets/create_note_field.dart';
import 'package:plan_everyday/screens/widgets/save_button.dart';

class CreateNoteForm extends StatefulWidget {
  const CreateNoteForm({Key? key}) : super(key: key);

  @override
  State<CreateNoteForm> createState() => _CreateNoteFormState();
}

class _CreateNoteFormState extends State<CreateNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, description;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            'Title',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(
            height: 4,
          ),
          // Віджет для введення заголовку нотатки
          CreateNoteField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Add Note Name',
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Description',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(
            height: 4,
          ),
          // Віджет для введення опису нотатки
          CreateNoteField(
            onSaved: (value) {
              description = value;
            },
            hint: 'Add Description',
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Type',
            style: TextStyle(
                fontSize: 16, // Вибір типу створюваного запису
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          const SizedBox(height: 4,),
          // Секція для вибору типу створюваного запису
          ChooseTypeWidget(),
          const SizedBox(height: 16,),
          // Секція для зазначення дати та часу
          ChooseDateTime(),
          const SizedBox(height: 16,),
          Row(
            children: [
              const Spacer(),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return SaveNoteButton(
                    isLoading: state is AddNoteLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        
                        var date = context.read<DateCubit>().state;
                        var time = context.read<TimeCubit>().state;
                        var selectedType = context.read<TypeCubit>().state;

                        var noteModel = NoteModel(
                          title: title!,
                          description: description!,
                          type: selectedType == 1 ? 'Event' : selectedType == 2 ? 'Task' : 'Note',
                          dateValue: date,
                          timeValue: time,
                        );

                        print('Saving note with type: $selectedType, date: $date, and time: $time');
                        context.read<AddNoteCubit>().addNote(noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}