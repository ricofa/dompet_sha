part of 'transfer_bloc.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TransferPost extends TransferEvent{
  final TransferFormModel transferFormModel;

  const TransferPost(this.transferFormModel);
  @override
  // TODO: implement props
  List<Object?> get props => [transferFormModel];
}