import 'package:exam_6/model/card_model.dart';
import 'package:exam_6/pages/detail_page.dart';
import 'package:exam_6/services/card_service.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CardModel> _listCard = [];

  @override
  void initState() {
    // TODO: implement initState
loadCardList();
  }

  void loadCardList(){
    setState(() {
      _listCard = DBService.loadCard();
    });
  }

  void openDetailPage()async{
    var result = await Navigator.pushNamed(context, DetailPage.id);
    if(result !=null && result ==true){
      loadCardList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Good day,",style: TextStyle(color: Colors.black,fontSize: 24),),
                  Text("Izzatulloh",style: TextStyle(color: Colors.black,fontSize: 20),),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(padding: EdgeInsets.all(30,),
        child: GestureDetector(
          onTap: (){Navigator.of(context).pushNamed(DetailPage.id);},
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10)

            ),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add,size: 35,),
                Text("Add new card",style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),
      ),

    );
  }
}
