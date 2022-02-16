class Post {
  int? userId;
  String name;
  String status;
  String species;
  String image;
  String gender;
  Origin? origin;
  Location? location;
  List<Episode>? episode;

  Post({
    required this.userId,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.gender,
    this.origin,
    this.location,
    this.episode,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      image: json['image'],
      gender: json['gender'],
      origin: Origin.fromJson(json["origin"]),
      location: Location.fromJson(json["location"]),
    );
  }
}

class Origin {
  String? name;
  String? url;

  Origin({
    this.name,
    this.url,
  });

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Location {
  String? name;
  String? url;

  Location({
    this.name,
    this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Episode {
  String? name;

  Episode({
    this.name,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      name: json[''],
    );
  }
}
