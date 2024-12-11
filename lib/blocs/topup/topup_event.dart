part of 'topup_bloc.dart';

abstract class TopupEvent extends Equatable {
  const TopupEvent();
  @override
  List<Object?> get props => [];

}

class TopupPost extends TopupEvent{
  final TopupFormModel data;

  TopupPost(this.data);

  @override
  List<Object?> get props => [data];

}
