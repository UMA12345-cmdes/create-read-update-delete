import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({Key? key}) : super(key: key);

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {

void update() async {
  
    FirebaseFirestore.instance.collection(
        "user").doc("LJDVtPzmQ7VD0YkUn0d2").update({"email": "jina12@gmail.com"});
        log("user updated !!  ");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('update data'),
      //   centerTitle: true,
      // ),
      body: SafeArea(child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            MaterialButton(onPressed: (){
             update();
            },
            child: const Text('update your data', style: TextStyle(color: Colors.white),),
            color: Theme.of(context).primaryColor,
            )

          ],
        ),
      )),
    );
  }
}