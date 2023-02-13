import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageScreen extends StatelessWidget {
  final image_url;
    ImageScreen({super.key, this.image_url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
        backgroundColor: Colors.black,
      ),
     // D:\task_app\task_app\assets\images\placeholder.jpg
      body: SafeArea(
        child: Column(
          children: [
            
             
            Center(
              child: FadeInImage(
                image: NetworkImage(this.image_url),
                placeholder: AssetImage("assets/images/placeholder.jpg"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/placeholer.jpg");
                },
                ),
            ),
          ],
        )
      
     // Image.network(this.image_url)
      ),
    );
  }
}