class Transaction {
  String title;
  num price;
  String description;
  bool type;
  DateTime date;

  Transaction(
      {required this.title,
      required this.price,
      required this.description,
      required this.type,
      required this.date});
}
