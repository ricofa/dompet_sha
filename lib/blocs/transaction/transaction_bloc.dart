import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dompet_sha/models/transaction_model.dart';
import 'package:dompet_sha/services/transaction_services.dart';
import 'package:equatable/equatable.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransactionGet) {
        try {
          emit(TransactionLoading());
          final transactions =
              await TransactionServices().getLatestTransaction();
          emit(TransactionSuccess(transactions));
        } catch (e) {
          emit(TransactionFailed(e.toString()));
        }
      }
    });
  }
}
