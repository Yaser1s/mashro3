//
//
//
//
//
//
//
//
//
//
//
//
//
//

//

//

//

class AdedBill {
  final String uidDriver;
  final String uidBill;
  final String nameFarmar;
  final String numberDriver;
  final String uidFarmar;
  final String typeDate;
  final String typePuy;
  final double counts;
  final double price;
  final double allPrice;
  final String numberCachMachen;
  final double cach;
  final String uidTrador;
  // final String numberbill;
  // final String nameFarm; //                 اسم المزارع
  // final String numberFarm; //                رقم المزرعة
  // // final String time; //                الوقت
  // // final String dateTime; //                التاريخ
  // final String type; //                نوع التمر
  // final String pay; //                طريقة الحساب
  // final String dealerName; //                اسم التاجر
  // final int count; //                عدد الكراتين
  // final double price; //                سعر الكرتون
  // final double cach; //                المدفوع كاش
  // final String payandAnother; // اسم الشبكة اللي في الدمج
  // final double allPrice; //                الاجمالي
  // final String state; //                حالة الفاتورة
  // final String numberAccountant;
  // final String tradorUid;
  // final String farmarUid;
  // // late int pricePay; //                المدفوع من التاجر
  // // late int priceCreadet; //                المدفوع شبكة
  AdedBill(
      {required this.uidDriver,
      required this.uidBill,
      required this.numberDriver,
      required this.nameFarmar,
      required this.uidFarmar,
      required this.typeDate,
      required this.typePuy,
      required this.counts,
      required this.price,
      required this.allPrice,
      required this.numberCachMachen,
      required this.cach,
      required this.uidTrador
      // required this.numberbill,
      // required this.nameFarm,
      // required this.numberFarm,
      // // required this.time,
      // // required this.dateTime,
      // required this.type,
      // required this.pay,
      // required this.dealerName,
      // required this.count,
      // required this.price,
      // required this.cach,
      // required this.payandAnother,
      // required this.allPrice,
      // required this.state,
      // required this.numberAccountant,
      // required this.tradorUid,
      // required this.farmarUid,
      });
  Map<String, dynamic> convert2Map() {
    return {
      "UidDriver": uidDriver,
      "UidBill": uidBill,
      "NumberDriver":numberDriver,
      "NameFarmar": nameFarmar,
      "DateTime": DateTime.now(),
      // "UidFarmar": uidFarmar,
      "TypeDate": typeDate,
      "TypePuy": typePuy,
      "Counts": counts,
      "Price": price,
      "AllPrice": allPrice,
      "NumberCachMachen": numberCachMachen,
      "Cach": cach,
      "uidTrador": uidTrador,
    };
  }
}
