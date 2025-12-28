class StadiumModel {
  const StadiumModel({
    this.id,
    required this.name,
    required this.governorate,
    required this.city,
    required this.coverImage,
    required this.rating,
    this.description,
    this.ownerName,
    this.images,
    this.address,
    this.lat,
    this.lng,
    this.pricePerHour,
    this.workingDays,
    this.openTime,
    this.closeTime,
  });

  final String? id;

  final String name;

  final String governorate;
  final String city;

  final String coverImage;
  final double rating;

  final String? description;
  final String? ownerName;

  final List<String>? images;

  final String? address;

  final double? lat;
  final double? lng;

  final num? pricePerHour;

  final List<int>? workingDays;

  final String? openTime;
  final String? closeTime;

  String get location => '$governorate – $city';

  StadiumModel copyWith({
    String? id,
    String? name,
    String? governorate,
    String? city,
    String? imageUrl,
    double? rating,
    String? description,
    String? ownerName,
    List<String>? images,
    String? address,
    double? lat,
    double? lng,
    num? pricePerHour,
    List<int>? workingDays,
    String? openTime,
    String? closeTime,
  }) {
    return StadiumModel(
      id: id ?? this.id,
      name: name ?? this.name,
      governorate: governorate ?? this.governorate,
      city: city ?? this.city,
      coverImage: imageUrl ?? this.coverImage,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      ownerName: ownerName ?? this.ownerName,
      images: images ?? this.images,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      pricePerHour: pricePerHour ?? this.pricePerHour,
      workingDays: workingDays ?? this.workingDays,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
    );
  }
}
