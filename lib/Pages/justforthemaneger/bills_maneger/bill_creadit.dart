import 'package:flutter/material.dart';
import 'package:test10/firebases/firebase_bills.dart';
import 'package:test10/shared/colors.dart';

class BillCredit extends StatefulWidget {
  final String uidFarmar;
  final String nameFarmar;
  final String uidDrivar;
  final String numberFarm;
  final double price;
  final double conts;
  final String typeDate;
  const BillCredit({
    super.key,
    required this.uidFarmar,
    required this.nameFarmar,
    required this.uidDrivar,
    required this.numberFarm,
    required this.price,
    required this.conts,
    required this.typeDate,
  });

  @override
  State<BillCredit> createState() => _BillCreditState();
}

class _BillCreditState extends State<BillCredit> {
  String dealerName = "ياسر العوس";

  List dealerNames = [
    "الحبلين",
    "النخيل",
    "العريني",
    "نخلات",
    "ياسر العوس",
    "خالد العوس",
    "فهد العوس",
    "نضيد",
  ];

  String peymentCredet = "شبكة 1";

  List peymentCredets = [
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
  double cach = 0;
  int pepowr = 1;
  //

  //

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 200),
        child: Scaffold(
        backgroundColor: backgrond,
            body: Row(children: [
          Expanded(
              flex: 4,
              child: Column(children: [
                const SizedBox(height: 20),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 65,
                    width: double.infinity,
                    child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "اختر رقم الشبكة"),
                        dropdownColor: flotingAddColor,
                        hint: const Text("شبكة رقم"),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        style: const TextStyle(
                            color: textColorsBlack, fontSize: 22),
                        value: peymentCredet,
                        onChanged: (item) {
                          setState(() {
                            peymentCredet = (item as String);
                          });
                        },
                        items: peymentCredets
                            .map((item) => DropdownMenuItem(
                                alignment: Alignment.centerLeft,
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20))))
                            .toList())),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(buttons)),
                    onPressed: () {
                      AddBill().addNewBil(
                          uidDriver: widget.uidDrivar,
                          nameFarmar: widget.nameFarmar,
                          uidFarmar: widget.uidFarmar,
                          numberDriver: widget.numberFarm,
                          typeDate: widget.typeDate,
                          typePuy: "شبكة",
                          conts: widget.conts,
                          price: widget.price,
                          allPrice: widget.conts * widget.price,
                          numberCachMachen: peymentCredet,
                          cach: 0.0,
                          context: context);
                      Navigator.pop(context);
                    },
                    child: const Text("حفظ"))
              ]))
        ])));
  }
}
