import 'package:dartz/dartz.dart';
import 'package:mensaje_eterno/core/errors/failures.dart';
import 'package:mensaje_eterno/features/telegram_channels/data/models/telegram_channels_model.dart';

abstract class TelegramChannelsRepo {
  Future<Either<Failure, TelegramChannels>> getChannels();
}
