import 'package:flutter/material.dart';
import 'package:hire_share/widgets/document_summary_widget.dart';

class DocumentSummaryScreen extends StatefulWidget {
  const DocumentSummaryScreen({super.key});

  @override
  State<DocumentSummaryScreen> createState() => _DocumentSummaryScreenState();
}

class _DocumentSummaryScreenState extends State<DocumentSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return const DocumentSummaryWidget();
  }
}