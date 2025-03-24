part of 'operator_card_bloc.dart';

abstract class OperatorCardEvent extends Equatable {
  const OperatorCardEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetOperatorCard extends OperatorCardEvent{}
