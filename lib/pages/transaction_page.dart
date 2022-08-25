import 'package:book_inn_air/cubit/transaction_cubit.dart';
import 'package:book_inn_air/pages/widgets/transaction_card.dart';
import 'package:book_inn_air/shared/styles.dart';
import 'package:flutter/gestures.dart';
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
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
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
                'Kamu Belum Memiliki Transaksi',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return TransactionCard(
                  state.transactions[index],
                );
              },
            );
          }
        } else if (state is TransactionFailed) {
          return Center(
            child: Text(
              'Data Transaksi Gagal Dimuat',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Text(
              'Transaction Page',
              style: blackTextStyle,
            ),
          ),
        );
      },
    );
  }
}
