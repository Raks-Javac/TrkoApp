import 'package:flutter/material.dart';
import 'package:trko/src/models/payments.dart';

class Payments extends StatelessWidget {
  const Payments({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PaymentTile(
            payment: PaymentsList().paymentsList[0],
          )
        ],
      ),
    );
  }
}

class PaymentTile extends StatelessWidget {
  final Payment payment;
  const PaymentTile({this.payment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Amount - ${payment.amount},000",
            style: TextStyle(fontSize: 17.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Paid - ${payment.paid},000",
            style: TextStyle(fontSize: 17.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Balance - ${payment.balance},000",
            style: TextStyle(fontSize: 17.0),
          ),
        ],
      ),
    );
  }
}
