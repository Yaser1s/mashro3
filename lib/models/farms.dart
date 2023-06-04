//

// ignore_for_file: non_constant_identifier_names, equal_keys_in_map

class AddFarm {
  final dynamic UidFarm;
  final DateTime dateUpload;
  final String WhowInCharge;
  final String WhowInChargePhoneNumber;
  final String WhowUplodetUid;
  final String WhowUplodetName;

  AddFarm({
    required this.UidFarm,
    required this.dateUpload,
    required this.WhowInCharge,
    required this.WhowInChargePhoneNumber,
    required this.WhowUplodetUid,
    required this.WhowUplodetName,
  });
  Map<String, dynamic> convert2Map() {
    return {
      "UidFarm": UidFarm,
      "WhowInCharge": WhowInCharge,
      "WhowInChargePhoneNumber": WhowInChargePhoneNumber,
      "WhowUplodetUid": WhowUplodetUid,
      "WhowUplodetName": WhowUplodetName,
      "Drivers": [],
    };
  }
}

class AddNewBill {
  final String BillUid;
  final String WhoWriterName;
  final String WhoWriterNumber; // 15 م90 رقم
  final int WhoMuchPrice;
  final String Date;
  final int WhoMuchAllPrice;
  final int Conts;
  final String WhoTheBuyer;
  final DateTime TimeWrite;
  AddNewBill({
    required this.BillUid,
    required this.WhoWriterName,
    required this.WhoWriterNumber,
    required this.WhoMuchPrice,
    required this.Date,
    required this.WhoMuchAllPrice,
    required this.Conts,
    required this.WhoTheBuyer,
    required this.TimeWrite,
  });
  Map<String, dynamic> convert2Map() {
    return {
      "BillUid": BillUid,
      "WhoWriterName": WhoWriterName,
      "WhoWriterNumber": WhoWriterNumber,
      "WhoMuchPrice": WhoMuchPrice,
      "Date": Date,
      "WhoMuchAllPrice": WhoMuchAllPrice,
      "Conts": Conts,
      "WhoTheBuyer": WhoTheBuyer,
      "TimeWrite": TimeWrite,
    };
  }
}

class AddNewDriver {
  final String uidFarm;
  final String uidDriver;
  final String nameFarmar;
  final DateTime dateUpload;
  final String driverName; // 6
  final String driverNumber;
  final String driverPhoneNumber; // 7
  final String whowUplodetUid; //

  AddNewDriver({
    required this.uidFarm,
    required this.uidDriver,
    required this.nameFarmar,
    required this.dateUpload,
    required this.driverName, // 6
    required this.driverNumber,
    required this.driverPhoneNumber, // 7
    required this.whowUplodetUid, //
  });
  Map<String, dynamic> convert2Map() {
    return {
      "UidDriver": uidDriver, //1
      "UidFarm": uidFarm, // 2
      "NameFarmar": nameFarmar, // 3
      "DateUpload": dateUpload, // 4
      "WhowUplodetUid": whowUplodetUid, // 5
      "DriverName": driverName, // 6
      "DriverNumber": driverNumber, // 7
      "DriverPhoneNumber": driverPhoneNumber, // 8
      "Bills": [], // 9
      "WhowUplodetUid": whowUplodetUid
    };
  }
}

// class AddNewFarm {
//   final String UidFarm; // 1
//   final String TheOnerName; // 2
//   final String TheOnerId; // 3
//   final List TheOnerNumber; // 4
//   final List TheFarms; // 5
//   AddNewFarm({
//     required this.UidFarm, // 1
//     required this.TheOnerName, // 2
//     required this.TheOnerId, // 3
//     required this.TheOnerNumber, // 4
//     required this.TheFarms, // 5
//   });
//   Map<String, dynamic> convert2Map() {
//     return {
//       "UidFarm": UidFarm, // 1
//       "TheOnerName": TheOnerName, // 2
//       "TheOnerId": TheOnerId, // 3
//       "TheOnerNumber": TheOnerNumber, // 4
//       "TheFarms": TheFarms, // 5
//     };
//   }
// }