import 'package:injectable/injectable.dart';
import '../../../domain/model/domain_source.dart';
import '../../../data/model/remote_source.dart';

@injectable
class SourcesMapper {
  // تحويل RemoteSource لـ Source
  Source toSource(RemoteSource remoteSource) {
    return Source(
      id: remoteSource.id ?? '',
      name: remoteSource.name ?? '',
    );
  }

  List<Source> toSources(List<RemoteSource> remoteSources) {
    return remoteSources.map((source) => toSource(source)).toList();
  }
}