import 'package:calc_app/Containers.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Ui extends StatefulWidget {
   Ui({super.key});

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
  TextEditingController t1=TextEditingController();

  var uq='';

  var ua='';

  final List<String> B=[
    'C','del','%','/',
    '7','8','9','*',
    '4','5','6','-',
    '1','2','3','+',
    '.','0','ans','='
  ];

  void eq(){
    String fq=uq;
    Parser p = Parser();
    Expression exp = p.parse(fq);
  }

  bool y(String  x){
    if(x=='%'||x=='/'||x=='*'||x=='-'||x=='+'||x=='='){return true;}
    else
      {return false;}
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Column(
          children: [
            Expanded(
              flex: 1,
                child:Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Container(
                         alignment: Alignment.centerLeft,
                         padding: EdgeInsets.all(10),
                         child: Text(uq,style: TextStyle(fontSize: 20),)
                     ),
                     Container(
                       alignment: Alignment.centerRight,
                       padding: EdgeInsets.all(10),
                       child: Text(ua,style: TextStyle(fontSize: 25)),)
                    ],
                  ),
                ) ),
            Expanded(
              flex: 2,
                child:Container(child: GridView.builder(
                  itemCount: B.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder:(BuildContext context,int index){
                      if(index==0){
                        return Cont(
                          btap:(){
                            setState(() {
                              uq='';
                            });
                          },
                          color:Colors.lightGreenAccent,
                          tcolor: Colors.black,
                          txt:B[index] ,);
                      }
                      else if(index==1){
                        return Cont(
                          btap: (){
                            setState(() {
                              uq=uq.substring(0,uq.length-1);
                            });
                          },
                          color:Colors.red,
                          tcolor: Colors.white,
                          txt:B[index] ,);
                      }

                      else if(index==B.last){
                        return Cont(
                          btap: (){
                            setState(() {
                              eq();

                            });
                          },
                          color:Colors.red,
                          tcolor: Colors.white,
                          txt:B[index] ,);
                      }
                      else{
                        return Cont(
                          btap: (){
                            setState(() {
                              uq += B[index];
                            });

                          },
                          color: y(B[index])?Colors.purple:Colors.deepPurpleAccent[200],
                          tcolor: Colors.white,
                          txt:B[index] ,);
                      }
                    },
                ),) )
          ],),

      ),
    );
  }
}
