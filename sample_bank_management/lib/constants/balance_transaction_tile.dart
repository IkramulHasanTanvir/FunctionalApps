import 'package:flutter/material.dart';

class BalanceTransactionTile extends StatelessWidget {
  const BalanceTransactionTile({
    super.key,
    required this.amount,
    required this.type,
  });

  final double amount;
  final String type;

  @override
  Widget build(BuildContext context) {
    bool isDeposit = type == 'deposit';
    return ListTile(
      leading: Icon(
        isDeposit ? Icons.arrow_downward : Icons.arrow_upward,
        color: isDeposit ? Colors.green : Colors.red,
      ),
      title: Text(
        '${type.toUpperCase()} - ${amount.toStringAsFixed(2)}',
        style: TextStyle(
          color: isDeposit ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
