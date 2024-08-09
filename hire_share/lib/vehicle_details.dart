import 'package:flutter/material.dart';
import 'package:hire_share/widgets/vehicle_details_widget.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return VehicleDetailsWidget();
  }
}