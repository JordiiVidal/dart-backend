import 'dart:core';
import 'dart:io';

main() {
  bool exit = false;
  do {
    int option = menu();
    switch (option) {
      case 1:
        basics();
        break;
      case 2:
        inputUser();
        break;
      case 3:
        types();
        break;
      case 4:
        useAssert();
        break;
      default:
        exit = true;
        break;
    }
  } while (!exit);
}

int menu() {
  const int exit = 0;
  var options = [1, 2, 3, 4, 5];
  stdout.writeln('Select option menu: \n1.Basics\n2.Input\n3.Types\n4.Assert');
  try {
    String? input = stdin.readLineSync();
    int option = int.parse(input ?? '');
    return (options.contains(option)) ? option : exit;
  } catch (e) {
    return exit;
  }
}

void basics() {
  var firstName = 'Jordi';
  var lastName = 'Vidal';
  //lastName = 12; Error lastName(String)
  dynamic age = '12';
  age = 12;
  String helloWorld = 'Hello World';
  print(helloWorld);
  print(firstName + ' ' + lastName);
  print('$firstName $lastName my age is $age'); //Print using INTERPOLATION
}

void inputUser() {
  stdout.writeln('What is yout name?:'); //Standard Output
  String? name = stdin.readLineSync(); //Standard Input
  print('My name is $name');
}

void types() {
  int amount1 = 12;
  var amount2 = 32; //Dart automatically identifies as an integer value
  double amount3 = 32.2;
  String name = 'Bob';
  bool isValid = true;
  dynamic age = '12'; //Weak variables
  var two = int.parse('0');
  var twoString = two.toString();
  print('${amount1 + amount2 + amount3}');
  print('Name: $name');
  if (isValid) print('My age is $age');
  print(twoString);
}

void useAssert() {
  //dart --enable-asserts file_name.dart
  var name = 'assert';
  assert(name != 'assert');//Error
  var number = 3.1432.toStringAsFixed(2);
  assert (number == 3.14);
}

