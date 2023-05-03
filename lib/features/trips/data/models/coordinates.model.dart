class CoordinatesModel {
  final double latitude;
  final double longitude;

  CoordinatesModel(this.latitude, this.longitude);

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
