import '../models/chat_models.dart';
import 'chat_repositories.dart';

class MockMessageRepository implements MessageRepository {
  MockMessageRepository(this._messages);
  final List<MessageModel> _messages;
  @override Future<void> deleteMessage(String messageId) async => _messages.removeWhere((MessageModel item) => item.id == messageId);
  @override Future<List<MessageModel>> loadMessages(String conversationId) async => List<MessageModel>.from(_messages.where((MessageModel item) => item.conversationId == conversationId));
  @override Future<MessageModel> sendMessage(MessageModel message) async { _messages.add(message); return message; }
  @override Future<MessageModel> updateReactions(String messageId, List<MessageReactionModel> reactions) async { final int index = _messages.indexWhere((MessageModel item) => item.id == messageId); final MessageModel updated = _messages[index].copyWith(reactions: reactions); _messages[index] = updated; return updated; }
}
class MockConsultationRepository implements ConsultationRepository { MockConsultationRepository(this.items); final List<ConsultationModel> items; @override Future<List<ConsultationModel>> loadConsultations() async => List<ConsultationModel>.from(items); }
class MockCallRepository implements CallRepository { MockCallRepository(this.items); final List<CallModel> items; @override Future<List<CallModel>> loadHistory() async => List<CallModel>.from(items); }
class MockReactionRepository implements ReactionRepository { @override List<MessageReactionModel> toggle(String userId, List<MessageReactionModel> reactions, String emoji) { final List<MessageReactionModel> result = List<MessageReactionModel>.from(reactions); final int index = result.indexWhere((MessageReactionModel item) => item.emoji == emoji); if (index == -1) return <MessageReactionModel>[...result, MessageReactionModel(emoji: emoji, userIds: <String>[userId])]; final List<String> users = List<String>.from(result[index].userIds); users.contains(userId) ? users.remove(userId) : users.add(userId); if (users.isEmpty) { result.removeAt(index); } else { result[index] = MessageReactionModel(emoji: emoji, userIds: users); } return result; } }
