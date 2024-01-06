part of 'credential.dart';

class Item extends _Item with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Item(
    int id,
    String name,
    String refreshToken,
    ) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Item>({
        'accessToken': '',
        'refreshToken': '',
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'accessToken', name);
    RealmObjectBase.set(this, 'refreshToken', refreshToken);
  }

  Item._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'accessToken') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'accessToken', value);

  @override
  String get refreshToken => RealmObjectBase.get<String>(this, 'refreshToken') as String;
  @override
  set refreshToken(String value) => RealmObjectBase.set(this, 'refreshToken', value);

  @override
  Stream<RealmObjectChanges<Item>> get changes =>
      RealmObjectBase.getChanges<Item>(this);

  @override
  Item freeze() => RealmObjectBase.freezeObject<Item>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Item._);
    return const SchemaObject(ObjectType.realmObject, Item, 'Item', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('accessToken', RealmPropertyType.string),
      SchemaProperty('refreshToken', RealmPropertyType.string),
    ]);
  }
}