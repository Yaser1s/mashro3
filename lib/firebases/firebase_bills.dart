// ignore_for_file: empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test10/models/bill.dart';
import 'package:test10/shared/snackbar.dart';
import 'package:uuid/uuid.dart';

class AddBill {
  //

  addNewBil(
      {required uidDriver,
      required nameFarmar,
      required numberDriver,
      required uidFarmar,
      required typeDate,
      required typePuy,
      required conts,
      required price,
      required allPrice,
      required numberCachMachen,
      required cach,
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

      CollectionReference driver =
          FirebaseFirestore.instance.collection('Drivers');

      //

      CollectionReference farms =
          FirebaseFirestore.instance.collection('Farms');

      message = "ERROR => erroe hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";
      AdedBill bill = AdedBill(
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
        numberCachMachen: numberCachMachen,
        cach: cach,
        uidTrador: FirebaseAuth.instance.currentUser!.uid,
      );
      message = "ERROR => erroe ";
      bills.doc(idBill).set(bill.convert2Map());
      tradors.doc(FirebaseAuth.instance.currentUser!.uid).update({"Bills": FieldValue.arrayUnion([idBill])});
      driver.doc(uidDriver).update({"Bills": FieldValue.arrayUnion([idBill])});
      farms.doc(uidFarmar).update({"Bills": FieldValue.arrayUnion([idBill])});

      message = " تم الاعتماد ";
    } catch (e) {}
    showSnackBar(context, message);
  }
}
