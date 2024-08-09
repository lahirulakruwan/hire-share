import 'package:flutter/material.dart';

import 'widgets/vehicle_documents_widget.dart';

class VehicleDocumentsScreen extends StatefulWidget {
  const VehicleDocumentsScreen({super.key});

  @override
  State<VehicleDocumentsScreen> createState() => _VehicleDocumentsScreenState();
}

class _VehicleDocumentsScreenState extends State<VehicleDocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return VehicleDocumentsWidget();
  }
}