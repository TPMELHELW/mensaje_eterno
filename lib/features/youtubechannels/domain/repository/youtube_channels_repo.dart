import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/youtubechannels/data/models/youtube_model.dart';

abstract class YoutubeChannelsRepo {
  Future<Either<Failure, List<YoutubeModel>>> getChannels();
}
