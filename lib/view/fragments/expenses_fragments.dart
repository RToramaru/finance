import 'package:finance/view/store/finance_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesFragments extends StatefulWidget {
  const ExpensesFragments({super.key});

  @override
  State<ExpensesFragments> createState() => _ExpensesFragmentsState();
}

class _ExpensesFragmentsState extends State<ExpensesFragments> {
  @override
  Widget build(BuildContext context) {
    final FinanceStore financeStore = Provider.of<FinanceStore>(context);
    return const Placeholder();
  }
}