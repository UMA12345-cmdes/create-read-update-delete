import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class DeleteData extends StatefulWidget {
  const DeleteData({Key? key}) : super(key: key);

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
void deleteData() async {
await FirebaseFirestore.instance.collection("user").doc("LJDVtPzmQ7VD0YkUn0d2").delete();
log('your data deleted !! ');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('date your data'),
      //   centerTitle: true,
      // ),
      body: SafeArea(child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            MaterialButton(onPressed: (){
              deleteData();
            },
            child: const Text('delete',style: TextStyle(color: Colors.white),),
            color: Theme.of(context).primaryColor,
            )
          ],
        ),
      )),
    );
  }
}