class Expense {
  String title;
  DateTime date;
  double amount;
  String category;

  Expense(this.title, this.amount, this.category, this.date);

  @override
  String toString() {
    return '$title: \$${amount.toStringAsFixed(2)} on ${date.toLocal()}';
  }
}
