// // To parse this JSON data, do
// //
// //     final details = detailsFromJson(jsonString);

// import 'dart:convert';

// Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

// String detailsToJson(Details data) => json.encode(data.toJson());

// class Details {
//     String message;
//     String status;

//     Details({
//         required this.message,
//         required this.status,
//     });

//     factory Details.fromJson(Map<String, dynamic> json) => Details(
//         message: json["message"],
//         status: json["status"],
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "status": status,
//     };
// }
