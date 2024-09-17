import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails(
      {super.key,
      required this.userImagePath,
      required this.userName,
      required this.userAccountNumber});

  final String userImagePath;
  final String userName;
  final String userAccountNumber;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade300,
      child: Column(
        children: [
          _buildDrawerHeader(),
          _buildListTile(),
        ],
      ),
    );
  }

  Widget _buildListTile() {
    return const Padding(
      padding: EdgeInsets.only(top: 44.0, left: 24),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('H O M E'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('N O T I F I C A T I O N S'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('S E T T I N G S'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('L O G O U T'),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade500,
      child: DrawerHeader(
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              height: 88,
              width: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(44),
                border: Border.all(color: Colors.white),
                image: DecorationImage(
                  image: NetworkImage(userImagePath),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: ListTile(
                title: Text(userName),
                subtitle: Text(
                  'DI: #$userAccountNumber',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
