import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "No transactions has been added yet",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fill,
              )
            ],
          )
        : ListView(
            children: transactions.map((tx) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: FittedBox(child: Text('Rs.${tx.amount}')),
                  ),
                ),
                title: Text(
                  tx.title.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(tx.date!),
                ),
                trailing: MediaQuery.of(context).size.width > 400
                    ? TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).errorColor
                      ),
                        icon: Icon(Icons.delete),
                       
                        label: Text('Delete'),
                        onPressed: () => deleteTx(tx.id),
                      )
                    : IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(tx.id),
                      ),
              ),
            );
          }).toList());
  }
}



 /* ---------------------- OR----------------Using ListView.builder()
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx,index){
            return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rs.${transactions[index].amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.pink),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactions[index].title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat().format(transactions[index].date!),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ); ; 
          },
          
      )
    );
  }
}
*/



