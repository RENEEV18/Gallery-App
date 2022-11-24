class ImagesModel {
    ImagesModel({
         this.photos,
    });

    List<Photo>? photos;

    factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        photos:(json["photos"]as List).map((e) => Photo.fromJson(e)).toList(),
    );

 
}

class Photo {
    Photo({
         this.src,
    });

    Src? src;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        src: Src.fromJson(json["src"]),
    );

}

class Src {
    Src({
         this.original,
         this.large2X,
         this.large,
         this.medium,
         this.small,
         this.portrait,
         this.landscape,
         this.tiny,
    });

    String? original;
    String? large2X;
    String? large;
    String? medium;
    String? small;
    String? portrait;
    String? landscape;
    String? tiny;

    factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
    );


}
