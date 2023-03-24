import 'package:finance/core/database_core.dart';
import 'package:finance/model/finance_model.dart';
import 'package:intl/intl.dart';

class FinanceController {
  DatabaseCore databaseCore = DatabaseCore.instance;

  Future<int> insert(Map<String, dynamic> row) async {
    return await databaseCore.insert(row);
  }

  Future<List<FinanceModel>> queryRowsByDates(DateTime date) async {
    DateTime startDate = DateTime(date.year, date.month, 1, 0, 0, 0);
    DateTime endDate = DateTime(date.year, date.month, 31, 23, 59, 59);
    List<Map<String, dynamic>> queryRows = await databaseCore.queryRowsByDates(
        DateFormat("dd/MM/yyyy").format(startDate),
        DateFormat("dd/MM/yyyy").format(endDate));
    List<FinanceModel> financeList = [];
    for (Map<String, dynamic> queryRow in queryRows) {
      financeList.add(FinanceModel.fromMap(queryRow));
    }
    return financeList;
  }

  Future<int> delete(String id) async {
    return await databaseCore.delete(id);
  }
}
