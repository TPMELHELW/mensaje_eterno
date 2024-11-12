import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/core/helpers/get_failure_from_exception.dart';
import 'package:mensaje_eterno/features/youtubechannels/data/data_sources/youtube_channels_local_data_source.dart';
import 'package:mensaje_eterno/features/youtubechannels/data/models/youtube_model.dart';
import 'package:mensaje_eterno/features/youtubechannels/domain/repository/youtube_channels_repo.dart';
import 'package:logger/logger.dart';

class YoutubeChannelsRepoImpl implements YoutubeChannelsRepo {
  final YoutubeChannelsModelLocalDataSource youtubeChannelsModelLocalDataSource;

  const YoutubeChannelsRepoImpl({
    required this.youtubeChannelsModelLocalDataSource,
  });

  @override
  Future<Either<Failure, List<YoutubeModel>>> getChannels() async {
    try {
      Get.find<Logger>().i("Start `getChannels` in |YoutubeChannelsRepoImpl|");
      var channels =
          await youtubeChannelsModelLocalDataSource.getYoutubeChannels();
      Get.find<Logger>().w(
          "End `getChannels` in |YoutubeChannelsRepoImpl| ${channels.length}");
      return Right(channels);
    } catch (e) {
      return Left(getFailureFromException(e));
    }
  }
}
