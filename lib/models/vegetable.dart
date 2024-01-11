import 'package:uuid/uuid.dart';

enum AmountType {
  kg,
  piece,
}

class Vegetable {
  Vegetable(
      {required this.images,
      required this.name,
      required this.price,
      required this.amountType,
      required this.pieceWeight,
      required this.description,
      required this.country})
      : id = const Uuid().v4();

  String id;
  final List<String> images;
  final String name;
  final double price;
  final AmountType amountType;
  final int pieceWeight;
  final String description;
  final String country;
}
