import 'package:hive/hive.dart';

part 'Event.g.dart';

@HiveType(typeId: 0)
class Event extends HiveObject {
  @HiveField(0)
  var id;

  @HiveField(1)
  var name;

  @HiveField(2)
  var imageUrl;

  @HiveField(3)
  var date;

  @HiveField(4)
  var description;

  @HiveField(5)
  var minPrice;

  @HiveField(6)
  var maxPrice;

  Event(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.date,
      required this.description,
      required this.minPrice,
      required this.maxPrice});
}
