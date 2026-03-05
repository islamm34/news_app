import 'package:hive_flutter/adapters.dart';
import '../../../model/source.dart'; // استيراد Source مش RemoteSource

// abstract class
abstract class NewsLocalDataSource {
  Future<List<Source>?> loadSources(String categoryName);
  Future<void> saveSources(String category, List<Source> sources);
}

// implementation class
class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  static const String boxName = 'newsBox';

  @override
  Future<List<Source>?> loadSources(String categoryName) async {
    var box = await Hive.openBox<List<Source>>(boxName);
    return box.get('sources_$categoryName');
  }

  @override
  Future<void> saveSources(String category, List<Source> sources) async {
    var box = await Hive.openBox<List<Source>>(boxName);
    await box.put('sources_$category', sources);
  }
}

// SourceAdapter
class SourceAdapter extends TypeAdapter<Source> {
  @override
  final int typeId = 0;

  @override
  Source read(BinaryReader reader) {
    return Source(
      id: reader.readString(),
      name: reader.readString(),
      description: reader.readString(),
      url: reader.readString(),
      category: reader.readString(),
      language: reader.readString(),
      country: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Source obj) {
    writer.writeString(obj.id ?? '');
    writer.writeString(obj.name ?? '');
    writer.writeString(obj.description ?? '');
    writer.writeString(obj.url ?? '');
    writer.writeString(obj.category ?? '');
    writer.writeString(obj.language ?? '');
    writer.writeString(obj.country ?? '');
  }
}