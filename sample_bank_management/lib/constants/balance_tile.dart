import 'package:flutter/material.dart';

class BalanceTile extends StatelessWidget {
  const BalanceTile(
      {super.key,
        required this.balanceDeposit,
        required this.balanceWithdraw,
      });

  final String balanceDeposit;
  final String balanceWithdraw;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(balanceDeposit,style: const TextStyle(color: Colors.green),),
      trailing: Text(balanceWithdraw,style: const TextStyle(color: Colors.red),),
    );
  }
}
