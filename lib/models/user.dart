import 'package:flutter/material.dart';

import 'package:realm/realm.dart';

// Realm: Declare a part file
part 'user.g.dart';

// Realm: Creating a Realm object data model class
@RealmModel()
class _Item {
  @PrimaryKey()
  late int id;

  late String name;

  late String refreshToken;
}

class CatalogModel {
  late Realm realm;

  CatalogModel() {
    var config = Configuration.local([Item.schema]);
    realm = Realm(config);

    var allItems = realm.all<Item>();

    if (allItems.isEmpty) {
      realm.write(() {
        realm.addAll([Item(0, 'q_flutter_template@gmail.com', '')]);
      });
    }
  }

  /// Get item by [id].
  Item getById(int id) {
    final objId = id % 14;

    final item = realm.find<Item>(objId)!;
    return item;
  }

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}
