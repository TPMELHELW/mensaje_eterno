import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:mensaje_eterno/features/telegram_channels/domain/repository/telegram_channels_repo.dart';

class GetTelegramChannelsUseCase {
  final TelegramChannelsRepo telegramChannelsRepo;

  GetTelegramChannelsUseCase(this.telegramChannelsRepo);

  Future<Either<Failure, TelegramChannels>> call() async {
    return await telegramChannelsRepo.getChannels();
  }
}
