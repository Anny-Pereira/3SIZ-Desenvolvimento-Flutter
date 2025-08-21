import 'package:flutter/material.dart';

class GestaoPedidosScreen extends StatefulWidget {
  final String title;

  const GestaoPedidosScreen({super.key, required this.title});

  @override
  State<GestaoPedidosScreen> createState() => _GestaoPedidosScreenState();
}

class _GestaoPedidosScreenState extends State<GestaoPedidosScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gestão Pedidos"),
        ],
      )
    );
  }
}