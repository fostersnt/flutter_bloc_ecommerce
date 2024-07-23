// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostsModel {
  final int title;
  final int price;
  final String description;
  final String image;
  final String category;

  PostsModel(
      {required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      title: map['title'],
      price: map['price'],
      description: map['description'],
      image: map['image'],
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsModel.fromJson(String source) =>
      PostsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
