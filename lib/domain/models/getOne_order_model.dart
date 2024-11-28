import 'dart:convert';

GetOneOrderModel getOneOrderModelFromJson(String str) =>
    GetOneOrderModel.fromJson(json.decode(str));

String getOneOrderModelToJson(GetOneOrderModel data) =>
    json.encode(data.toJson());

class GetOneOrderModel {
  String? message;
  GetOneOrderData? data;
  int? status;
  bool? isSuccess;

  GetOneOrderModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneOrderModel.fromJson(Map<String, dynamic> json) =>
      GetOneOrderModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : GetOneOrderData.fromJson(json["Data"]),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data?.toJson(),
        "Status": status,
        "IsSuccess": isSuccess,
      };
}

class GetOneOrderData {
  String? id;
  String? user;
  List<GetOneOrderProduct>? products;
  String? mainDescription;
  int? totalQuantity;
  int? remainingTotalQuantity;
  int? totalBags;
  String? orderTracking;
  int? createTimestamp;
  DateTime? createdAt;
  List<dynamic>? bags;

  GetOneOrderData({
    this.id,
    this.user,
    this.products,
    this.mainDescription,
    this.totalQuantity,
    this.remainingTotalQuantity,
    this.totalBags,
    this.orderTracking,
    this.createTimestamp,
    this.createdAt,
    this.bags,
  });

  factory GetOneOrderData.fromJson(Map<String, dynamic> json) =>
      GetOneOrderData(
        id: json["_id"],
        user: json["user"],
        products: json["products"] == null
            ? []
            : List<GetOneOrderProduct>.from(
                json["products"]!.map((x) => GetOneOrderProduct.fromJson(x))),
        mainDescription: json["main_description"],
        totalQuantity: json["totalQuantity"],
        remainingTotalQuantity: json["remainingTotalQuantity"],
        totalBags: json["totalBags"],
        orderTracking: json["order_tracking"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        bags: json["bags"] == null
            ? []
            : List<dynamic>.from(json["bags"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "main_description": mainDescription,
        "totalQuantity": totalQuantity,
        "remainingTotalQuantity": remainingTotalQuantity,
        "totalBags": totalBags,
        "order_tracking": orderTracking,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
        "bags": bags == null ? [] : List<dynamic>.from(bags!.map((x) => x)),
      };
}

class GetOneOrderProduct {
  String? categoryId;
  String? categoryName;
  String? productId;
  String? productName;
  String? productImage;
  String? productWeight;
  int? quantity;
  int? remainingQuantity;
  String? description;

  GetOneOrderProduct({
    this.categoryId,
    this.categoryName,
    this.productId,
    this.productName,
    this.productImage,
    this.productWeight,
    this.quantity,
    this.remainingQuantity,
    this.description,
  });

  factory GetOneOrderProduct.fromJson(Map<String, dynamic> json) =>
      GetOneOrderProduct(
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        productId: json["productId"],
        productName: json["productName"],
        productImage: json["productImage"],
        productWeight: json["productWeight"],
        quantity: json["quantity"],
        remainingQuantity: json["remaining_quantity"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "productId": productId,
        "productName": productName,
        "productImage": productImage,
        "productWeight": productWeight,
        "quantity": quantity,
        "remaining_quantity": remainingQuantity,
        "description": description,
      };
}
