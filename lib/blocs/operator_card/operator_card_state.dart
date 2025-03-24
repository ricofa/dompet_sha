part of 'operator_card_bloc.dart';

abstract class OperatorCardState extends Equatable {
  const OperatorCardState();
  @override
  List<Object> get props => [];
}

class OperatorCardInitial extends OperatorCardState {}
class OperatorCardLoading extends OperatorCardState {}
class OperatorCardFailed extends OperatorCardState {
  final String e;

  const OperatorCardFailed(this.e);

  @override
  // TODO: implement props
  List<Object> get props => [e];
}
class OperatorCardSuccess extends OperatorCardState {
  final List<OperatorCardModel> operatorCard;

  const OperatorCardSuccess(this.operatorCard);

  @override
  // TODO: implement props
  List<Object> get props => [operatorCard];
}
