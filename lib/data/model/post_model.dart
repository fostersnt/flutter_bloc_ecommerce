class PostModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  PostModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

//The method below converts a json data to a posts model
  factory PostModel.fromJson(Map<String, dynamic> myJsonData) {
    return PostModel(
      id: myJsonData['id'],
      userId: myJsonData['userId'],
      title: myJsonData['title'],
      body: myJsonData['body'],
    );
  }

//The method below converts a posts model to json data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
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
