import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Equitable extends StatefulWidget {
  const Equitable({super.key});

  @override
  State<Equitable> createState() => _EquitableState();
}

class _EquitableState extends State<Equitable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
         Person person1 =  Person(name: "Umer", age: 22);
         Person person2 =  Person(name: "Umer", age: 22);

         print(person1.hashCode);
         print(person2.hashCode);
         print(person1 == person2);
         
        },
      ),
    );
  }
}class Person extends Equatable{
  String name;
  int age;

  Person({required this.name, required this.age});
  @override
  List<Object> get props => [name, age];
}

