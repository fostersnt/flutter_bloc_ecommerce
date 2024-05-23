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

//The method below converts a json data to a posts model
  factory PostsModel.fromJson(Map<String, dynamic> my_Json_Data) {
    return PostsModel(
        title: my_Json_Data['title'],
        price: my_Json_Data['price'],
        description: my_Json_Data['description'],
        image: my_Json_Data['image'],
        category: my_Json_Data['category']);
  }

//The method below converts a posts model to json data
  Map<String, dynamic> toJson() {
    return {
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
