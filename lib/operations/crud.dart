import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  const Crud({Key? key}) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
 TextEditingController namecontroller=TextEditingController();
TextEditingController emailcontroller=TextEditingController();
TextEditingController agecontroller=TextEditingController();

// FirebaseFirestore reference = FirebaseFirestore.instance.reference.child('user');

void saveUser() async{
 FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String name=namecontroller.text.trim();
  String email=emailcontroller.text.trim();
  String ageString=agecontroller.text.trim();
 int age=int.parse(ageString);
         namecontroller.clear();
         emailcontroller.clear();
         agecontroller.clear();
        if(name != "" || email != ""){

  // all input data are store
 Map<String, dynamic> userData = {
              'name': name,
              'email': email,
              'age': age,
               };
      _firestore.collection("user").add(userData);
      log("User created!");
    }
    else{ 
      log("Please fill all the fields!");
    }}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Screen'),
      //   centerTitle: true,
      // ),
    body: SafeArea(child: Padding(padding: const EdgeInsets.all(15.0),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 1300, maxWidth: 1400, minHeight: 600, minWidth: 500),
        child: Center(child: Column(
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
    const SizedBox(height: 30,),
    
                  MaterialButton(onPressed: (){
                    saveUser();
                  },
                  child: const Text('submit', style: TextStyle(color: Colors.white),),
                  color: Theme.of(context).primaryColor,
                  ),
                   const SizedBox(height: 30,),


              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("user").snapshots(),
                builder: (context, snapshot) {

                  if(snapshot.connectionState == ConnectionState.active) {
                    if(snapshot.hasData && snapshot.data != null) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {

                            Map<String, dynamic> userMap = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                            return ListTile(
                             
                              title: Text(userMap["name"] + " (${userMap["age"]})"),
                              subtitle: Text(userMap["email"]),
                              trailing:  Wrap(
                                children: <Widget>[
                                  IconButton(
                                        onPressed: () {
                                          FirebaseFirestore.instance.collection(
                                            "user").doc("documentId").delete();
                                          log('your data deleted !! ');
                                        },
                                        icon: const Icon(Icons.delete,color: Colors.blue,),
                                        ),
                                        IconButton(onPressed: (){},
                                         icon: Icon(Icons.edit,color: Colors.blue,)),
                                ],
                              ),
                                  
                                
                            );
                            // Icon(Icons.edit,color: Colors.black,);

                          },
                        ),
                      );
                    }
                    else {
                      return const Text("No data!");
                    }
                  }
                  else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                },
              ),
                        
                    ],
                
            ),
          ),
      ),
      ),
      ),
    
    );
  }
}


