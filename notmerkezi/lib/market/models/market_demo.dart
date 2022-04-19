class MarketDemo {
  String? shipAddress;
  String? shipCity;
  String? shipCountry;
  String? shipName;
  String? shipRegion;
  String? shipPostalCode;
  String? customerID;
  String? customerName;
  String? address;
  String? city;
  String? region;
  String? postalCode;
  String? country;
  String? salesperson;
  int? orderID;
  String? orderDate;
  String? shipperName;
  int? productID;
  String? productName;
  double? unitPrice;
  int? quantity;
  bool? discontinued;
  double? extendedPrice;
  double? freight;

  MarketDemo(
      {this.shipAddress,
        this.shipCity,
        this.shipCountry,
        this.shipName,
        this.shipRegion,
        this.shipPostalCode,
        this.customerID,
        this.customerName,
        this.address,
        this.city,
        this.region,
        this.postalCode,
        this.country,
        this.salesperson,
        this.orderID,
        this.orderDate,
        this.shipperName,
        this.productID,
        this.productName,
        this.unitPrice,
        this.quantity,
        this.discontinued,
        this.extendedPrice,
        this.freight});

  MarketDemo.fromJson(Map<String, dynamic> json) {
    shipAddress = json['ShipAddress'];
    shipCity = json['ShipCity'];
    shipCountry = json['ShipCountry'];
    shipName = json['ShipName'];
    shipRegion = json['ShipRegion'];
    shipPostalCode = json['ShipPostalCode'];
    customerID = json['CustomerID'];
    customerName = json['CustomerName'];
    address = json['Address'];
    city = json['City'];
    region = json['Region'];
    postalCode = json['PostalCode'];
    country = json['Country'];
    salesperson = json['Salesperson'];
    orderID = json['OrderID'];
    orderDate = json['OrderDate'];
    shipperName = json['ShipperName'];
    productID = json['ProductID'];
    productName = json['ProductName'];
    unitPrice = json['UnitPrice'];
    quantity = json['Quantity'];
    discontinued = json['Discontinued'];
    extendedPrice = json['ExtendedPrice'];
    freight = json['Freight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ShipAddress'] = this.shipAddress;
    data['ShipCity'] = this.shipCity;
    data['ShipCountry'] = this.shipCountry;
    data['ShipName'] = this.shipName;
    data['ShipRegion'] = this.shipRegion;
    data['ShipPostalCode'] = this.shipPostalCode;
    data['CustomerID'] = this.customerID;
    data['CustomerName'] = this.customerName;
    data['Address'] = this.address;
    data['City'] = this.city;
    data['Region'] = this.region;
    data['PostalCode'] = this.postalCode;
    data['Country'] = this.country;
    data['Salesperson'] = this.salesperson;
    data['OrderID'] = this.orderID;
    data['OrderDate'] = this.orderDate;
    data['ShipperName'] = this.shipperName;
    data['ProductID'] = this.productID;
    data['ProductName'] = this.productName;
    data['UnitPrice'] = this.unitPrice;
    data['Quantity'] = this.quantity;
    data['Discontinued'] = this.discontinued;
    data['ExtendedPrice'] = this.extendedPrice;
    data['Freight'] = this.freight;
    return data;
  }
}