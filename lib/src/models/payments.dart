class Payment {
  final String amount;
  final String paid;
  final String balance;

  Payment({this.amount, this.paid, this.balance});
}

class PaymentsList {
  final List<Payment> paymentsList = [
    Payment(amount: "N7,340", paid: "N1,340", balance: "N5,340"),
  ];
}
