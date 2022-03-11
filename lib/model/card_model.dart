class CardModel {
  late String cardNumber;
  late String expiryDate;
  late String cVV2;
  late String cardName;

  CardModel({
    required this.cardNumber,

    required this.expiryDate,
    required this.cVV2,
    required this.cardName,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    cardNumber= json['cardNumber'];
    expiryDate = json['expiryDate'];
    cVV2 = json['cVV2'];
    cardName = json['cardName'];
  }

  Map<String, dynamic> toJson() => {
    'cardNumber' : cardNumber,

    'cVV2' : expiryDate,
    'cVV2' : cVV2,
    'cardName' : cardName,
  };
}