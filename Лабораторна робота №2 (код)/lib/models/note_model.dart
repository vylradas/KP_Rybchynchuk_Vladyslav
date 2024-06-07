
import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject { 
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String type;
  @HiveField(3)
  String dateValue;
  @HiveField(4)
  String timeValue;

  NoteModel({
    required this.title, 
    required this.description, 
    required this.type, 
    required this.dateValue, 
    required this.timeValue
  });
}
