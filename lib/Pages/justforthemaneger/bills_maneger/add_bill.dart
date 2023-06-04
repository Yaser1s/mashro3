import 'package:flutter/material.dart';
import 'package:test10/Pages/justforthemaneger/bills_maneger/add_bill2.dart';
import 'package:test10/shared/colors.dart';

class AddBillNew extends StatefulWidget {
  final String nameFarmar;
  final String uidFarmar;
  final String uidDriver;
  final String numberFarm;

  const AddBillNew(
      {super.key,
      required this.nameFarmar,
      required this.uidFarmar,
      required this.uidDriver,
      required this.numberFarm});

  @override
  State<AddBillNew> createState() => _AddBillNewState();
}

class _AddBillNewState extends State<AddBillNew> {
  // AddNewBill(String Type, String pay, String Dealer, int Counts, double Price,
  //     double Cach, double allprice) {
  //   String time = dateFormat("hh:mm").format(dateTime.now());
  //   String day = dateFormat("d/M/y").format(dateTime.now());
  // }

  String date = "مفتل";
  List dates = [
    "مفتل",
    "صقعي",
    "مجدول",
    "برحي",
    "جالكسي",
    "رطب",
  ];

  // String DealerName = "ياسر العوس";
  // List DealerNames = [
  //   "الحبلين",
  //   "النخيل",
  //   "العريني",
  //   "نخلات",
  //   "ياسر العوس",
  //   "خالد العوس",
  //   "فهد العوس",
  //   "نضيد",
  // ];
  // String PeymentCredet = "شبكة 1";
  // List PeymentCredets = [
  //   "شبكة 1",
  //   "شبكة 2",
  //   "شبكة 3",
  //   "شبكة 4",
  //   "شبكة 5",
  //   "شبكة 6",
  //   "شبكة 7",
  //   "شبكة 8",
  //   "شبكة 9",
  //   "شبكة 10",
  //   "شبكة 11",
  //   "شبكة 12",
  // ];
  // String Trader = "ياسر الصعنوني"; // اسم المحاسب

  final priceCnt = TextEditingController();
  final countsCnt = TextEditingController();

  // double Cach = 0;
  // int pepowr = 1;
  // late int Counts;
  // late double Price;
  // late double allprice;
  // //
  // //
  // trya() {
  //   setState(() {
  //     Counts = int.parse(NumbersCnt.text);
  //     Price = double.parse(priceCnt.text);
  //   });
  // }

  // @override
  // void dispose() {
  //   countsCnt.dispose();
  //   priceCnt.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 120),
      child: Scaffold(
          backgroundColor: backgrond,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 20),
                // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                //   const SizedBox(width: 30),
                //   Image.asset("assets/img/logo.jpeg", height: 70)
                // ]),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.3),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(widget.nameFarmar,
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.grey[800])),
                                    Text(" : صاحب المزرعة",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.grey[800]))
                                  ],
                                )),
                            Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.3),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("#${widget.numberFarm}",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.grey[800])),
                                      Text(" : رقم المزرعة",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.grey[800]))
                                    ]))
                          ]),
                      const SizedBox(height: 15),
                      Row(children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(height: 15),
                        ),
                        Expanded(
                            flex: 4,
                            child: SizedBox(
                                child: Column(children: [
                              Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.3),
                                      borderRadius: BorderRadius.circular(5)),
                                  // margin: const EdgeInsets.symmetric(horizontal: 60),
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(left: 7),
                                  child: DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                      dropdownColor: flotingAddColor,
                                      isExpanded: true,
                                      iconSize: 50,
                                      borderRadius: BorderRadius.circular(10),
                                      elevation: 15,
                                      items: dates
                                          .map((item) => DropdownMenuItem(
                                              alignment: Alignment.centerLeft,
                                              value: item,
                                              child: Text(item,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 20))))
                                          .toList(),
                                      onChanged: (item) {
                                        setState(() {
                                          date = (item as String?)!;
                                        });
                                      },
                                      value: date)),
                              const SizedBox(height: 15),
                              Container(
                                  padding: const EdgeInsets.only(left: 7),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.3),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: double.infinity,
                                  child: TextField(
                                      controller: countsCnt,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "ادخل العدد",
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17)))),
                              const SizedBox(height: 15),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.3),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(left: 7),
                                  child: TextField(
                                      textInputAction: TextInputAction.done,
                                      controller: priceCnt,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "سعر الكرتون",
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17)))),
                              const SizedBox(height: 15)
                            ]))),
                        const Expanded(flex: 1, child: SizedBox(height: 15))
                      ]),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 30, left: 5),
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(104, 107, 40, 6))),
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddNewBill2(
                                        uidFarmar: widget.uidFarmar,
                                        nameFarmar: widget.nameFarmar,
                                        uidDrivar: widget.uidDriver,
                                        numberFarm: widget.numberFarm,
                                        price: double.parse(priceCnt.text),
                                        conts: double.parse(countsCnt.text),
                                        typeDate: date,
                                      );
                                    });
                              },
                              child: const Text(
                                "حفظ",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
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
  }
}
