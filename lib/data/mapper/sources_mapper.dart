import 'package:injectable/injectable.dart';
import 'package:news_app/domain/model/domain_source.dart';
import 'package:news_app/data/model/remote_source.dart';

@Injectable()
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