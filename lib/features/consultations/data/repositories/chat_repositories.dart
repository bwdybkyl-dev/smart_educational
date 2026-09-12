import '../models/chat_models.dart';

abstract class MessageRepository {
  Future<List<MessageModel>> loadMessages(String conversationId);
  Future<MessageModel> sendMessage(MessageModel message);
  Future<void> deleteMessage(String messageId);
  Future<MessageModel> updateReactions(String messageId, List<MessageReactionModel> reactions);
}
abstract class ConsultationRepository { Future<List<ConsultationModel>> loadConsultations(); }
abstract class CallRepository { Future<List<CallModel>> loadHistory(); }
abstract class ReactionRepository { List<MessageReactionModel> toggle(String userId, List<MessageReactionModel> reactions, String emoji); }
