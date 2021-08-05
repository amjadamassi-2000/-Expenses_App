import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> _allTransactions;
  final Function _deleteTransaction;

  TransactionList(this._allTransactions, this._deleteTransaction);



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return _allTransactions.isEmpty
          // No Transactions
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" No Items Added Yet ! "),
              ],
            )
          // Transactions Present
          : ListView.builder(
              itemCount: _allTransactions.length,
              itemBuilder: (context, index) {
                Transaction txn = _allTransactions[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 15.0,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: Container(
                          width: 70.0,
                          height: 70.0,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF44D7B6),
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              '\$${txn.txnAmount}',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          txn.txnTitle,
                          style: TextStyle(
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat('MMMM d, y -')
                              .add_jm()
                              .format(txn.txnDateTime),
                          // DateFormat.yMMMMd().format(txn.txnDateTime),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          color: Theme.of(context).errorColor,
                          onPressed: () => _deleteTransaction(txn.txnId),
                          tooltip: "Delete Transaction",
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}
