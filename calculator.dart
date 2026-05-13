import 'dart:io';

void main() {
  stdout.write('Enter first number: ');
  double? num1 = double.tryParse(stdin.readLineSync()!);

  stdout.write('Enter operator (+, -, *, /): ');
  String? operator = stdin.readLineSync();

  stdout.write('Enter second number: ');
  double? num2 = double.tryParse(stdin.readLineSync()!);

  if (num1 == null || num2 == null || operator == null) {
    print('Invalid input');
    return;
  }

  double result;

  switch (operator) {
    case '+':
      result = num1 + num2;
      print('Result: $result');
      break;

    case '-':
      result = num1 - num2;
      print('Result: $result');
      break;

    case '*':
      result = num1 * num2;
      print('Result: $result');
      break;

    case '/':
      if (num2 == 0) {
        print('Cannot divide by zero');
      } else {
        result = num1 / num2;
        print('Result: $result');
      }
      break;

    default:
      print('Invalid operator');
  }
}g