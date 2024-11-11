import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String date;
  final String time;
  final String description;
  final String additionalNote;
  final double minPrice;
  final double maxPrice;

  const ReviewPage({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.time,
    required this.description,
    required this.additionalNote,
    required this.minPrice,
    required this.maxPrice,
  }) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del evento
              if (widget.imageUrl.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 16),
              // Título del evento
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Fecha y hora del evento
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Text(
                    "${widget.date} - ${widget.time}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Descripción del evento
              const Text(
                "Descripción",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Nota adicional
              const Text(
                "Nota adicional",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.additionalNote,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Rango de precios
              const Text(
                "Rango de precios",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "\$${widget.minPrice.toStringAsFixed(2)} - \$${widget.maxPrice.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
