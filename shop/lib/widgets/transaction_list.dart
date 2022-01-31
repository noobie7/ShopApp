import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;
  TransactionList({required this.userTransactions, required this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, con) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
                SizedBox(
                  height: con.maxHeight * 0.10,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: con.maxHeight * 0.5,
                  child: Image.asset(
                    'assets/images/cat.jpg',
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          '\$${userTransactions[index].cost}',
                          style: const TextStyle(
                            fontFamily: 'Righteous',
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    userTransactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(userTransactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? OutlinedButton(
                          onPressed: () => deleteTx(userTransactions[index].id),
                          child: const Text('Delete'),
                        )
                      : IconButton(
                          onPressed: () => deleteTx(userTransactions[index].id),
                          icon: const Icon(Icons.delete_rounded)),
                ),
              );
            },
            itemCount: userTransactions.length,
          );
  }
}
