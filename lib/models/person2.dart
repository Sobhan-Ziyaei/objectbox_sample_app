import 'package:objectbox/objectbox.dart';

@Entity()
class Person2 {
  @Id()
  int personId;

  @Unique()
  final String nationalIdNumber;

  final String name;
  final int age;

  Person2(
      {this.personId = 0,
      required this.nationalIdNumber,
      required this.name,
      required this.age});
}
