import 'package:flutter/material.dart';
import 'package:gallery_app/services/api_services.dart';




class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key, required this.image});
  final Image image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Image',style: TextStyle(color: Colors.white,),),
        actions: [
          IconButton(onPressed: (){
            ApiServices().saveImage();
          },
           icon:const Icon( Icons.save,),),
        ],
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Center(child: image),
      ),),
    );
  }
}