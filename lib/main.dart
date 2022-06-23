
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:crud_operation/operations/crud.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
);


//  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("user").get();
//  log(snapshot.toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Center(
         // child: AddData(),
        //  child: GetData(),
        // child: UpdateData(),
        // child: DeleteData(),
        child: Crud(),
        ),
  
        ),
    );
  }
}
