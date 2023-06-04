// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test10/shared/colors.dart';

class Sellers extends StatefulWidget {
  const Sellers({super.key});

  @override
  State<Sellers> createState() => _SellersState();
}

class _SellersState extends State<Sellers> {
  List allBills = [];

// time = DateFormat("hh:mm").format(DateTime.now());
//       day = DateFormat("d/M/y").format(DateTime.now());

  AddNewBill(String Type, String pay, String Dealer, int Counts, double Price,
      double Cach, double allprice) {
    String time = DateFormat("hh:mm").format(DateTime.now());
    String day = DateFormat("d/M/y").format(DateTime.now());
  }

  String Date = "مفتل";

  List Dates = [
    "مفتل",
    "صقعي",
    "مجدول",
    "برحي",
    "جالكسي",
    "رطب",
  ];

  String DealerName = "ياسر العوس";

  List DealerNames = [
    "الحبلين",
    "النخيل",
    "العريني",
    "نخلات",
    "ياسر العوس",
    "خالد العوس",
    "فهد العوس",
    "نضيد",
  ];

  String PeymentCredet = "شبكة 1";

  List PeymentCredets = [
    "شبكة 1",
    "شبكة 2",
    "شبكة 3",
    "شبكة 4",
    "شبكة 5",
    "شبكة 6",
    "شبكة 7",
    "شبكة 8",
    "شبكة 9",
    "شبكة 10",
    "شبكة 11",
    "شبكة 12",
  ];

  String Trader = "ياسر الصعنوني"; // اسم المحاسب
  final NameCnt = TextEditingController();
  final NumbersCnt = TextEditingController();
  final priceCnt = TextEditingController();
  final CachCnt = TextEditingController();

  double Cach = 0;

  late int Counts;
  late double Price;
  late double allprice;

  //
  //

  trya2() {
    setState(() {
      Cach = double.parse(CachCnt.text);
    });
  }

  trya() {
    setState(() {
      Counts = int.parse(NumbersCnt.text);
      Price = double.parse(priceCnt.text);
      allprice = Price * Counts;
    });
  }

  // ChangeState(int clickedTask) {
  // setState(() {
  //   switch (allUsers[clickedTask].State) {
  //     case "غير معتمد":
  //       allUsers[clickedTask].State == "معتمد";
  //       break;

  //     case "معتمد":
  //       allUsers[clickedTask].State == "غير معتمد";
  //       break;

  //     default:
  //       break;
  //   }
  // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الموظفين",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: appbarcolor,
      ),
      backgroundColor: backgrond,
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(100, 145, 108, 89),
                        )),
                    onPressed: () {
                      // ChangeState(index);
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "{allUsers[index].NumberOfUser}",
                                              style: TextStyle(fontSize: 12)),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(" : رقم الجوال",
                                              style: TextStyle(fontSize: 15)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text("{allUsers[index].Email}",
                                              style: TextStyle(fontSize: 12)),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(" : الايميل",
                                              style: TextStyle(fontSize: 15)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                " {allUsers[index].Name}",
                                                style:
                                                    TextStyle(fontSize: 20))),
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              " : الاسم",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                "{allUsers[index].Type}",
                                                style:
                                                    TextStyle(fontSize: 15))),
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              " :  الاسم الوظيفي",
                                              style: TextStyle(fontSize: 15),
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                " {allUsers[index].State}",
                                                style:
                                                    TextStyle(fontSize: 15))),
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              " :  الاعتماد",
                                              style: TextStyle(fontSize: 15),
                                            )),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
