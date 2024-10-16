import 'dart:core';

import 'package:flutter/material.dart';

enum RecordType { live, dead, ancestor, address }

abstract class PlaqueRepo {
  Future<void> addContact(Contact c);
}

class PrintableRecord {
  String lastPrintDate = "";
  bool isPrint = false;
  PrintableRecord();
  PrintableRecord.full(this.lastPrintDate, this.isPrint);
}

class Contact extends PrintableRecord {
  int? id;
  String name = "";
  String code = "";

  Contact.nameCode(this.name, this.code) : super.full("", false) {}

  Contact.full(this.id, this.name, this.code, String lastprint, bool isprint)
      : super.full(lastprint, isprint);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "Name": name,
      "Code": code,
      "LastPrint": lastPrintDate,
      "IsPrint": isPrint
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
}

class Detail extends PrintableRecord {
  int? id;
  int? contactId;
  String field1 = "";
  String field2 = "";
  String field3 = "";
  String recordType = "";
}
