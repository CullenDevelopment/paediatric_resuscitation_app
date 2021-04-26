import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashResus(),// shows front splash for  seconds
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashResus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.red,
      seconds: 5,
      navigateAfterSeconds: HomePage(),
      title: Text("Paediatric Resuscitation Calculations", style:
      TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      ),
      image: Image.asset("assets/paed.jpg"),
      photoSize: 200,
      loadingText: Text("Loading...", style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      ),
    loaderColor: Colors.blueAccent,
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _age = new TextEditingController();


double weight = 0;
double uncuffedTube = 0;
double cuffedTube = 0;
double joules = 0;
double fluid = 0;
double adrenaline = 0;
double amiodarone = 0;
double glucose = 0;

double ageYearsNum = 0;


String ageYearsValue = "0.0";
String weightText = "0.0";
String uncuffedTubeText = "0.0";
String cuffedTubeText = "0.0";
String joulesText = "0.0";
String fluidText = "0.0";
String adrenalineText =  "0.0";
String amiodaroneText = "0.0";
String glucoseText = "0.0";

  @override
  void initState() {
    _age = TextEditingController();
    _age.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _age.dispose();
    super.dispose();
  }


  // ignore: non_constant_identifier_names
  void Calculation(String ageYearsValue){
    ageYearsNum = double.parse(ageYearsValue);
    weight = (ageYearsNum + 4) * 2;
    uncuffedTube = (ageYearsNum /4) + 4;
    cuffedTube = (ageYearsNum / 4) + 3.5;
    joules = weight * 4;
    fluid = weight * 20;
    adrenaline = weight * 10;
    amiodarone = weight * 5;
    glucose = weight * 5;

    weightText = weight.toStringAsFixed(2);
    uncuffedTubeText = uncuffedTube.toStringAsFixed(1);
    cuffedTubeText = cuffedTube.toStringAsFixed(1);
    joulesText = joules.toStringAsFixed(1);
    fluidText = fluid.toStringAsFixed(2);
    adrenalineText = adrenaline.toStringAsFixed(2);
    amiodaroneText = amiodarone.toStringAsFixed(2);
    glucoseText = glucose.toStringAsFixed(2);
  }

  void Reset(){
    setState(() {
      ageYearsValue = "0";
    });
    setState(() {
      weightText = "0.0";
    });
    setState(() {
      uncuffedTubeText = "0.0";
    });
    setState(() {
      cuffedTubeText = "0.0";
    });
    setState(() {
      joulesText = "0.0";
    });
    setState(() {
      fluidText = "0.0";
    });
    setState(() {
      adrenalineText =  "0.0";
    });
    setState(() {
      amiodaroneText = "0.0";
    });
    setState(() {
      glucoseText = "0.0";
    });
    setState(() {
      _age.text = "";
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.red,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 10,
                    width: double.maxFinite,
                  ),
                  Text("Paediatric Resuscitation",
                    style: TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                    width: double.maxFinite,
                  ),
                  Text("Calculations",
                    style: TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 40, top: 10, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Age",
                                ),
                                controller: _age,
                                keyboardType: TextInputType.number,
                                onChanged: (ageYearsValue){
                                  Calculation(ageYearsValue);
                                },
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text("Years",style: TextStyle(color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),)
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          Reset();
                          },
                        color: Colors.blue,
                        textColor: Colors.white,
                        splashColor: Colors.green,
                        child: Text("Reset", style:
                        TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 10, top: 5, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, right: 10, left: 16,bottom: 10.0),
                              child: Text("$weightText",
                                style: TextStyle(color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Weight Calculation - kg",style: TextStyle(color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text("Tube size uncuffed - mm I.D.:",style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 50, top: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10, left: 16,bottom: 5.0),
                          child: Text("${uncuffedTubeText}",
                            style: TextStyle(color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text("Tube size cuffed - mm i.d.",style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 75, top: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10, left: 16,bottom: 5.0),
                          child: Text("${cuffedTubeText}",
                            style: TextStyle(color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Plus half a size above and below",
                          style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 10, top: 15),
                        child: Text("DC Shock (Joules) 4 J/kg",style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 80, top: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10, left: 16,bottom: 5.0),
                          child: Text("${joulesText}",
                            style: TextStyle(color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text("Crystalloid Fluids 20 ml/kg",style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 70, top: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10, left: 16,bottom: 5.0),
                          child: Text("${fluidText}",
                            style: TextStyle(color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text("Adrenaline(1:10,000) 10 mcg/kg",style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 30, top: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10, left: 16,bottom: 5.0),
                          child: Text("${adrenalineText}",
                            style: TextStyle(color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Every three to five minutes",
                          style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text("Amiodarone 5 mg/kg iv/io",style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 75, top: 5, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10, left: 16,bottom: 5.0),
                          child: Text("${amiodaroneText}",
                            style: TextStyle(color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("After third and fifth DC Shock",
                          style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text("Glucose 5 ml/kg 10%",style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 110, top: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10, left: 16,bottom: 5.0),
                          child: Text("${glucoseText}",
                            style: TextStyle(color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("If severely hypoglycaemic",
                          style: TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]
            ),
          )
        ),
      ),
    );
  }
}
