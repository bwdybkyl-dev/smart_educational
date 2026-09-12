import 'package:flutter/material.dart';
class DateSeparator extends StatelessWidget { const DateSeparator({super.key, required this.label}); final String label; @override Widget build(BuildContext context) => Center(child: Chip(label: Text(label))); }
