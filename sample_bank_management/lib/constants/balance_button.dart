import 'package:flutter/material.dart';
import 'package:sample_bank_management/widgets/neumorphism_box.dart';

class BalanceButton extends StatelessWidget {
  const BalanceButton({
    super.key,
    required this.balanceDeposit,
    required this.balanceWithdraw,
  });

  final VoidCallback balanceDeposit;
  final VoidCallback balanceWithdraw;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 34,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: balanceDeposit,
            child: NeumorphismBox(
              child: Text(
                'D E P O S I T',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: balanceWithdraw,
            child: NeumorphismBox(
              child: Text(
                'W I T H D R A W',
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
