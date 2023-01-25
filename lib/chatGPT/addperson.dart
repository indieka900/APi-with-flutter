// ignore_for_file: public_member_api_docs, sort_constructors_first

class PersonInsert {
  var username;
  var bio;
  PersonInsert({
    required this.username,
    required this.bio,
  });

  Map<String, dynamic> toJson() {
    return {'username': username, 'bio': bio};
  }
}
