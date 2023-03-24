class FinanceModel {
  String id;
  String description;
  double amount;
  String date;
  int type;

  FinanceModel(
      {required this.id,
      required this.description,
      required this.amount,
      required this.date,
      required this.type});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'date': date,
      'type': type,
    };
  }

  factory FinanceModel.fromMap(Map<String, dynamic> map) {
    return FinanceModel(
      id: map['id'],
      description: map['description'],
      amount: map['amount'],
      date: map['date'],
      type: map['type'],
    );
  }
}
