
import 'dart:convert';

userModel userFromJson(String str) => userModel.fromJson(json.decode(str));

//String userToJson(userModel data) => json.encode(data.toJson());

class userModel{
    String? uid;
    String? name;
    String? phone;
    String? email;
    String? gender;
    String? profile;
    String? location;

    userModel({
         this.uid,
         this.name,
         this.phone,
         this.email,
         this.gender,
         this.profile,
         this.location,
  
    });

    factory userModel.fromJson(Map<String, dynamic> json) => userModel(
        uid: json["uid"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        gender: json["gender"],
        profile: json["profile"],
        location: json["location"],
    );

    /*Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "phone": phone,
        "email": email,
        "gender": gender,
        "profile": profile,
        "location": location,
        "membership": membership,
        "table_bookings": List<dynamic>.from(tableBookings.map((x) => x)),
        "total_booking": totalBooking,
        "reward_points": rewardPoints,
        "liked_restos": List<dynamic>.from(likedRestos.map((x) => x)),
        "transactions": List<dynamic>.from(transactions.map((x) => x)),
    };*/
}
