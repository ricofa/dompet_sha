class TransferFormModel {
  final String? amount;
  final String? pin;
  final String? sendTo;

  TransferFormModel({this.amount, this.pin, this.sendTo});

  TransferFormModel copyWith(
          {String? amount, String? pin, String? paymentMethodCode}) =>
      TransferFormModel(
          amount: amount ?? this.amount,
          pin: pin ?? this.pin,
          sendTo: sendTo ?? this.sendTo);

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'send_to': sendTo,
      };
}
