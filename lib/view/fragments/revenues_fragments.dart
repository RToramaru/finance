import 'package:finance/view/store/finance_store.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class RevenuesFragments extends StatefulWidget {
  const RevenuesFragments({super.key});

  @override
  State<RevenuesFragments> createState() => _RevenuesFragmentsState();
}

class _RevenuesFragmentsState extends State<RevenuesFragments> {
  @override
  Widget build(BuildContext context) {
    final FinanceStore financeStore = Provider.of<FinanceStore>(context);
    return const Placeholder();
  }
}