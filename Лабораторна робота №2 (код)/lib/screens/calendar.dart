/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_everyday/models/note_model.dart';
import 'package:plan_everyday/screens/create_note.dart';
import 'package:plan_everyday/screens/home_screen.dart';
import 'package:plan_everyday/screens/note_view.dart';
import 'package:plan_everyday/screens/widgets/note_card.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:riverpod/riverpod.dart';

class CalendarTable extends StatefulWidget {
  @override
  _CalendarTableState createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<NoteView>> notes = {};
   
  @override
  void dispose() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 187, 255, 1),
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    // Дія для першої кнопки
                  },
                  label: const Text("Categories", 
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,
                    )),
                  icon: const Icon(
                    Icons.list_alt_rounded,
                    color: Color.fromRGBO(0, 81, 145, 1),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(151, 187, 255, 1),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Дія для другої кнопки
                  },
                  label: const Text("Notelist", 
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,
                    )),
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Color.fromRGBO(0, 81, 145, 1),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(151, 187, 255, 1),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Дія для третьої кнопки
                  },
                  label: const Text("Search", 
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,
                    )),
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(0, 81, 145, 1),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(151, 187, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay, 
            firstDay: DateTime.utc(2000, 1, 1), 
            lastDay: DateTime.utc(2030, 12, 30),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: _onDaySelected,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
            ),
            onFormatChanged: (format) {
              if (_calendarFormat =! format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: 8,)
        ],
      ),
    );
  }
}*/