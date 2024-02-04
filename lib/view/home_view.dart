import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment/controller/home_controller.dart';
import 'package:internshala_assignment/view/filterScreen.dart';
import '../model/DataUser.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 253, 251, 251),
      appBar: AppBar(
         leading: Icon(Icons.menu,color: Colors.black,),
         elevation: 0,
         backgroundColor: Colors.white,
        title: const Text('Internships',style: TextStyle(color: Colors.black),),
         actions: [InkWell(
           onTap: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FilterScreen()));
           },
          child: Icon(Icons.filter_alt_outlined,color: Colors.black,size: 40,)),
          SizedBox(width: 10,)
         ],
      ),
    body: FutureBuilder<DataUser>(
        future: controller.getDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error state
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData && snapshot.data != null) {
            Map<String, InternshipsMeta>? internshipsMetaList = snapshot.data?.internshipsMeta;

            return ListView.builder(
              itemCount: internshipsMetaList!.length,
              itemBuilder: (context, index) {
                String key = internshipsMetaList.keys.elementAt(index);
                InternshipsMeta? internshipMeta = internshipsMetaList[key];
                return  Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                     height: 250,
                    //  margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           
                            Text(internshipMeta!.companyName.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                               Row(
                                 children: [
                                  Icon(Icons.location_on),
                                  
                                   Text(" "+internshipMeta!.locationNames.toString().replaceAll('[' ,  '').replaceAll(']',  '')),
                                 ],
                               ),
                            
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Row( children: [
                                  Icon(Icons.play_circle_outline_outlined),
                              Text("  "+ internshipMeta!.startDate.toString().substring(10)),

                               ],),
                             
                              Row( children: [
                                     Icon(Icons.date_range_outlined),

                                Text(" Duration:"),
                                  Text(internshipMeta!.duration.toString().substring(13)),

                              ],)

                            ],
                          ),
                                      
                                 
                           Row(
                             children: [
                               Text("Stipend:  "),
                               
                               Text( internshipMeta!.stipend!.salary.toString()),
                             ],
                           ),
                          
                          Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Text('Internship ID: ${internshipMeta.id.toString()}'),
                               Text("View Details",style: TextStyle(color: Colors.blue,fontSize: 17),),
                                SizedBox(width: 20,),
                                ElevatedButton(onPressed: (){}, child:  Text("Apply Now"))
                            ],
                          ),
                          // Add more properties as needed
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
