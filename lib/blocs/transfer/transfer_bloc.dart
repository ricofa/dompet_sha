import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dompet_sha/models/transfer_form_model.dart';
import 'package:dompet_sha/services/transaction_services.dart';
import 'package:equatable/equatable.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) async {
      if(event is TransferPost){
        try{
          emit(TransferLoading());
          await TransactionServices().transfer(event.transferFormModel);
          emit(TransferSuccess());
        } catch (e){
          emit(TransferFailed(e.toString()));
        }
      }
    });
  }
}
