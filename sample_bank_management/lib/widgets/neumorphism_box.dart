import 'package:flutter/material.dart';

class NeumorphismBox extends StatelessWidget {
  const NeumorphismBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4, 4), // this value bottom right
              blurRadius: 16,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4), // this - value top left
              blurRadius: 16,
            ),
          ]),
      child: child,
    );
  }
}
