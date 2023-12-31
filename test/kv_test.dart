import 'package:kv/kv.dart';
import 'package:test/test.dart';

void main() {
  group('Test for memory kv.', () {
    var memoryKV = KV();

    setUp(() {
      memoryKV.set("key", "new value");
    });

    test('First Test', () {
      expect(memoryKV.get("key"), "new value");
    });
  });

  group('Test for file kv', () {
    var fileKV = KV(FileStorage("example/file_storage.json"));
    var fileKVCopy = KV(FileStorage("example/file_storage_copy.json"));

    setUp(() {
      var value = fileKV.get("key");
      if (value == null) {
        fileKV.set("key", "new file");
      }
      fileKVCopy.clear();
    });

    test('Copy Get Test', () {
      expect(fileKVCopy.get("key"), isNull);
    });

    test('Get Test', () {
      expect(fileKV.get("key"), "new file");
    });

    test('Remove Test', () {
      fileKV.remove("key");
      expect(fileKV.get("key"), isNull);
    });
  });
}
