import 'package:flutter/material.dart';
import '../../data/models/chat_models.dart';
class MessageReactionsWidget extends StatelessWidget { const MessageReactionsWidget({super.key, required this.reactions}); final List<MessageReactionModel> reactions; @override Widget build(BuildContext context) => Wrap(spacing: 4, children: reactions.map((MessageReactionModel reaction) => Chip(visualDensity: VisualDensity.compact, label: Text('${reaction.emoji} ${reaction.userIds.length}'))).toList()); }
