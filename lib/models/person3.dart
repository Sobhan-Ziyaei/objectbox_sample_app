import 'package:objectbox/objectbox.dart';
import 'package:objectbox_sample_app/models/mobile_phone.dart';

@Entity()
class Person3 {
  @Id()
  int id;

  final String name;

  @Backlink('owner')
  final ToMany<MobilePhone> phones = ToMany<MobilePhone>();

  Person3({this.id = 0, required this.name});
}
