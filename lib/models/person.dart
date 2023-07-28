import 'package:objectbox/objectbox.dart';

@Entity()
class Person {
  @Id()
  int id;
  String name;

  Person(this.name, {this.id = 0});
}
