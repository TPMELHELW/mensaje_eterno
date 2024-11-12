import 'package:get/get.dart';
import 'package:mensaje_eterno/features/youtubechannels/data/data_sources/youtube_channels_local_data_source.dart';
import 'package:mensaje_eterno/features/youtubechannels/data/repository/youtube_channels_repo_impl.dart';
import 'package:mensaje_eterno/features/youtubechannels/domain/repository/youtube_channels_repo.dart';

class YoutubeChannelsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<YoutubeChannelsModelLocalDataSource>(
      YoutubeChannelsModelLocalDataSourceImpl(),
    );

    Get.put<YoutubeChannelsRepo>(
      YoutubeChannelsRepoImpl(youtubeChannelsModelLocalDataSource: Get.find()),
    );

    Get.put(YoutubeChannelsBindings());
  }
}
