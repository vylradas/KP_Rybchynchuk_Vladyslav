import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:plan_everyday/constants.dart';
import 'package:plan_everyday/cubits/date_cubit/date_cubit.dart';
import 'package:plan_everyday/cubits/notes_cubit/notes_cubit.dart';
import 'package:plan_everyday/cubits/time_cubit/time_cubit.dart';
import 'package:plan_everyday/cubits/type_cubit/type_cubit.dart';
import 'package:plan_everyday/models/note_model.dart';
import 'package:plan_everyday/screens/home_screen.dart';
import 'package:plan_everyday/simple_bloc_observe.dart';

void main() async {
  // Ініціалізуємо Hive для використання з Flutter
  await Hive.initFlutter(); 

  // Встановлюємо спостерігача для BLoC
  Bloc.observer = SimpleBlocObserver();

  // Реєструємо адаптер для NoteModel
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  // Запускаємо додаток, використовуючи ProviderScope для управління станами
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Надаємо кілька провайдерів BLoC для управління станами
      providers: [
        BlocProvider(
          create: (context) {
            // Створюємо NotesCubit і викликаємо fetchAllNotes для завантаження всіх записів
            final notesCubit = NotesCubit();
            notesCubit.fetchAllNotes();
            return notesCubit;
          },
        ),
        BlocProvider(
          create: (context) => TypeCubit(), // Створюємо TypeCubit для збереження типу запису
        ),
        BlocProvider(
          create: (_) => DateCubit(), // Створюємо DateCubit для управління вибором дати
        ),
        BlocProvider(
          create: (_) => TimeCubit(), // Створюємо TimeCubit для управління вибором часу
        ),
      ],
      child: MaterialApp(
        title: 'Plan Everyday',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 81, 145, 1)),
          unselectedWidgetColor: Colors.white,
        ),
        home: const HomeScreen(), // Головне вікно додатку
      ),
    );
  }
}

