import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date == weekDay.day &&
            recentTransactions[i].date == weekDay.month &&
            recentTransactions[i].date == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E(index), 'Amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Column()],
      ),
    );
  }
}
