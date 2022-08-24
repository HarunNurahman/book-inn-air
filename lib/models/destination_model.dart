import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final String about;
  final double rating;
  final int price;
  final List<dynamic> interest;

  DestinationModel({
    required this.id,
    this.name = '',
    this.location = '',
    this.about = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.price = 0,
    this.interest = const [],
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        location: json['location'],
        imageUrl: json['imageUrl'],
        about: json['about'],
        rating: json['rating'].toDouble(),
        price: json['price'],
        interest: json['interest'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
        'imageUrl': imageUrl,
        'rating': rating,
        'price': price,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        imageUrl,
        rating,
        price,
        interest,
      ];
}
