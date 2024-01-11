import 'package:uuid/uuid.dart';

class Category {
  Category({required this.name}) : id = const Uuid().v4();

  String id;
  final String name;
}
