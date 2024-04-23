// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  int tableNumber;
  List<Menu> menu;
  String dateCreated;
  String dineInOut;

  OrderModel({
    required this.tableNumber,
    required this.menu,
    required this.dateCreated,
    required this.dineInOut,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        tableNumber: json["table_number"],
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
        dineInOut: json["dine_in_out"],
        dateCreated: json["date_created"],
      );

  Map<String, dynamic> toJson() => {
        "table_number": tableNumber,
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
        "dine_in_out": dineInOut,
        "date_created": dateCreated,
      };
}

class Menu {
  String name;
  int price;
  int quantity;
  dynamic notes;

  Menu({
    required this.name,
    required this.price,
    required this.quantity,
    required this.notes,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "quantity": quantity,
        "notes": notes,
      };
}
