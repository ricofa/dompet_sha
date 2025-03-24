part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TransactionGet extends TransactionEvent{}
