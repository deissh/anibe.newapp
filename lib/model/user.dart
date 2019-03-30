
class User {
  String id;
  bool online;
  String name;
  String picture;
  String role;
  List<Badges> badges;

  User(
      {this.id, this.online, this.name, this.picture, this.role, this.badges});

  @override
  int get hashCode =>
    id.hashCode
    ^ name.hashCode
    ^ picture.hashCode
    ^ role.hashCode
    ^ badges.hashCode;

  @override
  String toString() {
    return 'AnibeCurrentUser{id: $id, name: $name, picture: $picture, role: $role, badges: $badges}';
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    online = json['online'];
    name = json['name'];
    picture = json['picture'];
    role = json['role'];
    if (json['badges'] != null) {
      badges = new List<Badges>();
      json['badges'].forEach((v) {
        badges.add(new Badges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['online'] = this.online;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['role'] = this.role;
    if (this.badges != null) {
      data['badges'] = this.badges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Badges {
  String name;
  String icon;

  Badges({this.name, this.icon});

  Badges.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}