
class ChatUser
{
  String id;
  String name;
  String email;
  String? about; 
  String? image;
  String createdAt;
  String? lastActive;
  String? pushToken;
  bool? online;

  ChatUser
  ({
    required this.id,
    required this.name,
    required this.email,
    required this.about,
    required this.image,
    required this.createdAt,
    required this.lastActive,
    required this.pushToken,
    required this.online,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json)
  {
    return ChatUser
    (
      id: json['id'], 
      name: json['name'], 
      email: json['email'], 
      about: json['about'], 
      image: json['image'], 
      createdAt: json['created_at'], 
      lastActive: json['last_active'], 
      pushToken: json['push_token'], 
      online: json['online']
    );
  }

  Map<String, dynamic> toJson()
  {
    return 
    {
      'id' : id,
      'name' : name,
      'email' : email,
      'about' : about,
      'image' : image,
      'created_at' : createdAt,
      'last_active' : lastActive,
      'push-token' : pushToken,
      'online' : online,
    };
  }
}