import 'package:flutter/material.dart';
import 'package:sample_bank_management/constants/balance_button.dart';
import 'package:sample_bank_management/constants/my_dialog.dart';
import 'package:sample_bank_management/constants/user_details.dart';
import 'package:sample_bank_management/constants/my_app_bar.dart';
import 'package:sample_bank_management/models/account.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final Account account = Account(
      userName: 'Nayeem Ahmed Niloy',
      userImage:
          'https://scontent.fcla7-1.fna.fbcdn.net/v/t39.30808-1/436301436_7533314110022022_4762760743336080835_n.jpg?stp=cp6_dst-jpg_s480x480&_nc_cat=104&ccb=1-7&_nc_sid=0ecb9b&_nc_ohc=5ciTdWIru3kQ7kNvgHBidZB&_nc_ht=scontent.fcla7-1.fna&oh=00_AYBI21LluwBVLzUe9HEug8BVnUfIFIbN9pH1OFHRL9qHKQ&oe=66EF45C4',
      userAccountNumber: "121-3113-1331-3131",
      balance: 5000);
  final TextEditingController _depositTEController = TextEditingController();
  final TextEditingController _withdrawTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: UserDetails(
        userImagePath: account.userImage,
        userName: account.userName,
        userAccountNumber: account.userAccountNumber,
      ),
      body: CustomScrollView(
        slivers: [
          MyAppBar(
            currentBalance: account.balance,
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            userImagePath: account.userImage,
          ),
          SliverToBoxAdapter(
            child: BalanceButton(
              deposit: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return MyDialog(
                          controller: _depositTEController,
                          onSave: () {
                            account.balanceDeposit(
                                double.parse(_depositTEController.text));
                            setState(() {});
                            _depositTEController.clear();
                            Navigator.pop(context);
                          },
                          onCancel: () {
                            _depositTEController.clear();
                            Navigator.pop(context);
                          });
                    });
              },
              withdraw: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return MyDialog(
                          controller: _withdrawTEController,
                          onSave: () {
                            account.balanceWithdraw(
                                double.parse(_withdrawTEController.text));
                            setState(() {});
                            _withdrawTEController.clear();
                            Navigator.pop(context);
                          },
                          onCancel: () {
                            _withdrawTEController.clear();
                            Navigator.pop(context);
                          });
                    });
              },
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    _withdrawTEController.dispose();
    _depositTEController.dispose();
    super.dispose();
  }
}
