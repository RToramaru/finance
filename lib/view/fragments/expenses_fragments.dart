import 'package:finance/view/store/finance_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    financeStore.changeExpenses();
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.red[300],
      child: Column(children: [
        Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Despesas",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)))),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Observer(
            builder: (_) {
              return ListView.builder(
                itemCount: financeStore.expenses.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    color: Colors.red[900],
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                                width: 2,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(financeStore.expenses[index].description,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(financeStore.expenses[index].date, style: const TextStyle(fontSize: 15, color: Colors.white)),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Text("- R\$ ${financeStore.expenses[index].amount.toStringAsFixed(2).replaceAll('.', ',')}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  );
                },
              );
            }
          ),
        )
      ]),
    );
  }
}
