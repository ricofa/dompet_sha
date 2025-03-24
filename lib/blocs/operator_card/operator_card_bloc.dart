import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dompet_sha/models/operator_card_model.dart';
import 'package:dompet_sha/services/operator_card_services.dart';
import 'package:equatable/equatable.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      if (event is GetOperatorCard) {
        try {
          emit(OperatorCardLoading());
          final operatorCards = await OperatorCardServices().getOperatorCards();
          emit(OperatorCardSuccess(operatorCards));
        } catch (e) {
          emit(OperatorCardFailed(e.toString()));
        }
      }
    });
  }
}
