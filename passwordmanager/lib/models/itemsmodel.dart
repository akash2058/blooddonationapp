// ignore_for_file: public_member_api_docs, sort_constructors_first
class ItemModel {
  String type;
  String socialmedianame;
  String username;
  String password;
  String link;
  ItemModel({
    required this.type,
    required this.socialmedianame,
    required this.username,
    required this.password,
    required this.link,
  });
  tojson() {
    return {
      "Type": type,
      "Socialmedia": socialmedianame,
      "Username": username,
      "password": password,
      "Link": link
    };
  }
}
