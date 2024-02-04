 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class  FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  TextEditingController profileController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 251, 251),
      appBar: AppBar(
         backgroundColor: Colors.white,
          elevation: 0,
         
         centerTitle: true,
        title:const  Text('Filter ',style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Padding(
          padding:const  EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
             
            children: [
              const  Text(
                'Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: profileController,
                decoration:  const InputDecoration(
                  hintText: 'Enter your profile',
                  border: OutlineInputBorder(),
                ),
              ),
             const  SizedBox(height: 20),
             const   Text(
                'City',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: cityController,
                decoration: const  InputDecoration(
                  hintText: 'Enter your city',
                  border: OutlineInputBorder(),
                ),
              ),
             const  SizedBox(height: 20),
              const  Text(
                'Duration',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: durationController,
                decoration: const  InputDecoration(
                  hintText: 'Enter duration',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                   Navigator.pop(context);
                 
                },
                child:const  Text('Apply'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}