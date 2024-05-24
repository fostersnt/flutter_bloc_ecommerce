class PostModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  PostModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category});

//The method below converts a json data to a posts model
  factory PostModel.fromJson(Map<String, dynamic> myJsonData) {
    return PostModel(
        id: myJsonData['id'],
        title: myJsonData['title'],
        price: myJsonData['price'],
        description: myJsonData['description'],
        image: myJsonData['image'],
        category: myJsonData['category']);
  }

//The method below converts a posts model to json data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };
  }
}

/*
HOW TO USE fromJson and toJson

void main() {
  
  // Convert JSON to object
  Map<String, dynamic> json = {
    'name': 'John',
    'age': 30,
  };

  User user = User.fromJson(json);
  print('User: ${user.name}, ${user.age}');
  
  // Convert object to JSON
  Map<String, dynamic> userJson = user.toJson();
  print('User JSON: $userJson');
}

*/
