import 'package:finance/controller/finance_controller.dart';
import 'package:finance/model/finance_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'finance_store.g.dart';

class FinanceStore = FinanceStoreBase with _$FinanceStore;

abstract class FinanceStoreBase with Store {
  FinanceController financeController = FinanceController();

  @observable
  int currentIndex = 1;

  @observable
  PageController pageController = PageController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  @observable
  TextEditingController amountController = TextEditingController();

  @observable
  TextEditingController dateController = TextEditingController();

  @observable
  ObservableList<FinanceModel> financeList = ObservableList<FinanceModel>.of([]);

  @observable
  ObservableList<FinanceModel> expenses = ObservableList<FinanceModel>.of([]);

   @observable
  ObservableList<FinanceModel> revenues = ObservableList<FinanceModel>.of([]);

  @observable
  int type = 0;

  @observable
  double total = 0;

  @observable
  FinanceModel financeModel = FinanceModel(
    id: const Uuid().v1(),
    description: '',
    amount: 0,
    date: '',
    type: 0,
  );

  @observable
  DateTime focusedDay = DateTime.now();

  @action
  Future getFinanceList() async {
    financeList.clear();
    financeList.addAll(await financeController.queryRowsByDates(focusedDay));
    calculateTotal();
  }

  @action
  Future insertFinance() async {
    FinanceModel financeModel = FinanceModel(
      id: const Uuid().v1(),
      description: descriptionController.text,
      amount: double.parse(amountController.text),
      date: dateController.text,
      type: type, 
    );
    await financeController.insert(financeModel.toMap());
    await getFinanceList();
    clearControllers();
  }

  @action
  Future insertFinanceFromSnackBar(FinanceModel financeModel) async {
    await financeController.insert(financeModel.toMap());
    await getFinanceList();
    clearControllers();
  }

  @action
  Future deleteFinance(String id) async {
    await financeController.delete(id);
    await getFinanceList();
  }

  @action
  void initialDate() {
    dateController.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
  }

  @action
  void changePage(int index) {
    currentIndex = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @action
  void changeDate(DateTime date) {
    dateController.text = DateFormat("dd/MM/yyyy").format(date);
  }

  @action
  void clearControllers() {
    descriptionController.clear();
    amountController.clear();
  }

  @action
  void changeType(int index) {
    type = index;
  }

  @action
  void calculateTotal() {
    total = 0;
    for (FinanceModel financeModel in financeList) {
      if (financeModel.type == 0) {
        total += financeModel.amount;
      } else {
        total -= financeModel.amount;
      }
    }
  }

  @action
  void changeFinanceModel(FinanceModel financeModel) {
    this.financeModel = financeModel;
  }

  @action
  void changeFocusedDay(DateTime focusedDay) {
    this.focusedDay = focusedDay;
    getFinanceList();
  }

  @action
  void initStore() {
    initialDate();
    getFinanceList();
  }

  @action
  void changeExpenses() {
    expenses.clear();
    for (FinanceModel financeModel in financeList) {
      if (financeModel.type == 1) {
        expenses.add(financeModel);
      }
    }
  }

  @action
  void changeRevenues() {
    revenues.clear();
    for (FinanceModel financeModel in financeList) {
      if (financeModel.type == 0) {
        revenues.add(financeModel);
      }
    }
  }

}