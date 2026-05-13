import 'dart:io';
import 'dart:math';

List<String> history = [];
String lastCalculation = "";

double readNumber(String message) {
  while (true) {
    stdout.write(message);

    String? input = stdin.readLineSync();
    double? number = double.tryParse(input ?? "");

    if (number != null) {
      return number;
    } else {
      print("\n[ERROR] Invalid input. Please enter a number.");
    }
  }
}

void showHistory() {
  if (history.isEmpty) {
    print("\n[INFO] No history found.");
  } else {
    print("\n=================================");
    print("      CALCULATION HISTORY");
    print("=================================");

    for (String item in history) {
      print(item);
    }

    print("=================================");
  }

  print("\nPress Enter to return to menu...");
  stdin.readLineSync();
}

void main() {
  while (true) {
    print("\n=================================");
    print("        DART CALCULATOR");
    print("=================================");
    print(" 1. Addition");
    print(" 2. Subtraction");
    print(" 3. Multiplication");
    print(" 4. Division");
    print(" 5. Modulus");
    print(" 6. Average");
    print(" 7. Power");
    print(" 8. Log Base 10");
    print(" 9. Natural Log (ln)");
    print("10. Show History");
    print("11. Clear History");
    print("12. Repeat Last Calculation");
    print(" 0. Exit");
    print("=================================");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    if (choice == "0") {
      print("\n[INFO] Program closed.");
      break;
    }

    if (choice == "10") {
      showHistory();
      continue;
    }

    if (choice == "11") {
      history.clear();

      print("\n[INFO] History cleared.");

      print("\nPress Enter to return to menu...");
      stdin.readLineSync();

      continue;
    }

    if (choice == "12") {
      if (lastCalculation.isEmpty) {
        print("\n[INFO] No previous calculation found.");
      } else {
        print("\n=================================");
        print("      LAST CALCULATION");
        print("=================================");
        print(lastCalculation);
        print("=================================");
      }

      print("\nPress Enter to return to menu...");
      stdin.readLineSync();

      continue;
    }

    if (choice != "1" &&
        choice != "2" &&
        choice != "3" &&
        choice != "4" &&
        choice != "5" &&
        choice != "6" &&
        choice != "7" &&
        choice != "8" &&
        choice != "9") {
      print("\n[ERROR] Invalid menu choice.");

      print("\nPress Enter to continue...");
      stdin.readLineSync();

      continue;
    }

    double num1 = 0;
    double num2 = 0;

    if (choice == "8" || choice == "9") {
      num1 = readNumber("\nEnter number: ");
    } else {
      num1 = readNumber("\nEnter first number: ");
      num2 = readNumber("Enter second number: ");
    }

    double result = 0;
    String calculation = "";

    print("\nCalculating...\n");

    if (choice == "1") {
      result = num1 + num2;
      calculation = "$num1 + $num2 = $result";
    } else if (choice == "2") {
      result = num1 - num2;
      calculation = "$num1 - $num2 = $result";
    } else if (choice == "3") {
      result = num1 * num2;
      calculation = "$num1 * $num2 = $result";
    } else if (choice == "4") {
      if (num2 == 0) {
        print("[ERROR] Cannot divide by zero.");

        print("\nPress Enter to continue...");
        stdin.readLineSync();

        continue;
      }

      result = num1 / num2;
      calculation = "$num1 / $num2 = $result";
    } else if (choice == "5") {
      result = num1 % num2;
      calculation = "$num1 % $num2 = $result";
    } else if (choice == "6") {
      result = (num1 + num2) / 2;
      calculation = "Average of $num1 and $num2 = $result";
    } else if (choice == "7") {
      result = pow(num1, num2).toDouble();
      calculation = "$num1 ^ $num2 = $result";
    } else if (choice == "8") {
      if (num1 <= 0) {
        print("[ERROR] Log undefined for zero or negative numbers.");

        print("\nPress Enter to continue...");
        stdin.readLineSync();

        continue;
      }

      result = log(num1) / ln10;
      calculation = "log($num1) = $result";
    } else if (choice == "9") {
      if (num1 <= 0) {
        print("[ERROR] ln undefined for zero or negative numbers.");

        print("\nPress Enter to continue...");
        stdin.readLineSync();

        continue;
      }

      result = log(num1);
      calculation = "ln($num1) = $result";
    }

    print("=================================");
    print(" RESULT = $result");
    print("=================================");

    history.add(calculation);
    lastCalculation = calculation;

    print("\nPress Enter to return to menu...");
    stdin.readLineSync();
  }
}