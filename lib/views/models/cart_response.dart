// To parse this JSON data, do
//
//     final cartResponse = cartResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CartResponse> cartResponseFromJson(String str) => List<CartResponse>.from(json.decode(str).map((x) => CartResponse.fromJson(x)));

String cartResponseToJson(List<CartResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartResponse {
    final String id;
    final String userId;
    final ProductId productId;
    final List<Additive> additives;
    final int totalPrice;
    final int quantity;
    final DateTime createdAt;
    final DateTime updatedAt;

    CartResponse({
        required this.id,
        required this.userId,
        required this.productId,
        required this.additives,
        required this.totalPrice,
        required this.quantity,
        required this.createdAt,
        required this.updatedAt,
    });

    factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        id: json["_id"],
        userId: json["userId"],
        productId: ProductId.fromJson(json["productId"]),
        additives: List<Additive>.from(json["additives"].map((x) => Additive.fromJson(x))),
        totalPrice: json["totalPrice"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "productId": productId.toJson(),
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "quantity": quantity,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Additive {
    final String foodTitle;
    final int foodCount;
    final int foodPrice;
    final List<SelectedItem> selectedItems;

    Additive({
        required this.foodTitle,
        required this.foodCount,
        required this.foodPrice,
        required this.selectedItems,
    });

    factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        foodTitle: json["foodTitle"],
        foodCount: json["foodCount"],
        foodPrice: json["foodPrice"],
        selectedItems: List<SelectedItem>.from(json["selectedItems"].map((x) => SelectedItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foodTitle": foodTitle,
        "foodCount": foodCount,
        "foodPrice": foodPrice,
        "selectedItems": List<dynamic>.from(selectedItems.map((x) => x.toJson())),
    };
}

class SelectedItem {
    final List<Item> item;

    SelectedItem({
        required this.item,
    });

    factory SelectedItem.fromJson(Map<String, dynamic> json) => SelectedItem(
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
    };
}

class Item {
    final String itemTitle;
    final int itemCount;
    final int itemPrice;

    Item({
        required this.itemTitle,
        required this.itemCount,
        required this.itemPrice,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemTitle: json["itemTitle"],
        itemCount: json["itemCount"],
        itemPrice: json["itemPrice"],
    );

    Map<String, dynamic> toJson() => {
        "itemTitle": itemTitle,
        "itemCount": itemCount,
        "itemPrice": itemPrice,
    };
}

class ProductId {
    final String id;
    final String title;
    final String restaurant;
    final double rating;
    final String ratingCount;
    final List<String> imageUrl;

    ProductId({
        required this.id,
        required this.title,
        required this.restaurant,
        required this.rating,
        required this.ratingCount,
        required this.imageUrl,
    });

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        title: json["title"],
        restaurant: json["restaurant"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "restaurant": restaurant,
        "rating": rating,
        "ratingCount": ratingCount,
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
    };
}
