import 'package:exam_6/model/card_model.dart';
import 'package:exam_6/services/card_service.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const String id = "detail_page";
  final CardModel? cardModel;

  const DetailPage({Key? key, this.cardModel}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cVV2NumberController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();

  Future<void> _storeCard() async {
    if (widget.cardModel == null) {
      String cardNumber = cardNumberController.text.trim().toString();
      String expiryDate = expiryDateController.text.trim().toString();
      String cVV2Number = cVV2NumberController.text.trim().toString();
      String cardName = cardNameController.text.trim().toString();
      if (cardNumber.isNotEmpty ||
          expiryDate.isNotEmpty ||
          cVV2Number.isNotEmpty ||
          cardName.isNotEmpty) {
        CardModel card = CardModel(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cVV2: cVV2Number,
            cardName: cardName);
        List<CardModel> cardList = DBService.loadCard();
        cardList.add(card);
        await DBService.storecard(cardList);
      }
    }
    Navigator.pop(context, true);
  }

  void loadNote(CardModel? card) {
    if (card != null) {
      setState(() {
        cardNumberController.text = card.cardNumber;
        expiryDateController.text = card.expiryDate;
        cVV2NumberController.text = card.cVV2;
        cardNameController.text = card.cardName;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadNote(widget.cardModel);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{ _storeCard();
          return false;},
        child:   Scaffold(
      backgroundColor: Colors.blueAccent.shade700,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent.shade700,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add your card",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.cancel_outlined,
                size: 30,
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Feel in the fields bellow or case camera ",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Your card number",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: cardNumberController,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expiry date",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: expiryDateController,
                      ),
                      height: 50,
                      width: 165,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CVV2",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: cVV2NumberController,
                      ),
                      height: 50,
                      width: 165,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Card name",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: cardNumberController,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 250,
            ),
            Container(
              alignment: Alignment.center,
              child: MaterialButton(
                onPressed: () {_storeCard();},
                height: 50,
                minWidth: 200,
                shape: StadiumBorder(),
                color: Colors.white,
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.blueAccent.shade700, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
