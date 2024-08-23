import 'dart:io';

import 'expense_tracker.dart';

void main() {
  ExpenseTracker tracker = ExpenseTracker();
  bool exit = false;

  while (!exit) {
    print('\n------------Expense Manager------------');
    print('1. Add Expense');
    print('2. view Expense');
    print('3. Delete Expense');
    print('4. Exit');

    stdout.write('\n Choose an Option: ');
    int? choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        _addExpense(tracker);
        break;

      case 2:
        tracker.viewExpense();
        break;
      case 3:
        _deleteExpense(tracker);
        break;

      case 4:
        exit = true;
        print('Thank You For Using Expense Tracker');
        break;
    }
    if (!exit) {
      stdout.write("\nPress Enter to continue...");
      stdin.readLineSync();
    }
  }
}

void _addExpense(ExpenseTracker tracker) {
  stdout.write('\n Enter title:');
  String title = stdin.readLineSync()!;
  stdout.write('\n Enter Category: ');
  String category = stdin.readLineSync()!;
  stdout.write('\n Enter amount:');
  double amount = double.tryParse(stdin.readLineSync()!) ?? 0.0;

  DateTime date = DateTime.now();

  tracker.addExpense(title, category, amount, date);
}

void _deleteExpense(ExpenseTracker tracker) {
  tracker.viewExpense();
  stdout.write('Enter the index of the expense to remove');
  int? index = int.parse(stdin.readLineSync()!);

  if (index > 0 && index <= tracker.expenses.length) {
    tracker.deleteExpense(index - 1);
  } else {
    print('Invalid expense');
  }
}
