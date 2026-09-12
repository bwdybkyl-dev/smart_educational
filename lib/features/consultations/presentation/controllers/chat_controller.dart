import 'package:flutter/foundation.dart';

import '../../data/models/chat_models.dart';
import '../../data/repositories/chat_repositories.dart';

class ChatState {
  const ChatState({this.messages = const <MessageModel>[], this.replyTo, this.isTyping = true, this.isLoading = false});
  final List<MessageModel> messages;
  final MessageModel? replyTo;
  final bool isTyping;
  final bool isLoading;
  ChatState copyWith({List<MessageModel>? messages, MessageModel? replyTo, bool clearReply = false, bool? isTyping, bool? isLoading}) => ChatState(messages: messages ?? this.messages, replyTo: clearReply ? null : replyTo ?? this.replyTo, isTyping: isTyping ?? this.isTyping, isLoading: isLoading ?? this.isLoading);
}
class ChatController extends ChangeNotifier {
  ChatController({required this.conversationId, required this.currentUserId, required this.messages, required this.reactions});
  final String conversationId;
  final String currentUserId;
  final MessageRepository messages;
  final ReactionRepository reactions;
  ChatState state = const ChatState();
  Future<void> load() async { state = state.copyWith(isLoading: true); notifyListeners(); state = state.copyWith(messages: await messages.loadMessages(conversationId), isLoading: false); notifyListeners(); }
  void reply(MessageModel message) { state = state.copyWith(replyTo: message); notifyListeners(); }
  void clearReply() { state = state.copyWith(clearReply: true); notifyListeners(); }
  Future<void> sendText(String text) async { if (text.trim().isEmpty) return; final MessageModel message = MessageModel(id: DateTime.now().microsecondsSinceEpoch.toString(), conversationId: conversationId, senderId: currentUserId, type: MessageType.text, text: text.trim(), replyToText: state.replyTo?.text, createdAt: DateTime.now(), status: MessageStatus.sent); await messages.sendMessage(message); state = state.copyWith(messages: <MessageModel>[...state.messages, message], clearReply: true); notifyListeners(); }
  Future<void> sendAttachment(MessageType type) async { final MessageModel message = MessageModel(id: DateTime.now().microsecondsSinceEpoch.toString(), conversationId: conversationId, senderId: currentUserId, type: type, attachment: AttachmentModel(id: 'attachment', name: type == MessageType.voice ? 'رسالة صوتية' : 'ملف مرفق', type: type, sizeLabel: type == MessageType.voice ? '0:24' : '1.8 MB'), createdAt: DateTime.now(), status: MessageStatus.delivered); await messages.sendMessage(message); state = state.copyWith(messages: <MessageModel>[...state.messages, message]); notifyListeners(); }
  Future<void> react(MessageModel message, String emoji) async { final List<MessageReactionModel> updated = reactions.toggle(currentUserId, message.reactions, emoji); final MessageModel result = await messages.updateReactions(message.id, updated); state = state.copyWith(messages: state.messages.map((MessageModel item) => item.id == result.id ? result : item).toList()); notifyListeners(); }
  Future<void> delete(MessageModel message) async { await messages.deleteMessage(message.id); state = state.copyWith(messages: state.messages.where((MessageModel item) => item.id != message.id).toList()); notifyListeners(); }
}
