// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test10/Pages/justforthemaneger/employee/edit_employee.dart';
import 'package:test10/shared/colors.dart';

class Retern extends StatefulWidget {
  dynamic allEmployess;
  Retern({super.key, required this.allEmployess});

  @override
  State<Retern> createState() => _ReternState();
}

class _ReternState extends State<Retern> {
  dynamic cachh = 0;
  getAllCach() async {
    if (widget.allEmployess["Bills"].length > 0) {
      dynamic cah = 0;
      for (int i = 0; i < widget.allEmployess["Bills"].length; i++) {
        var item = widget.allEmployess["Bills"][i];

        try {
          DocumentSnapshot billss = await FirebaseFirestore.instance
              .collection('Bills')
              .doc(item)
              .get();
          cah = billss["Cach"] + cah;
        } catch (e) {
          print(e);
        }
      }
      setState(() {
        cachh = cah;
      });
    }
  }

  @override
  void initState() {
    getAllCach();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return EditEmployee(data: widget.allEmployess);
              });
        },
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(55, 0, 0, 0),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    const Text(" : اسم الموظف",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: fontWeighttext,
                            color: textColorsBlack))
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.allEmployess["Name"],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: fontWeighttext,
                                  color: textColorsBlack))
                        ])
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.allEmployess["NumberOfUser"],
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: fontWeighttext,
                                  color: textColorsBlack))
                        ]),
                    const Text(" : رقم الموظف",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: fontWeighttext,
                            color: textColorsBlack))
                  ]),
                  widget.allEmployess["Bills"].length > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "${widget.allEmployess["Bills"].length}",
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: fontWeighttext,
                                            color: textColorsBlack))
                                  ]),
                              const Text(" : عدد الفواتير",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: fontWeighttext,
                                      color: textColorsBlack))
                            ])
                      : SizedBox(height: 2),
                  widget.allEmployess["Bills"].length > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$cachh",
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: fontWeighttext,
                                            color: textColorsBlack))
                                  ]),
                              const Text(" : الكاش",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: fontWeighttext,
                                      color: textColorsBlack))
                            ])
                      : SizedBox(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.allEmployess["UserName"],
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: fontWeighttext,
                                color: textColorsBlack)),
                        SizedBox(width: 30),
                        Text(widget.allEmployess["Type"],
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: fontWeighttext,
                                color: textColorsBlack))
                      ]),
                ])));
  }
}
