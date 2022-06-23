import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
TextEditingController namecontroller=TextEditingController();
TextEditingController emailcontroller=TextEditingController();
TextEditingController agecontroller=TextEditingController();

void saveUser() async{
 FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String name=namecontroller.text.trim();
  String email=emailcontroller.text.trim();
  String ageString=agecontroller.text.trim();
 

 int age=int.parse(ageString);
         namecontroller.clear();
         emailcontroller.clear();
         agecontroller.clear();


          // single input data store in firebase

          // Map<String, dynamic> userData = {
          //   "name": "hema malini",
          //   "email": "hema@gmail.com",
          //   "age": 43,
          // };
          //    // add data only
          // await _firestore.collection("user").add(userData);
          // //add and set document id 
          // await _firestore.collection("usersss").doc("your-id-here").set(userData);
             
          

        if(name != "" || email != ""){

  // all input data are store
 Map<String, dynamic> userData = {
              'name': name,
              'email': email,
              'age': age,
               };
      FirebaseFirestore.instance.collection("user").add(userData);
      log("User created!");
    }
    else{ 
      log("Please fill all the fields!");
    }}
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  
                ),
              ),
              TextField(
controller: emailcontroller,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  
                ),
              ),
              TextField(
                controller: agecontroller,
                decoration: const InputDecoration(
                  hintText: 'Age',
                  
                ),
              ),
const SizedBox(height: 20,),

              MaterialButton(onPressed: (){
                saveUser();
              },
              child: const Text('add', style: TextStyle(color: Colors.white),),
              color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      )),
    );
  }
}