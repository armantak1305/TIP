import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var billAmtController= TextEditingController();

    int perCount = 1;
    int tipPercent = 0;
    num totalBill = 0.0;
    num totalTip = 0.0;
    num total = 0.0;
    num perPerson = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5F3F4),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("asset/images/sheriff.png",width: 60,height: 80,),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                            TextSpan(text:"Mr",
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        children: [
                           TextSpan(text: "TIP",
                               style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
                        ])),
                        Text("Calculator",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ), ),
            Expanded(
              flex: 6,
                child: Card(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Total p/person",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          Text.rich(
                              TextSpan(text:"\$",
                                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(text: "${perPerson==0.0 ? "000": perPerson.toStringAsFixed(2)}",
                                        style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold))
                                  ])),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("Total bill",style:TextStyle(fontSize: 18,)),
                                  Text.rich(
                                      TextSpan(text:"\$",
                                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF03C9BD)),
                                          children: [
                                            TextSpan(text: "${totalBill==0.0 ? "000": totalBill.toStringAsFixed(2)}",
                                                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,))
                                          ])),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Total TIP",style:TextStyle(fontSize: 18,)),
                                  Text.rich(
                                      TextSpan(text:"\$",
                                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF03C9BD)),
                                          children: [
                                            TextSpan(text: "${totalTip==0.0 ? "000": totalTip.toStringAsFixed(2)}",
                                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,))])),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25 )
                  ),
                )
            ),
            Expanded(
              flex: 3,
                child: Row(
                  children: [
                    Expanded(child:  Text.rich(
                        TextSpan(text:"Enter\n",
                            style: TextStyle(fontSize: 21,fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(text: "Your bill",
                                  style: TextStyle(fontSize: 21,fontWeight: FontWeight.w400,))
                            ])),),
                    Expanded(
                        flex : 3,
                        child:TextField(
                          controller:  billAmtController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixText: "\$",
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                style: BorderStyle.none,
                                color: Colors.white,
                                width: 1,
                              )
                            )
                          ),
                        ) )
                  ],
                )),
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(child:  Text.rich(
                        TextSpan(text:"Choose\n",
                            style: TextStyle(fontSize: 21,fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(text: "Your tip",
                                  style: TextStyle(fontSize: 21,fontWeight: FontWeight.w400,))
                            ])),),
                    Expanded(flex: 3,
                        child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Row(
                              children: [
                                Expanded(child:  InkWell(
                                  onTap: (){
                                    tipPercent = 10;
                                    updateTheResult();
                                  },
                                  child: Container(
                                    width: double.infinity,height:100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),color: Color(0xFF03C9BD),
                                    ),
                                    child:  Center(
                                      child: Text.rich(
                                          TextSpan(text:"10",
                                              style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(text: "%",
                                                    style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w400))
                                              ])),
                                    ),
                                  ),
                                ),),
                                SizedBox(width: 10,),
                                Expanded(child:  InkWell(
                                  onTap: (){
                                    tipPercent = 15;
                                    updateTheResult();
                                  },
                                  child: Container(
                                    width: double.infinity,height:100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),color: Color(0xFF03C9BD),
                                    ),
                                    child:  Center(
                                      child: Text.rich(
                                          TextSpan(text:"15",
                                              style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(text: "%",
                                                    style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w400))
                                              ])),
                                    ),
                                  ),
                                ),),
                                SizedBox(width: 10,),
                                Expanded(child:  InkWell(
                                  onTap: (){
                                    tipPercent = 20;
                                    updateTheResult();
                                  },
                                  child: Container(
                                    width: double.infinity,height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),color: Color(0xFF03C9BD),
                                    ),
                                    child:  Center(
                                      child: Text.rich(
                                          TextSpan(text:"20",
                                              style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(text: "%",
                                                    style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w400))
                                              ])),
                                    ),
                                  ),
                                ),),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),color: Color(0xFF03C9BD),
                              ),
                              child: Center(child: Text("Custom tip",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w900,color: Colors.white),)),
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                )),
            Expanded(
              flex: 2,
                child:  Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Row(
                    children: [
                      Expanded(child:  Text.rich(
                          TextSpan(text:"Split\n",
                              style: TextStyle(fontSize: 21,fontWeight: FontWeight.w900),
                              children: [
                                TextSpan(text: "the total",
                                    style: TextStyle(fontSize: 21,fontWeight: FontWeight.w400,))
                              ])),),
                             Expanded(flex: 3,
                                 child: Row(
                                   children: [
                                     Expanded(
                                         child: InkWell(
                                           onTap: (){
                                             if(perCount>1){
                                              perCount--;
                                           updateTheResult();
                                             }
                                           },
                                           child: Container(
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),color: Color(0xFF03C9BD),
                                             ),
                                             child: Center(
                                               child: Text("-",style: TextStyle(color:Colors.white,fontSize: 35,fontWeight: FontWeight.w900),),
                                             ),
                                           ),
                                         )),
                                     Expanded(
                                       flex: 2,
                                         child: Container(
                                           child: Center(
                                             child: Text("$perCount",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900),),
                                           ),
                                         )),
                                     Expanded(
                                         child: InkWell(
                                           onTap: (){
                                             perCount++;
                                            updateTheResult();
                                           },
                                           child: Container(
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),color: Color(0xFF03C9BD),
                                             ),
                                             child: Center(
                                               child: Text("+",style: TextStyle(color:Colors.white,fontSize: 35,fontWeight: FontWeight.w900),),
                                             ),
                                           ),
                                         )),
                                   ],
                                 ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
  /// Calculating Tip Result
  void updateTheResult(){
     if(billAmtController.text!=""){
       totalBill = double.parse(billAmtController.text.toString());
       totalTip = totalBill*(tipPercent/100);
       total = totalBill + totalTip;
       perPerson = total/perCount;
       setState(() {});
     }
      else{
        perCount = 1;
     }

  }
}
