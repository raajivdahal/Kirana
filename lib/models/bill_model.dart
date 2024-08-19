import 'dart:convert';
import 'package:flutter/material.dart';

class Bill {
  final String name, id, type;

  Bill({
    required this.name,
    required this.id,
    required this.type,
  });
  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(name: json["name"], id: json["id"], type: json["type"]);
  }
}
