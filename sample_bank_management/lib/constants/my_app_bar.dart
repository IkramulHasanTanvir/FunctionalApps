import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.currentBalance,
    required this.onTap,
    required this.userImagePath,
  });

  final double currentBalance;
  final VoidCallback onTap;
  final String userImagePath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: _buildLeading(),
      backgroundColor: Colors.grey.shade300,
      expandedHeight: 200,
      pinned: true,
      //floating: true,
      flexibleSpace: _buildFlexibleSpaceBar(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_active_outlined),
        ),
      ],
    );
  }

  Widget _buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 88.0,
            ),
            child: Text(
              'O S T A D\nBank.ltd',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Balance: ',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            '$currentBalance\$',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(44),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(44),
          child: Image.network(
            userImagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
