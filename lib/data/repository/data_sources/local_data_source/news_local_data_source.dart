import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';
import '../../../model/remote_source.dart';  // تعديل المسار هنا

abstract class NewsLocalDataSource {
  Future<List<RemoteSource>?> loadSources(String categoryName);
  Future<void> saveSources(String category, List<RemoteSource> sources);
}

@Injectable(as: NewsLocalDataSource)
class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  static const String boxName = 'news_box';

  @override
  Future<List<RemoteSource>?> loadSources(String categoryName) async {
    try {
      final box = await Hive.openBox(boxName);
      final data = box.get('sources_$categoryName');

      if (data != null) {
        if (data is String) {
          final List<dynamic> jsonList = json.decode(data);
          return jsonList.map((json) => RemoteSource.fromJson(json)).toList();
        }
        return data as List<RemoteSource>?;
      }
      return null;
    } catch (e) {
      print('Error loading sources from local: $e');
      return null;
    }
  }

  @override
  Future<void> saveSources(String category, List<RemoteSource> sources) async {
    try {
      final box = await Hive.openBox(boxName);
      final jsonString = json.encode(sources.map((s) => s.toJson()).toList());
      await box.put('sources_$category', jsonString);
    } catch (e) {
      print('Error saving sources to local: $e');
    }
  }
}

// Hive Adapter for RemoteSource
class SourceAdapter extends TypeAdapter<RemoteSource> {
  @override
  final int typeId = 0;

  @override
  RemoteSource read(BinaryReader reader) {
    return RemoteSource(
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
  void write(BinaryWriter writer, RemoteSource obj) {
    writer.writeString(obj.id ?? '');
    writer.writeString(obj.name ?? '');
    writer.writeString(obj.description ?? '');
    writer.writeString(obj.url ?? '');
    writer.writeString(obj.category ?? '');
    writer.writeString(obj.language ?? '');
    writer.writeString(obj.country ?? '');
  }
}