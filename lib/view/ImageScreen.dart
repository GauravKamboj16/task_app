import 'package:flutter/material.dart';
 

class ImageScreen extends StatelessWidget {
  final image_url;
    const ImageScreen({super.key, this.image_url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
        backgroundColor: Colors.black,
      ),
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