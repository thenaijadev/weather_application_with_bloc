class LocationModel {
  final double lat;
  final double lon;
  LocationModel({required this.lat, required this.lon});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(lon: json["lat"], lat: json["lon"]);
  }
}
