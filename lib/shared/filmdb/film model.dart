class filmModel {
  late final String id;
  late final String name;
  late final String imageUrl;

  late final String director;


  filmModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.director,


  });

  filmModel.fromDB(Map<String, dynamic> db) {
    id = db['film_id'];
    name = db['name'];
    imageUrl = db['image_url'];
    director = db['director'];


  }
}
