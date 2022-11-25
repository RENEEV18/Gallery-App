import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:gallery_app/model/image_model.dart';
import 'package:gallery_app/services/api_services.dart';

class GetImageProvider with ChangeNotifier {


  GetImageProvider(){
    getImage();
  }
 ImagesModel? images;
  int page = 1;
  bool isLoading=false;

  void getImage()async {
    isLoading=true;
    notifyListeners();
   await ApiServices().fetchApi().then((value) {
      if (value != null) {
        images = value;
        log("added bto List${images.toString()}");
        notifyListeners();
      }else{
        log('Null');
      }
        isLoading=false;
    notifyListeners();
    });
  }

 

  loadmore() async {
    page = page + 1;
    notifyListeners();
  }
}
