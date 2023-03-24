import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:finance/view/fragments/expenses_fragments.dart';
import 'package:finance/view/fragments/home_fragments.dart';
import 'package:finance/view/fragments/revenues_fragments.dart';
import 'package:finance/view/store/finance_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pages = [
    const RevenuesFragments(),
    const HomeFragments(),
    const ExpensesFragments()
  ];
  @override
  Widget build(BuildContext context) {
    final FinanceStore financeStore = Provider.of<FinanceStore>(context);
    financeStore.initStore();
    return Scaffold(
      body: Observer(builder: (_) {
        return SafeArea(
            child: PageView(
          controller: financeStore.pageController,
          children: [
            SingleChildScrollView(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                child: pages[financeStore.currentIndex]),
          ],
        ));
      }),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.center,
          selectedIndex: financeStore.currentIndex,
          showElevation: true,
          onItemSelected: (index) => financeStore.changePage(index),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.add_circle_outline),
              title: const Text('Receitas'),
              activeColor: Colors.green,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: Colors.blue,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.remove_circle_outline),
              title: const Text('Despesas'),
              activeColor: Colors.red,
            ),
          ],
        );
      }),
    );
  }
}
