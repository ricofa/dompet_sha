import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dompet_sha/models/topup_form_model.dart';
import 'package:dompet_sha/services/transaction_services.dart';
import 'package:equatable/equatable.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitial()) {
    on<TopupEvent>((event, emit) async {
      if (event is TopupPost) {
        try {
          emit(TopupLoading());
          final redirectUrl = await TransactionServices().topUp(event.data);
          emit(TopupSuccess(redirectUrl));
        } catch (e) {
          emit(TopupFailed(e.toString()));
        }
      }
    });
  }
}
