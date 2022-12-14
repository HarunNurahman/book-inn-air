import 'package:book_inn_air/cubit/transaction_cubit.dart';
import 'package:book_inn_air/pages/widgets/transaction_card.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        print('state, $state');
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return Center(
              child: Text(
                'Kamu belum melakukan transaksi',
                style: blackTextStyle,
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: 100,
              ),
              itemCount: state.transactions.length,
              itemBuilder: (context, index) => TransactionCard(
                state.transactions[index],
              ),
            );
          }
        } else if (state is TransactionFailed) {
          return Center(
            child: Text(
              'Data Gagal Dimuat',
              style: blackTextStyle,
            ),
          );
        }
        return Center(
          child: Text(
            'Transaction page',
            style: blackTextStyle,
          ),
        );
      },
    );
  }
}
