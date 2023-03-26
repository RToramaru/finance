import 'package:finance/view/store/finance_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:finance/view/widget/custom_date_text_formatter.dart';

class HomeFragments extends StatefulWidget {
  const HomeFragments({super.key});

  @override
  State<HomeFragments> createState() => _HomeFragmentsState();
}

class _HomeFragmentsState extends State<HomeFragments> {
  @override
  Widget build(BuildContext context) {
    final FinanceStore financeStore = Provider.of<FinanceStore>(context);
    return Column(children: [
      Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            color: Colors.blue,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.07,
            child: Text(
              "Finanças",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.075),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.16,
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Total",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Observer(builder: (_) {
                            return Text(
                              "R\$ ${financeStore.total.toStringAsFixed(2).replaceAll('.', ',')}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.04),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                              ),
                              builder: (_) {
                                return Container(
                                  height: 450,
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Center(
                                        child: Text(
                                          "Adicionar Transação",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Descrição",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Observer(builder: (_) {
                                          return TextField(
                                            controller: financeStore
                                                .descriptionController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "Descrição",
                                            ),
                                          );
                                        }),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Valor",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Observer(builder: (_) {
                                          return TextField(
                                            controller:
                                                financeStore.amountController,
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "Valor",
                                            ),
                                          );
                                        }),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Data",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Observer(builder: (_) {
                                          return TextField(
                                            controller:
                                                financeStore.dateController,
                                            inputFormatters: [
                                              CustomDateTextFormatter()
                                            ],
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                icon: const Icon(
                                                  Icons.calendar_today,
                                                  color: Colors.blue,
                                                ),
                                                onPressed: () {
                                                  showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2015),
                                                    lastDate: DateTime(2035),
                                                  ).then((value) => financeStore
                                                      .changeDate(value ??
                                                          DateTime.now()));
                                                },
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "Data",
                                            ),
                                          );
                                        }),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Tipo",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Observer(builder: (_) {
                                              return DropdownButton(
                                                value: financeStore.type,
                                                isExpanded: true,
                                                itemHeight: 55,
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: 0,
                                                    child: Text("Receita"),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 1,
                                                    child: Text("Despesa"),
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                underline: Container(),
                                                onChanged: (value) {
                                                  financeStore
                                                      .changeType(value!);
                                                },
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 55,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              financeStore.insertFinance();
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor: Colors.blue,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                            ),
                                            child: const Text(
                                              "Adicionar",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 7,
                                    offset: Offset(2, 2),
                                  )
                                ]),
                            child: Icon(
                              Icons.add,
                              size: MediaQuery.of(context).size.width * 0.07,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: financeStore.focusedDay,
        locale: "pt_BR",
        headerStyle: const HeaderStyle(
            formatButtonShowsNext: false,
            formatButtonVisible: false,
            titleCentered: true),
        calendarStyle: const CalendarStyle(outsideDaysVisible: false),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.transparent),
          weekendStyle: TextStyle(color: Colors.transparent),
        ),
        rowHeight: 0,
        onPageChanged: (value) {
          financeStore.changeFocusedDay(value);
        },
      ),
      Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Movimentações",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
              Icon(
                Icons.sort,
                size: MediaQuery.of(context).size.width * 0.07,
                color: Colors.grey[400],
              ),
            ],
          )),
      const SizedBox(height: 20),
      Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.47,
            child: Observer(builder: (_) {
              return ListView.builder(
                itemCount: financeStore.financeList.length,
                itemBuilder: ((context, index) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      financeStore
                          .changeFinanceModel(financeStore.financeList[index]);
                      financeStore
                          .deleteFinance(financeStore.financeList[index].id);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Container(
                          alignment: Alignment.bottomLeft,
                          child: const Text(
                            "Desfazer Ação",
                          ),
                        ),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: "Desfazer",
                          onPressed: () {
                            financeStore.insertFinanceFromSnackBar(
                                financeStore.financeModel);
                          },
                        ),
                      ));
                    },
                    key: UniqueKey(),
                    background: Container(
                      alignment: Alignment.topRight,
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete_outlined,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),
                      ),
                    ),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              financeStore.financeList[index].description,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                            Text(
                              "${financeStore.financeList[index].type == 0 ? '+' : '-'} R\$ ${financeStore.financeList[index].amount}",
                              style: TextStyle(
                                  color:
                                      financeStore.financeList[index].type == 0
                                          ? Colors.green
                                          : Colors.red,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                          ],
                        )),
                  );
                }),
              );
            }),
          ))
    ]);
  }
}
