class PersonListApi {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final Origin? origin;
  final Location? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  PersonListApi({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  PersonListApi.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      status = json['status'] as String?,
      species = json['species'] as String?,
      type = json['type'] as String?,
      gender = json['gender'] as String?,
      origin = (json['origin'] as Map<String,dynamic>?) != null ? Origin.fromJson(json['origin'] as Map<String,dynamic>) : null,
      location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null,
      image = json['image'] as String?,
      episode = (json['episode'] as List?)?.map((dynamic e) => e as String).toList(),
      url = json['url'] as String?,
      created = json['created'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'status' : status,
    'species' : species,
    'type' : type,
    'gender' : gender,
    'origin' : origin?.toJson(),
    'location' : location?.toJson(),
    'image' : image,
    'episode' : episode,
    'url' : url,
    'created' : created
  };
}

class Origin {
  final String? name;
  final String? url;

  Origin({
    this.name,
    this.url,
  });

  Origin.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String?,
      url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'url' : url
  };
}

class Location {
  final String? name;
  final String? url;

  Location({
    this.name,
    this.url,
  });

  Location.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String?,
      url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'url' : url
  };
}