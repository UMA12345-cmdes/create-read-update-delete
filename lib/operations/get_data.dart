import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {

void get() async{

  // all data fetch

      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(
        "user").get();
        for(var doc in snapshot.docs){
        log(doc.data().toString());
        }



      //single specific data fetch from firebase

      // DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection(
      //   "user").doc("ZV6IXwvVfDh9fViaIn8D").get();
      // log(snapshot.data().toString());

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(actions: const [],
      // title: const Text('Get Your Data'),
      // centerTitle: true,
      // ),
      body: SafeArea(child: Center(
        child: Column(
          children:  [
            const Text('see your all data'),
            MaterialButton(
             onPressed: () => get(),
            child: const Text('show all data'),
            color: Theme.of(context).primaryColor,
            )
          ],
        ),
      )),
    );
  }
}