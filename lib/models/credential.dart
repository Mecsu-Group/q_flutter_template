import 'package:realm/realm.dart';

// Realm: Declare a part file
part 'credential.g.dart';

// Realm: Creating a Realm object data model class
@RealmModel()
class _Item {
  @PrimaryKey()
  late int id;
  late String accessToken;
  late String refreshToken;
}

class CredentialModel {
  late Realm realm;

  CredentialModel() {
    var config = Configuration.local([Item.schema]);
    realm = Realm(config);

    var allItems = realm.all<Item>();

    if (allItems.isEmpty) {
      realm.write(() {
        realm.addAll([Item(0, 'q_flutter_template@gmail.com', '')]);
      });
    }
  }
}