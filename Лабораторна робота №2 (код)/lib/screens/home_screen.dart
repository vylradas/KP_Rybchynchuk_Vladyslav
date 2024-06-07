import 'package:flutter/material.dart';
import 'package:plan_everyday/screens/create_note_page.dart';
import 'package:plan_everyday/screens/search_screen.dart';
import 'package:plan_everyday/screens/widgets/notelist.dart';

// Головний екран додатку
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 187, 255, 1),
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Кнопка "Категорії"
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
                // Кнопка "Календар"
                ElevatedButton.icon(
                  onPressed: () {
                    // Дія для другої кнопки
                  },
                  label: const Text("Calendar", 
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
                // Кнопка "Пошук"
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SearchScreen()));
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
      // Фоновий колір головного екрану
      backgroundColor: const Color.fromRGBO(27, 29, 84, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Перехід до сторінки створення нотатки
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNotePage()));
        },
        backgroundColor: Color(0xFF1977F3),  
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      // Відображення списку нотаток
      body: NoteList(),
    );
  }
}

