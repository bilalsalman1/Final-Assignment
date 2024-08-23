import 'expense.dart';

class ExpenseTracker {
  List<Expense> expenses = [];

  void addExpense(String title, String category, double amount, DateTime date) {
    Expense expense = Expense(title, amount, category, date);

    expenses.add(expense);
    print(
        'Expense added: $category, $title - \$${amount.toStringAsFixed(2)} on $date');
  }

  void viewExpense() {
    if (expenses.isEmpty) {
      print('No Expense added yet!');
      return;
    }
    print('-------Your Expenses-------');
    double total = 0;
    for (var expense in expenses) {
      print(expense);
      total += expense.amount;
    }
    print('Total Expense: \$${total.toStringAsFixed(2)}');
  }

  void deleteExpense(int index) {
    if (index >= 0 && index <= expenses.length) {
      var removeexpense = expenses.removeAt(index);
      print('Removed Expense: $removeexpense');
    }else{
      print('invalid Expense');
    }
  }
}
