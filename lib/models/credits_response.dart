import 'dart:convert';

class CreditsResponse {
  CreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory CreditsResponse.fromRawJson(String str) =>
      CreditsResponse.fromJson(json.decode(str));

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
      CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int? castId;
  String? character;
  String creditId;
  int? order;
  String? department;
  String? job;

  get fullProfilePath {
    return profilePath != null
        ? 'https://image.tmdb.org/t/p/w500/$profilePath'
        : 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Cast.fromRawJson(String str) => Cast.fromJson(json.decode(str));

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
      );
}
