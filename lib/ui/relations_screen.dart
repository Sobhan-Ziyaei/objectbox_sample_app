import 'package:flutter/material.dart';
import 'package:objectbox_sample_app/main.dart';
import 'package:objectbox_sample_app/models/mobile_phone.dart';
import 'package:objectbox_sample_app/models/person3.dart';

import '../objectbox.g.dart';

class RelationScreen extends StatefulWidget {
  RelationScreen({Key? key}) : super(key: key);

  @override
  State<RelationScreen> createState() => _RelationScreenState();
}

class _RelationScreenState extends State<RelationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobilePhoneController = TextEditingController();
  final personBox = objectbox.store.box<Person3>();
  final mobilePhoneBox = objectbox.store.box<MobilePhone>();
  late List<Person3> persons;
  Person3? selectedPerson;

  @override
  void initState() {
    super.initState();
    persons = personBox.getAll();
    if (persons.isNotEmpty) {
      selectedPerson = persons.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ObjectBox Relations Sample'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 167, 75, 184),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Persons',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _nameController,
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
                height: 15,
              ),
              SizedBox(
                width: 180,
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
                    createPersonButtonPressed();
                  },
                  child: const Text(
                    'Create New Person',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Person : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              DropdownButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                isExpanded: true,
                alignment: Alignment.center,
                value: selectedPerson,
                items: persons
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPerson = value;
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 200,
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
                    removePersonButtonPressed();
                  },
                  child: const Text(
                    'Remove Selected Person',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Mobile Phones',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _mobilePhoneController,
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
                    hintText: 'Phone\'s name ',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
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
                    addPhoneButtonPressed();
                  },
                  child: const Text(
                    'Add new phone',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'All mobile phone(s) : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                ),
                child: Column(
                  children: mobilePhoneBox
                      .getAll()
                      .map((e) => Text(convertMobilePhoneToString(e)))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      '${selectedPerson != null ? selectedPerson!.name : 'selected person'}\'s mobile phone(s) :',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                ),
                child: Column(
                  children: selectedPerson == null
                      ? []
                      : getPersonMobilePhoneNames(selectedPerson!)
                          .map((phoneName) => Text(phoneName))
                          .toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
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
                    removeFirstMobilePhoneButtonPressed();
                  },
                  child: Text(
                    'Remove ${selectedPerson != null ? selectedPerson!.name : 'Selected person'}\'s first phone : ',
                    style: const TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int putNewPerson({required Box<Person3> personBox, required String name}) {
    return personBox.put(Person3(name: name));
  }

  Person3 addNewPerson(String name) {
    int id = putNewPerson(personBox: personBox, name: name);
    persons = personBox.getAll();
    return persons.where((p) => p.id == id).first;
  }

  void createPersonButtonPressed() {
    setState(() {
      Person3 person = addNewPerson(_nameController.text);
      selectedPerson = person;
      _nameController.clear();
    });
  }

  void putNewPhone(
      {required String mobilePhoneName,
      required Person3 owner,
      required Box<MobilePhone> mobilePhoneBox}) {
    MobilePhone newPhone = MobilePhone(modelName: _mobilePhoneController.text);
    newPhone.owner.target = owner;
    mobilePhoneBox.put(newPhone);
  }

  void addPhoneButtonPressed() {
    setState(() {
      if (selectedPerson != null) {
        putNewPhone(
            mobilePhoneName: _nameController.text,
            owner: selectedPerson!,
            mobilePhoneBox: mobilePhoneBox);

        _mobilePhoneController.clear();
        refreshPersons();
      }
    });
  }

  List<String> getPersonMobilePhoneNames(Person3 person) {
    return person.phones.map((phone) => phone.modelName).toList();
  }

  String convertMobilePhoneToString(MobilePhone mobilePhone) {
    Person3? owner = mobilePhone.owner.target;
    return '${mobilePhone.modelName} (${owner != null ? owner.name : 'nobody'})';
  }

  void refreshPersons() {
    persons = personBox.getAll();

    if (selectedPerson != null) {
      selectedPerson = persons.where((p) => p.id == selectedPerson!.id).first;
    }
  }

  void removeFirstPhone(
      {required Person3 person,
      required Box<Person3> personBox,
      required Box<MobilePhone> mobilePhoneBox}) {
    MobilePhone deletedPhone = person.phones.removeAt(0);
    personBox.put(person);
    mobilePhoneBox.remove(deletedPhone.id);
  }

  void removeFirstMobilePhoneButtonPressed() {
    if (selectedPerson != null) {
      setState(() {
        removeFirstPhone(
            person: selectedPerson!,
            mobilePhoneBox: mobilePhoneBox,
            personBox: personBox);

        refreshPersons();
      });
    }
  }

  void removePerson({
    required Box<Person3> personBox,
    required Box<MobilePhone> mobilePhoneBox,
    required Person3 person,
  }) {
    List<int> phoneIDs = person.phones.map((phone) => phone.id).toList();
    mobilePhoneBox.removeMany(phoneIDs);
    personBox.remove(person.id);
  }

  removePersonButtonPressed() {
    setState(() {
      if (selectedPerson != null) {
        removePerson(
            personBox: personBox,
            mobilePhoneBox: mobilePhoneBox,
            person: selectedPerson!);
        selectedPerson = null;
        refreshPersons();
      }
    });
  }
}
