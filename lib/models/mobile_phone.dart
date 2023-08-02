import 'package:objectbox/objectbox.dart';
import 'package:objectbox_sample_app/models/person3.dart';

@Entity()
class MobilePhone {
  @Id()
  int id;
  final String modelName;

  final ToOne<Person3> owner = ToOne<Person3>();

  MobilePhone({this.id = 0, required this.modelName});
}
