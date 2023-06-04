// ignore_for_file: empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test10/models/bill_delars.dart';
import 'package:test10/shared/snackbar.dart';
import 'package:uuid/uuid.dart';

class AddBillDelars {
  //

  addNewBilDelars(
      {required uidDriver,
      required uidDelars,
      required nameFarmar,
      required numberDriver,
      required uidFarmar,
      required typeDate,
      required typePuy,
      required conts,
      required price,
      required allPrice,
      required nameDelars,
      required context}) async {
    String idBill = const Uuid().v1();
    String message = "ERROR => Not starting the code";
    try {
      CollectionReference bills =
          FirebaseFirestore.instance.collection('Bills');

      //

      CollectionReference tradors =
          FirebaseFirestore.instance.collection('Tradors');

      //

      CollectionReference delars =
          FirebaseFirestore.instance.collection('Delars');
      message = "ERROR => erroe hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";
      AdedBillDelars bill = AdedBillDelars(
        uidDriver: uidDriver,
        uidBill: idBill,
        nameFarmar: nameFarmar,
        numberDriver: numberDriver,
        uidFarmar: uidFarmar,
        typePuy: typePuy,
        typeDate: typeDate,
        counts: conts,
        price: price,
        allPrice: allPrice,
        nameDelars: nameDelars,
        uidTrador: FirebaseAuth.instance.currentUser!.uid,
      );
      message = "ERROR => erroe ";
      bills.doc(idBill).set(bill.convert2Map());
      tradors.doc(FirebaseAuth.instance.currentUser!.uid).update({
        "Bills": FieldValue.arrayUnion([
          {"UidBill": idBill, "Cach": 0.0}
        ])
      });
      delars.doc(uidDelars).update({
        "Bills": FieldValue.arrayUnion([
          {"UidBill": idBill, "Price": allPrice}
        ])
      });
      message = " Posted successfully ♥ ♥";
    } catch (e) {}
    showSnackBar(context, message);
  }
}
