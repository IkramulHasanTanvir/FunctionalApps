class Account {
  final String userName;
  final String userImage;
  final String userAccountNumber;
  double balance;

  Account(
      {required this.userName,
      required this.userImage,
      required this.userAccountNumber,
      required this.balance});

  void balanceDeposit(double newBalance) {
    if (newBalance > 0) {
      balance = balance + newBalance;
    }
  }

  void balanceWithdraw(double newBalance) {
    if (newBalance >= 0 && newBalance > 0) {
      balance = balance - newBalance;
    }
  }
}

/*
account.balanceWithdraw(
double.parse(_withdrawTEController.text));
_balanceList.add(_withdrawTEController.text);
setState(() {});
_withdrawTEController.clear();
Navigator.pop(context);
},
onCancel: () {
_withdrawTEController.clear();
Navigator.pop(context);
});
*/



