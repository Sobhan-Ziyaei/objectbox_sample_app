import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_sample_app/main.dart';
import 'package:objectbox_sample_app/models/person2.dart';
import 'package:objectbox_sample_app/objectbox.g.dart';

class QueryScreen extends StatelessWidget {
  QueryScreen({Key? key}) : super(key: key);

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final person2Box = objectbox.store.box<Person2>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ObjectBox Query Sample'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 167, 75, 184),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.purple),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    hintText: 'Input Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _ageController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.purple),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    hintText: 'Input Age',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _nationalIdController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.purple),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    hintText: 'Input National Id',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 216, 216, 216),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    person2Box.put(
                      Person2(
                        nationalIdNumber: _nationalIdController.text,
                        name: _textController.text,
                        age: int.parse(_ageController.text),
                      ),
                    );
                    _textController.clear();
                    _nationalIdController.clear();
                    _ageController.clear();
                  },
                  child: const Text(
                    'Create',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 216, 216, 216),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    for (var element in person2Box.getAll()) {
                      print(
                        '${element.name} is ${element.age} years old and have ${element.nationalIdNumber} National Id and personal Id in this app is ${element.personId},',
                      );
                    }
                  },
                  child: const Text(
                    'Read',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 216, 216, 216),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    person2Box.removeAll();
                  },
                  child: const Text(
                    'Delete All',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 216, 216, 216),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    QueryBuilder<Person2> builder = person2Box
                        .query(Person2_.age.equals(28) |
                            Person2_.name.startsWith('s'))
                        .order(Person2_.name, flags: Order.descending);
                    Query<Person2> query = builder.build();

                    print(query.describeParameters());
                    print(query.describe());

                    for (var element in query.find()) {
                      print(
                          'person Id is ${element.personId} ${element.name} have ${element.age} years old');
                    }
                  },
                  child: const Text(
                    'Query',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
