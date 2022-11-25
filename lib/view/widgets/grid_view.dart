import 'package:flutter/material.dart';
import 'package:gallery_app/controller/image_provider.dart';
import 'package:gallery_app/view/image_view_screen/image_view_screen.dart';
import 'package:provider/provider.dart';

class GridviewCustom extends StatelessWidget {
  const GridviewCustom({super.key});
  
  
  @override
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<GetImageProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      data.getImage();
    });
    return Consumer<GetImageProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: value.images?.photos?.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return   ImageViewScreen(image: Image.network(value.images?.photos![index].src?.large2X?? '',fit: BoxFit.cover,));
                      },),);
                    },
                    child: Card(
                      child: Image.network(
                        value.images?.photos![index].src?.medium ?? "",
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                });
      },
    );
  }
}
