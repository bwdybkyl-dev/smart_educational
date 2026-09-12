enum MessageType { text, image, file, voice, system }
enum MessageStatus { sending, sent, delivered, read, failed }
enum ParticipantStatus { online, offline, typing }
enum ConsultationStatus { pending, accepted, active, closed, cancelled }
enum CallStatus { incoming, connecting, connected, ended, missed }

class ParticipantModel {
  const ParticipantModel({required this.id, required this.name, required this.role, required this.status, this.lastSeen = ''});
  final String id;
  final String name;
  final String role;
  final ParticipantStatus status;
  final String lastSeen;
}

class AttachmentModel {
  const AttachmentModel({required this.id, required this.name, required this.type, required this.sizeLabel});
  final String id;
  final String name;
  final MessageType type;
  final String sizeLabel;
}

class MessageReactionModel {
  const MessageReactionModel({required this.emoji, required this.userIds});
  final String emoji;
  final List<String> userIds;
}

class MessageModel {
  const MessageModel({required this.id, required this.conversationId, required this.senderId, required this.type, required this.createdAt, required this.status, this.text = '', this.replyToText, this.attachment, this.reactions = const <MessageReactionModel>[]});
  final String id;
  final String conversationId;
  final String senderId;
  final MessageType type;
  final DateTime createdAt;
  final MessageStatus status;
  final String text;
  final String? replyToText;
  final AttachmentModel? attachment;
  final List<MessageReactionModel> reactions;
  MessageModel copyWith({List<MessageReactionModel>? reactions, MessageStatus? status}) => MessageModel(id: id, conversationId: conversationId, senderId: senderId, type: type, createdAt: createdAt, status: status ?? this.status, text: text, replyToText: replyToText, attachment: attachment, reactions: reactions ?? this.reactions);
}

class ConsultationModel {
  const ConsultationModel({required this.id, required this.title, required this.status, required this.advisor, required this.student, required this.updatedAt, this.isGroup = false});
  final String id;
  final String title;
  final ConsultationStatus status;
  final ParticipantModel advisor;
  final ParticipantModel student;
  final DateTime updatedAt;
  final bool isGroup;
}

class CallModel {
  const CallModel({required this.id, required this.participant, required this.status, required this.startedAt, required this.durationLabel});
  final String id;
  final ParticipantModel participant;
  final CallStatus status;
  final DateTime startedAt;
  final String durationLabel;
}
