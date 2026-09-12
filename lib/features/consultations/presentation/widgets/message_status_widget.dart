import 'package:flutter/material.dart';
import '../../data/models/chat_models.dart';
class MessageStatusWidget extends StatelessWidget { const MessageStatusWidget({super.key, required this.status}); final MessageStatus status; @override Widget build(BuildContext context) { final IconData icon = status == MessageStatus.read ? Icons.done_all : status == MessageStatus.failed ? Icons.error_outline : Icons.done; return Icon(icon, size: 16, color: status == MessageStatus.read ? Colors.blue : Colors.grey); } }
