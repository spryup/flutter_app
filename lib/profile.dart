class User {
  UserDetails userDetails;

  User({this.userDetails});

  User.fromJson(Map<String, dynamic> json) {
    userDetails = json['userDetails'] != null
        ? new UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails.toJson();
    }
    return data;
  }
}

class UserDetails {
  String userId;
  String firstName;
  String lastName;
  String location;
  String image;
  String description;
  List<String> interests;

  UserDetails(
      {this.userId,
        this.firstName,
        this.lastName,
        this.location,
        this.image,
        this.description,
        this.interests});

  UserDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    location = json['location'];
    image = json['image'];
    description = json['description'];
    interests = json['Interests'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['location'] = this.location;
    data['image'] = this.image;
    data['description'] = this.description;
    data['Interests'] = this.interests;
    return data;
  }
}