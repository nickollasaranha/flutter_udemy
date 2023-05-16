import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/models/cart_item.dart';
import '../utils/constants.dart';
import 'cart.dart';
import 'order.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadOrders() async {
    _items.clear();

    final response =
        await http.get(Uri.parse('${Constants.orderBaseUrl}.json'));
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((orderId, orderData) {
      _items.add(Order(
        id: orderId,
        total: orderData['total'],
        products: (orderData['products'] as List<dynamic>).map((e) {
          return CartItem(
            id: e['id'],
            productId: e['productId'],
            name: e['name'],
            quantity: e['quantity'],
            price: e['price'],
          );
        }).toList(),
        date: DateTime.parse(orderData['date']),
      ));
    });
    notifyListeners();
  }

  Future<void> addOrder(Cart cart) async {
    final date = DateTime.now();
    final response = await http.post(
      Uri.parse('${Constants.orderBaseUrl}.json'),
      body: jsonEncode(
        {
          'total': cart.totalAmount,
          'date': date.toIso8601String(),
          'products': cart.items.values
              .map((cartItem) => {
                    'id': cartItem.id,
                    'productId': cartItem.productId,
                    'name': cartItem.name,
                    'quantity': cartItem.quantity,
                    'price': cartItem.price,
                  })
              .toList(),
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];

    _items.insert(
        0,
        Order(
          date: date,
          id: id,
          total: cart.totalAmount,
          products: cart.items.values.toList(),
        ));
    notifyListeners();
  }
}
