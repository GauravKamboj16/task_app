import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_app/Network/NetworkUtil.dart';
import 'package:task_app/view/ImageScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading=false;
  NetworkUtil networkUtil=NetworkUtil();

 Future<dynamic> getImage() async{
  var res=await networkUtil.getImage();
   
   if(res!=null){
    var result=jsonDecode(res.body);
    var url=result["message"];
    print(url);
    setState(() {
      isLoading=false;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return ImageScreen(image_url: url,);
    }));

   }else{
    print("Error");
   }

 }

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/vector.png",
            height:screenHeight/4 ,
            width: double.infinity,),
            Center(child: Text("Load your Image",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),)),
            SizedBox(height: 20,),
            isLoading==true? Center(child: CircularProgressIndicator(),):SizedBox(height:22),
            Center(
              child: GestureDetector(
                onTap: () {
                  
                  setState(() {
                    isLoading=true;
                     getImage();
                    
                  });
                 
                },
                child: Container(
                  width: 200,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(26)
                  ),
                  child: Center(child: Text('Fetch',style: TextStyle(color: Colors.white,fontSize: 16),)),
                ),
              ),
            )
          ],
        )),
    );
  }
}