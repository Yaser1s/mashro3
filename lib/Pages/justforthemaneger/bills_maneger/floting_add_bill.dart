// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/Pages/justforthemaneger/bills_maneger/add_bill.dart';
import 'package:test10/shared/colors.dart';

class FlotingAddBillButton extends StatefulWidget {
  const FlotingAddBillButton({super.key});

  @override
  State<FlotingAddBillButton> createState() => _FlotingAddBillButtonState();
}

class _FlotingAddBillButtonState extends State<FlotingAddBillButton> {
  final credential = FirebaseAuth.instance.currentUser;
  final searchFarmsCnt = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    searchFarmsCnt.addListener(showUser);
  }

  showUser() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: Scaffold(
          backgroundColor: backgrond,
          appBar: AppBar(
              backgroundColor: appbarcolor,
              title: Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                      controller: searchFarmsCnt,
                      decoration: InputDecoration(
                          label: Text("اكتب رقم المزرعة هنا",
                              style: TextStyle(
                                  fontSize: 23, color: Colors.grey[800])))))),
          body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('Drivers')
                .where("DriverNumber", isEqualTo: searchFarmsCnt.text)
                .get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(backgrond)),
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddBillNew(
                                        nameFarmar: snapshot.data!.docs[index]
                                            ["NameFarmar"],
                                        uidFarmar: snapshot.data!.docs[index]
                                            ["UidFarm"],
                                        uidDriver: snapshot.data!.docs[index]
                                            ["UidDriver"],
                                        numberFarm: snapshot.data!.docs[index]
                                            ["DriverNumber"],
                                      );
                                    });
                              },
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          "#${snapshot.data!.docs[index]["DriverNumber"]}",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.grey[800])),
                                      Text(" : رقم المزرعة",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.grey[800]))
                                    ]),
                                Divider(thickness: 1, height: 20),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          snapshot.data!.docs[index]
                                              ["NameFarmar"],
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.grey[800])),
                                      Text(" : صاحب المزرعة",
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.grey[800]))
                                    ]),
                                Divider(thickness: 1, height: 20),
                              ])));
                    });
              }
              return Center(
                  child: CircularProgressIndicator(color: Colors.grey[800]));
            },
          )),
    );
  }
}



          //       Container(
          //         margin: const EdgeInsets.all(20),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //                 Expanded(
          //                   flex: 4,
          //                   child: SizedBox(
          //                     child: Column(
          //                       children: [
          //                         Container(
          //                           width: double.infinity,
          //                           margin: const EdgeInsets.symmetric(
          //                               horizontal: 10),
          //                           child: SearchField(
          //                               hint: "اختر",
          //                               searchInputDecoration: InputDecoration(
          //                                   enabledBorder: OutlineInputBorder(
          //                                       borderSide: BorderSide(
          //                                           color: borderSideColor,
          //                                           width: 1),
          //                                       borderRadius:
          //                                           BorderRadius.circular(10)),
          //                                   focusedBorder: OutlineInputBorder(
          //                                       borderSide: BorderSide(
          //                                           color: Colors.blue
          //                                               .withOpacity(0.8),
          //                                           width: 2),
          //                                       borderRadius:
          //                                           BorderRadius.circular(10))),
          //                               itemHeight: 50,
          //                               maxSuggestionsInViewPort: 6,
          //                               suggestionsDecoration:
          //                                   SuggestionDecoration(
          //                                       color: Colors.white,
          //                                       borderRadius:
          //                                           BorderRadius.circular(10)),
          //                               onSuggestionTap: (value) {
          //                                 setState(() {
          //                                   Date = value;
          //                                 });
          //                               },
          //                               suggestions: Dates.map((item) =>
          //                                   SearchFieldListItem(
          //                                     item,
          //                                     child: Row(
          //                                       children: [
          //                                         Text(item,
          //                                             style: const TextStyle(
          //                                                 fontWeight:
          //                                                     FontWeight.w400,
          //                                                 fontSize: 20)),
          //                                       ],
          //                                     ),
          //                                   )).toList()),
          //                           // DropdownButtonFormField(
          //                           //     decoration:
          //                           //         const InputDecoration(
          //                           //       border: OutlineInputBorder(
          //                           //           borderSide:
          //                           //               BorderSide(
          //                           //                   width:
          //                           //                       1)),
          //                           //       labelText:
          //                           //           "اختر نوع التمر",
          //                           //     ),
          //                           //     dropdownColor:buttons,
          //                           //     iconSize: 60,
          //                           //     borderRadius:
          //                           //         BorderRadius
          //                           //             .circular(10),
          //                           //     elevation: 15,
          //                           //     items: Dates.map((item) =>DropdownMenuItem(alignment:Alignment.centerLeft,value: item,child: Text(item,style: const TextStyle
          //                           //     },         (fontWeight:FontWeight.w400,fontSize: 20)),)).toList(),onChanged: (item) {setState(() {Date = (itemas String?)!;});
          //                           //     value: Date),
          //                         ),
          //                         const SizedBox(
          //                           height: 15,
          //                         ),
          //                         Container(
          //                             padding: const EdgeInsets.only(left: 7),
          //                             decoration: BoxDecoration(
          //                                 border: Border.all(
          //                                     color: Colors.black, width: 1.3),
          //                                 borderRadius:
          //                                     BorderRadius.circular(5)),
          //                             width: double.infinity,
          //                             child: TextField(
          //                               textInputAction: TextInputAction.next,
          //                               controller: countsCnt,
          //                               keyboardType: TextInputType.number,
          //                               decoration: const InputDecoration(
          //                                 border: InputBorder.none,
          //                                 hintText: "ادخل العدد",
          //                                 hintStyle: TextStyle(
          //                                     fontWeight: FontWeight.w300,
          //                                     fontSize: 17),
          //                               ),
          //                             )),
          //                         const SizedBox(
          //                           height: 15,
          //                         ),
          //                         Container(
          //                             decoration: BoxDecoration(
          //                                 border: Border.all(
          //                                   color: Colors.black,
          //                                   width: 1.3,
          //                                 ),
          //                                 borderRadius:
          //                                     BorderRadius.circular(5)),
          //                             width: double.infinity,
          //                             padding: const EdgeInsets.only(left: 7),
          //                             child: TextField(
          //                               textInputAction: TextInputAction.done,
          //                               controller: priceCnt,
          //                               keyboardType: TextInputType.number,
          //                               decoration: const InputDecoration(
          //                                 border: InputBorder.none,
          //                                 hintText: "سعر الكرتون",
          //                                 hintStyle: TextStyle(
          //                                     fontWeight: FontWeight.w300,
          //                                     fontSize: 17),
          //                               ),
          //                             )),
          //                         const SizedBox(
          //                           height: 15,
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //                 const Expanded(
          //                   flex: 1,
          //                   child: SizedBox(
          //                     height: 15,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 Container(
          //                   margin: const EdgeInsets.only(top: 30, left: 5),
          //                   child: ElevatedButton(
          //                     style: const ButtonStyle(
          //                         backgroundColor: MaterialStatePropertyAll(
          //                             Color.fromARGB(104, 107, 40, 6))),
          //                     onPressed: () {
          //                       allpricee();
          //                       Navigator.pop(context);
          //                       showDialog(
          //                           context: context,
          //                           builder: (BuildContext context) {
          //                             return Dialog(
          //                               child: Container(
          //                                 width: 100,
          //                                 height: 300,
          //                                 color: buttons,
          //                                 padding: const EdgeInsets.all(22),
          //                                 child: Column(
          //                                   children: [
          //                                     Row(
          //                                       mainAxisAlignment:
          //                                           MainAxisAlignment
          //                                               .spaceAround,
          //                                       children: [
          //                                         Column(
          //                                           children: [
          //                                             ElevatedButton(
          //                                                 style: const ButtonStyle(
          //                                                     backgroundColor:
          //                                                         MaterialStatePropertyAll(
          //                                                             Color.fromARGB(
          //                                                                 75,
          //                                                                 90,
          //                                                                 37,
          //                                                                 10))),
          //                                                 onPressed: () {
          //                                                   AddBill().addNewBil(
          //                                                       nameFarm:NameCnt.text,
          //                                                       numberFarm:"#${numberFarmCnt.text}",
          //                                                       type: Date,
          //                                                       weyPay: Trader,
          //                                                       dealerName:Trader,
          //                                                       countt: Counts,
          //                                                       pricee: Price,
          //                                                       cachh: allprice,
          //                                                       allPricee:allprice,
          //                                                       payedDamg: "0",
          //                                                       state:"تحت المراجعة",
          //                                                       context:context);
          //                                                   Navigator.pop(context,);
          //                                                 },
          //                                                 child: const Text(
          //                                                   "كاش",
          //                                                   style: TextStyle(
          //                                                       fontSize: 22),
          //                                                 )),
          //                                             const SizedBox(
          //                                               height: 30,
          //                                             ),
          //                                             ElevatedButton(
          //                                                 style: const ButtonStyle(
          //                                                     backgroundColor:
          //                                                         MaterialStatePropertyAll(
          //                                                             Color.fromARGB(
          //                                                                 104,
          //                                                                 94,
          //                                                                 60,
          //                                                                 44))),
          //                                                 onPressed: () {
          //                                                   Navigator.pop(
          //                                                       context);
          //                                                   showDialog(
          //                                                       context:
          //                                                           context,
          //                                                       builder:
          //                                                           (BuildContext
          //                                                               context) {
          //                                                         return Card(
          //                                                           color:
          //                                                               buttons,
          //                                                           margin: const EdgeInsets
          //                                                                   .symmetric(
          //                                                               horizontal:
          //                                                                   80,
          //                                                               vertical:
          //                                                                   200),
          //                                                           child: Row(
          //                                                             children: [
          //                                                               const Expanded(
          //                                                                   child:
          //                                                                       SizedBox()),
          //                                                               Expanded(
          //                                                                 flex:
          //                                                                     4,
          //                                                                 child:
          //                                                                     Column(
          //                                                                   children: [
          //                                                                     const SizedBox(
          //                                                                       height: 20,
          //                                                                     ),
          //                                                                     SizedBox(
          //                                                                       height: 65,
          //                                                                       width: double.infinity,
          //                                                                       child:
          //                                                                           //
          //                                                                           DropdownButtonFormField(
          //                                                                         decoration: const InputDecoration(
          //                                                                           border: OutlineInputBorder(),
          //                                                                           labelText: "اختر رقم الشبكة",
          //                                                                         ),
          //                                                                         dropdownColor: const Color.fromARGB(255, 212, 156, 130),
          //                                                                         hint: const Text("شبكة رقم"),
          //                                                                         icon: const Icon(Icons.arrow_drop_down),
          //                                                                         iconSize: 36,
          //                                                                         style: const TextStyle(color: Colors.black, fontSize: 22),
          //                                                                         value: PeymentCredet,
          //                                                                         onChanged: (item) {
          //                                                                           setState(() {
          //                                                                             PeymentCredet = (item as String);
          //                                                                           });
          //                                                                         },
          //                                                                         items: PeymentCredets.map((item) => DropdownMenuItem(
          //                                                                               alignment: Alignment.centerLeft,
          //                                                                               value: item,
          //                                                                               child: Text(item, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
          //                                                                             )).toList(),
          //                                                                       ),
          //                                                                     ),
          //                                                                     const SizedBox(height: 20),
          //                                                                     ElevatedButton(
          //                                                                         style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(99, 65, 52, 46))),
          //                                                                         onPressed: () {
          //                                                                           Navigator.pop(context);
          //                                                                           AddNewBill(Date, PeymentCredet, PeymentCredet, Counts, Price, 0, allprice);
          //                                                                         },
          //                                                                         child: const Text("حفظ"))
          //                                                                   ],
          //                                                                 ),
          //                                                               ),
          //                                                               const Expanded(
          //                                                                   child:
          //                                                                       SizedBox())
          //                                                             ],
          //                                                           ),
          //                                                         );
          //                                                       });
          //                                                 },
          //                                                 child: const Text(
          //                                                   "شبكة",
          //                                                   style: TextStyle(
          //                                                       fontSize: 22),
          //                                                 )),
          //                                           ],
          //                                         ),
          //                                         Column(
          //                                           children: [
          //                                             ElevatedButton(
          //                                                 style: const ButtonStyle(
          //                                                     backgroundColor:
          //                                                         MaterialStatePropertyAll(
          //                                                             Color.fromARGB(
          //                                                                 104,
          //                                                                 94,
          //                                                                 60,
          //                                                                 44))),
          //                                                 onPressed: () {
          //                                                   Navigator.pop(
          //                                                       context);
          //                                                   showDialog(
          //                                                       context:
          //                                                           context,
          //                                                       builder:
          //                                                           (BuildContext
          //                                                               context) {
          //                                                         return Card(
          //                                                           color: const Color
          //                                                                   .fromARGB(
          //                                                               255,
          //                                                               252,
          //                                                               204,
          //                                                               180),
          //                                                           margin: const EdgeInsets
          //                                                                   .symmetric(
          //                                                               horizontal:
          //                                                                   90,
          //                                                               vertical:
          //                                                                   200),
          //                                                           child: Row(
          //                                                             children: [
          //                                                               const Expanded(
          //                                                                   child:
          //                                                                       SizedBox()),
          //                                                               Expanded(
          //                                                                 flex:
          //                                                                     4,
          //                                                                 child:
          //                                                                     Column(
          //                                                                   children: [
          //                                                                     const SizedBox(
          //                                                                       height: 20,
          //                                                                     ),
          //                                                                     Container(
          //                                                                         decoration: BoxDecoration(
          //                                                                             border: Border.all(
          //                                                                               color: Colors.black,
          //                                                                               width: 1.3,
          //                                                                             ),
          //                                                                             borderRadius: BorderRadius.circular(5)),
          //                                                                         width: double.infinity,
          //                                                                         padding: const EdgeInsets.only(left: 7),
          //                                                                         child: TextField(
          //                                                                           textInputAction: TextInputAction.done,
          //                                                                           controller: cachCnt,
          //                                                                           keyboardType: TextInputType.number,
          //                                                                           decoration: const InputDecoration(
          //                                                                             border: InputBorder.none,
          //                                                                             hintText: "الكاش",
          //                                                                             hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
          //                                                                           ),
          //                                                                         )),
          //                                                                     const SizedBox(height: 20),
          //                                                                     SizedBox(
          //                                                                       height: 65,
          //                                                                       width: double.infinity,
          //                                                                       child:
          //                                                                           //
          //                                                                           DropdownButtonFormField(
          //                                                                         decoration: const InputDecoration(
          //                                                                           border: OutlineInputBorder(),
          //                                                                           labelText: "اختر رقم الشبكة",
          //                                                                         ),
          //                                                                         dropdownColor: const Color.fromARGB(255, 212, 156, 130),
          //                                                                         hint: const Text("شبكة رقم"),
          //                                                                         icon: const Icon(Icons.arrow_drop_down),
          //                                                                         iconSize: 36,
          //                                                                         style: const TextStyle(color: Colors.black, fontSize: 22),
          //                                                                         value: PeymentCredet,
          //                                                                         onChanged: (item) {
          //                                                                           setState(() {
          //                                                                             PeymentCredet = (item as String);
          //                                                                           });
          //                                                                         },
          //                                                                         items: PeymentCredets.map((item) => DropdownMenuItem(
          //                                                                               alignment: Alignment.centerLeft,
          //                                                                               value: item,
          //                                                                               child: Text(item, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
          //                                                                             )).toList(),
          //                                                                       ),
          //                                                                     ),
          //                                                                     ElevatedButton(
          //                                                                         style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(99, 65, 52, 46))),
          //                                                                         onPressed: () {
          //                                                                           Navigator.pop(context);
          //                                                                           AddNewBill(Date, "دمج", Trader, Counts, Price, cach, allprice);
          //                                                                         },
          //                                                                         child: const Text("حفظ"))
          //                                                                   ],
          //                                                                 ),
          //                                                               ),
          //                                                               const Expanded(
          //                                                                   child:
          //                                                                       SizedBox())
          //                                                             ],
          //                                                           ),
          //                                                         );
          //                                                       });
          //                                                 },
          //                                                 child: const Text(
          //                                                   "دمج",
          //                                                   style: TextStyle(
          //                                                       fontSize: 22),
          //                                                 )),
          //                                             const SizedBox(
          //                                               height: 30,
          //                                             ),
          //                                             ElevatedButton(
          //                                                 style: const ButtonStyle(
          //                                                     backgroundColor:
          //                                                         MaterialStatePropertyAll(
          //                                                             Color.fromARGB(
          //                                                                 99,
          //                                                                 65,
          //                                                                 52,
          //                                                                 46))),
          //                                                 onPressed: () {
          //                                                   Navigator.pop(
          //                                                       context);
          //                                                   showDialog(
          //                                                       context:
          //                                                           context,
          //                                                       builder:
          //                                                           (BuildContext
          //                                                               context) {
          //                                                         return Card(
          //                                                           color: const Color
          //                                                                   .fromARGB(
          //                                                               255,
          //                                                               252,
          //                                                               204,
          //                                                               180),
          //                                                           margin: const EdgeInsets
          //                                                                   .symmetric(
          //                                                               horizontal:
          //                                                                   80,
          //                                                               vertical:
          //                                                                   300),
          //                                                           child: Row(
          //                                                             children: [
          //                                                               const Expanded(
          //                                                                   child:
          //                                                                       SizedBox()),
          //                                                               Expanded(
          //                                                                 flex:
          //                                                                     4,
          //                                                                 child:
          //                                                                     Column(
          //                                                                   children: [
          //                                                                     const SizedBox(
          //                                                                       height: 20,
          //                                                                     ),
          //                                                                     Container(
          //                                                                       padding: const EdgeInsets.only(left: 7),
          //                                                                       height: 55,
          //                                                                       decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.3), borderRadius: BorderRadius.circular(5)),
          //                                                                       width: double.infinity,
          //                                                                       child: DropdownButtonFormField(
          //                                                                         decoration: const InputDecoration(border: InputBorder.none),
          //                                                                         dropdownColor: const Color.fromARGB(255, 212, 156, 130),
          //                                                                         hint: const Text("التاجر"),
          //                                                                         icon: const Icon(Icons.arrow_drop_down),
          //                                                                         iconSize: 36,
          //                                                                         style: const TextStyle(color: Colors.black, fontSize: 22),
          //                                                                         value: DealerName,
          //                                                                         onChanged: (item) {
          //                                                                           setState(() {
          //                                                                             DealerName = (item as String);
          //                                                                           });
          //                                                                         },
          //                                                                         items: DealerNames.map((item) => DropdownMenuItem(
          //                                                                               alignment: Alignment.centerLeft,
          //                                                                               value: item,
          //                                                                               child: Text(item, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
          //                                                                             )).toList(),
          //                                                                       ),
          //                                                                     ),
          //                                                                     const SizedBox(height: 20),
          //                                                                     ElevatedButton(
          //                                                                         style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(99, 65, 52, 46))),
          //                                                                         onPressed: () {
          //                                                                           Navigator.pop(context);
          //                                                                           AddNewBill(Date, DealerName, DealerName, Counts, Price, 0, allprice);
          //                                                                         },
          //                                                                         child: const Text("حفظ"))
          //                                                                   ],
          //                                                                 ),
          //                                                               ),
          //                                                               const Expanded(
          //                                                                   child:
          //                                                                       SizedBox())
          //                                                             ],
          //                                                           ),
          //                                                         );
          //                                                       });
          //                                                 },
          //                                                 child: const Text(
          //                                                   "تاجر",
          //                                                   style: TextStyle(
          //                                                       fontSize: 22),
          //                                                 )),
          //                                           ],
          //                                         ),
          //                                       ],
          //                                     ),
          //                                     Row(
          //                                       mainAxisAlignment:
          //                                           MainAxisAlignment
          //                                               .spaceBetween,
          //                                       children: [
          //                                         const SizedBox(height: 10),
          //                                         Container(
          //                                           margin:
          //                                               const EdgeInsets.only(
          //                                                   top: 30),
          //                                           padding:
          //                                               const EdgeInsets.all(4),
          //                                           height: 45,
          //                                           // width: 150,
          //                                           decoration: BoxDecoration(
          //                                               border: Border.all(
          //                                                 color: Colors.black,
          //                                                 width: 1.3,
          //                                               ),
          //                                               borderRadius:
          //                                                   BorderRadius
          //                                                       .circular(5)),
          //                                           child: Text(
          //                                             "المجموع : $allprice",
          //                                             style: const TextStyle(
          //                                                 fontSize: 18),
          //                                           ),
          //                                         ),
          //                                       ],
          //                                     )
          //                                   ],
          //                                 ),
          //                               ),
          //                             );
          //                           });
          //                     },
          //                     child: const Text(
          //                       "حفظ",
          //                       style: TextStyle(fontSize: 22),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),