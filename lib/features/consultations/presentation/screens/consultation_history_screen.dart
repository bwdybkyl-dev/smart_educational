import 'package:flutter/material.dart';
import '../../../../data/mock/mock_data.dart';
class ConsultationHistoryScreen extends StatelessWidget { const ConsultationHistoryScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('سجل الاستشارات')), body: ListView(padding: const EdgeInsets.all(20), children: MockData.consultations.map((item) => Card(child: ListTile(title: Text(item.title), subtitle: Text('المستشار: ${item.advisor.name}'), trailing: const Text('4.8 ★')))).toList())); }
