import 'package:book_inn_air/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionCollection =
      FirebaseFirestore.instance.collection('transaction');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionCollection.add({
        'destination': transaction.destination.toJson(),
        'amountOfPeople': transaction.amountOfPeople,
        'selectedSeat': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }
}
