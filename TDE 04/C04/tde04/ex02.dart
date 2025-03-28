class Account{
  final int accountNumber;
  final double balance;

  const Account({required this.accountNumber, required this.balance});

}

void main(){
  Account c1 = Account(accountNumber: 22, balance: 2000);
  print("Account: ${c1.accountNumber} Balance: ${c1.balance}");
}