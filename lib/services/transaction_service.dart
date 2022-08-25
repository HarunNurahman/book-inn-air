import 'package:book_inn_air/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final CollectionReference _transactionCollection =
      FirebaseFirestore.instance.collection('transaction');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionCollection.add({
        'destination': transaction.destination.toJson(),
        'amountOfPeople': transaction.amountOfPeople,
        'selectedSeat': transaction.selectedSeat,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await _transactionCollection.get();
      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
          e.id,
          e.data() as Map<String, dynamic>,
        );
      }).toList();

      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
