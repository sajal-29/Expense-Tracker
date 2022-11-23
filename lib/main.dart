// ignore_for_file: sort_child_properties_last, use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
          primarySwatch: Colors.amber,
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 23,
                  fontWeight: FontWeight.bold))),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  // String? titleInput;
  // String? amountInput;

  final List<transaction> _userTransaction = [
    // transaction(id: "t1", title: "shoes", amount: 3500, date: DateTime.now()),
    // transaction(id: "t2", title: "watch", amount: 3000, date: DateTime.now()),
  ];
  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Flutter App'),
      //   backgroundColor: Colors.transparent,
      // ),
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: Colors.black38,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: [
          TextButton(
            onPressed: () {},
            child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: (() => _startAddNewTransaction(context))),
          ),
        ],
        title: Text(
          "Expenses",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: double.infinity,
                height: 50,
                child: Card(
                  child: Text(
                    'CHART!',
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.white,
                  elevation: 65,
                ),
              ),
              TransactionList(_userTransaction),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
