import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gallery_app/core/api/api_urls.dart';
import 'package:gallery_app/model/image_model.dart';

class ApiServices {
   Future<ImagesModel?> fetchApi() async {
    try {
      Dio dio = Dio();
     Response response = await dio.get(ApiUrls.baseUrl,
          options:Options(headers:  {'Authorization': ApiUrls.token}));
            if (response.statusCode == 200 || response.statusCode == 201) {
          log(response.data.toString());

          final result= ImagesModel.fromJson(response.data);
          log(result.toString());
          return result;
        }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
