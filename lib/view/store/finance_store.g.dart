// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FinanceStore on FinanceStoreBase, Store {
  late final _$currentIndexAtom =
      Atom(name: 'FinanceStoreBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$pageControllerAtom =
      Atom(name: 'FinanceStoreBase.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$descriptionControllerAtom =
      Atom(name: 'FinanceStoreBase.descriptionController', context: context);

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  late final _$amountControllerAtom =
      Atom(name: 'FinanceStoreBase.amountController', context: context);

  @override
  TextEditingController get amountController {
    _$amountControllerAtom.reportRead();
    return super.amountController;
  }

  @override
  set amountController(TextEditingController value) {
    _$amountControllerAtom.reportWrite(value, super.amountController, () {
      super.amountController = value;
    });
  }

  late final _$dateControllerAtom =
      Atom(name: 'FinanceStoreBase.dateController', context: context);

  @override
  TextEditingController get dateController {
    _$dateControllerAtom.reportRead();
    return super.dateController;
  }

  @override
  set dateController(TextEditingController value) {
    _$dateControllerAtom.reportWrite(value, super.dateController, () {
      super.dateController = value;
    });
  }

  late final _$financeListAtom =
      Atom(name: 'FinanceStoreBase.financeList', context: context);

  @override
  ObservableList<FinanceModel> get financeList {
    _$financeListAtom.reportRead();
    return super.financeList;
  }

  @override
  set financeList(ObservableList<FinanceModel> value) {
    _$financeListAtom.reportWrite(value, super.financeList, () {
      super.financeList = value;
    });
  }

  late final _$expensesAtom =
      Atom(name: 'FinanceStoreBase.expenses', context: context);

  @override
  ObservableList<FinanceModel> get expenses {
    _$expensesAtom.reportRead();
    return super.expenses;
  }

  @override
  set expenses(ObservableList<FinanceModel> value) {
    _$expensesAtom.reportWrite(value, super.expenses, () {
      super.expenses = value;
    });
  }

  late final _$revenuesAtom =
      Atom(name: 'FinanceStoreBase.revenues', context: context);

  @override
  ObservableList<FinanceModel> get revenues {
    _$revenuesAtom.reportRead();
    return super.revenues;
  }

  @override
  set revenues(ObservableList<FinanceModel> value) {
    _$revenuesAtom.reportWrite(value, super.revenues, () {
      super.revenues = value;
    });
  }

  late final _$typeAtom = Atom(name: 'FinanceStoreBase.type', context: context);

  @override
  int get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(int value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$totalAtom =
      Atom(name: 'FinanceStoreBase.total', context: context);

  @override
  double get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$financeModelAtom =
      Atom(name: 'FinanceStoreBase.financeModel', context: context);

  @override
  FinanceModel get financeModel {
    _$financeModelAtom.reportRead();
    return super.financeModel;
  }

  @override
  set financeModel(FinanceModel value) {
    _$financeModelAtom.reportWrite(value, super.financeModel, () {
      super.financeModel = value;
    });
  }

  late final _$focusedDayAtom =
      Atom(name: 'FinanceStoreBase.focusedDay', context: context);

  @override
  DateTime get focusedDay {
    _$focusedDayAtom.reportRead();
    return super.focusedDay;
  }

  @override
  set focusedDay(DateTime value) {
    _$focusedDayAtom.reportWrite(value, super.focusedDay, () {
      super.focusedDay = value;
    });
  }

  late final _$getFinanceListAsyncAction =
      AsyncAction('FinanceStoreBase.getFinanceList', context: context);

  @override
  Future<dynamic> getFinanceList() {
    return _$getFinanceListAsyncAction.run(() => super.getFinanceList());
  }

  late final _$insertFinanceAsyncAction =
      AsyncAction('FinanceStoreBase.insertFinance', context: context);

  @override
  Future<dynamic> insertFinance() {
    return _$insertFinanceAsyncAction.run(() => super.insertFinance());
  }

  late final _$insertFinanceFromSnackBarAsyncAction = AsyncAction(
      'FinanceStoreBase.insertFinanceFromSnackBar',
      context: context);

  @override
  Future<dynamic> insertFinanceFromSnackBar(FinanceModel financeModel) {
    return _$insertFinanceFromSnackBarAsyncAction
        .run(() => super.insertFinanceFromSnackBar(financeModel));
  }

  late final _$deleteFinanceAsyncAction =
      AsyncAction('FinanceStoreBase.deleteFinance', context: context);

  @override
  Future<dynamic> deleteFinance(String id) {
    return _$deleteFinanceAsyncAction.run(() => super.deleteFinance(id));
  }

  late final _$FinanceStoreBaseActionController =
      ActionController(name: 'FinanceStoreBase', context: context);

  @override
  void initialDate() {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.initialDate');
    try {
      return super.initialDate();
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePage(int index) {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDate(DateTime date) {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.changeDate');
    try {
      return super.changeDate(date);
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearControllers() {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.clearControllers');
    try {
      return super.clearControllers();
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeType(int index) {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.changeType');
    try {
      return super.changeType(index);
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotal() {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.calculateTotal');
    try {
      return super.calculateTotal();
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFinanceModel(FinanceModel financeModel) {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.changeFinanceModel');
    try {
      return super.changeFinanceModel(financeModel);
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFocusedDay(DateTime focusedDay) {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.changeFocusedDay');
    try {
      return super.changeFocusedDay(focusedDay);
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initStore() {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.initStore');
    try {
      return super.initStore();
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeExpenses() {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.changeExpenses');
    try {
      return super.changeExpenses();
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRevenues() {
    final _$actionInfo = _$FinanceStoreBaseActionController.startAction(
        name: 'FinanceStoreBase.changeRevenues');
    try {
      return super.changeRevenues();
    } finally {
      _$FinanceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
pageController: ${pageController},
descriptionController: ${descriptionController},
amountController: ${amountController},
dateController: ${dateController},
financeList: ${financeList},
expenses: ${expenses},
revenues: ${revenues},
type: ${type},
total: ${total},
financeModel: ${financeModel},
focusedDay: ${focusedDay}
    ''';
  }
}
