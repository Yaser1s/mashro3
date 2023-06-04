import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test10/main.dart';
import 'package:test10/provider/user_provider.dart';

class Resposive extends StatefulWidget {
  const Resposive({Key? key}) : super(key: key);

  @override
  State<Resposive> createState() => _ResposiveState();
}

class _ResposiveState extends State<Resposive> {
  // To get data from DB using provider
  getDataFromDB() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  void initState() {
    super.initState();
    getDataFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return const MyApp();

    // LayoutBuilder(builder: (BuildContext, BoxConstraints) {
    //   if (BoxConstraints.maxWidth > 600) {
    //     return widget.myWebScreen;
    //   } else {
    //     return widget.myMobileScreen;
    //   }
    // });
  }
}
