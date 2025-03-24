import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dompet_sha/models/data_plan_form_model.dart';
import 'package:dompet_sha/services/transaction_services.dart';
import 'package:equatable/equatable.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanEvent>((event, emit) async {
      if (event is DataPlanPost) {
        try {
          emit(DataPlanLoading());
          await TransactionServices().dataPlan(event.data);
          emit(DataPlanSuccess());
        } catch (e) {
          emit(DataPlanFailed(e.toString()));
        }
      }
    });
  }
}
