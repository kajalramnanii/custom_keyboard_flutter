import 'package:custom_keyboard/keyboardModel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Keyboard  Demo',
      home: KeyBoardScreen(),
    );
  }
}



class KeyBoardScreen extends StatefulWidget {
  const KeyBoardScreen({super.key});

  @override
  State<KeyBoardScreen> createState() => _KeyBoardScreenState();
}

class _KeyBoardScreenState extends State<KeyBoardScreen> {
  String test = "";

  List<List<KeyBoardModel>>  tempList = [
    [KeyBoardModel(text: "Q",),KeyBoardModel(text: "W"),KeyBoardModel(text: "E"),KeyBoardModel(text: "R",),KeyBoardModel(text: "T"),KeyBoardModel(text: "Y"),KeyBoardModel(text: "U",),KeyBoardModel(text: "I"),KeyBoardModel(text: "O"),KeyBoardModel(text: "P")],
    [KeyBoardModel(text: "A",),KeyBoardModel(text: "S"),KeyBoardModel(text: "D"),KeyBoardModel(text: "F",),KeyBoardModel(text: "G"),KeyBoardModel(text: "H"),KeyBoardModel(text: "J",),KeyBoardModel(text: "K"),KeyBoardModel(text: "L")],
    [KeyBoardModel(text: "delete",icon: const Padding(
      padding: EdgeInsets.only(right: 6),
      child: Icon(Icons.backspace_outlined,color: Color(0xff0D1A54),),
    )),KeyBoardModel(text: "Z"),KeyBoardModel(text: "X"),KeyBoardModel(text: "C"),KeyBoardModel(text: "V"),KeyBoardModel(text: "B"),KeyBoardModel(text: "N"),KeyBoardModel(text: "M"),KeyBoardModel(text: "enter",icon: const Padding(
      padding: EdgeInsets.only(left: 6),
      child: Icon(Icons.arrow_circle_right_outlined,color: Color(0xff0D1A54)),
    )),],

  ];

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(test,style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
            const SizedBox(height: 300,),
            for(int i = 0; i < tempList.length ; i ++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int row_i = 0 ; row_i < tempList[i].length ; row_i ++)
                  tempList[i][row_i].icon == null ? InkWell(
                  onTap: (){
                    // print("clicked : ${tempList[i][row_i]}");
                    setState(() {
                        test += tempList[i][row_i].text;
                    });
                  },
                  child:  Container(
                    padding: const EdgeInsets.all(4),
                    height: 36,
                    width: 30,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xffEAF2FF),
                      borderRadius: BorderRadius.circular(5.0),
                    ),

                    child:Center(child: Text(tempList[i][row_i].text,style: const TextStyle(color: Color(0xff0D1A54),fontSize: 20,)) ,
                  ),)
                ) : InkWell(
                    onTap: (){
                      setState(() {

                        if (tempList[i][row_i].text == "delete" ){
                          if (test.isEmpty) {
                            return;
                          }
                          test =  test.substring(0,test.length - 1);
                        }else if (tempList[i][row_i].text == "enter"){
                          // add code here

                        }
                      });
                    },
                      child: tempList[i][row_i].icon!),
              ],
            )
          ],
        ),
      ),
    );
  }
}

