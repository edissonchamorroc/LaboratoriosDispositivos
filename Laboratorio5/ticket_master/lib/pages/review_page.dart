import 'package:flutter/material.dart';
import 'package:ticket_master/models/Event.dart';
import 'package:ticket_master/respository/hive_api.dart';
import 'package:ticket_master/respository/ticket_master_api.dart';

class ReviewPage extends StatefulWidget {
  final String eventId;

  const ReviewPage({Key? key, required this.eventId}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TicketMasterApi _eventsInformation = TicketMasterApi();
  final HiveApi hiveService = HiveApi();
  Event? eventDetails;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    hiveService.initializeHive();
    fetchEventDetails();
  }

  Future<void> fetchEventDetails() async {
    try {
      final data = await _eventsInformation.getEventById(widget.eventId);
      if (data['_embedded']?['events'] != null) {
        final event = data['_embedded']['events'][0];
        setState(() {
          eventDetails = Event(
            id: widget.eventId,
            name: event['name'] ?? 'Evento sin título',
            imageUrl: getImageUrl(event['images'] ?? []),
            date: event['dates']?['start']?['localDate'] ?? 'Fecha no disponible',
            description: event['info'] ?? 'Sin descripción',
            minPrice: event['priceRanges'] != null ? event['priceRanges'][0]['min'] : 'N/A',
            maxPrice: event['priceRanges'] != null ? event['priceRanges'][0]['max'] : 'N/A',
          );
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error al cargar detalles del evento: $e';
      });
    }
  }

  String getImageUrl(List<dynamic> images) {
    final image = images.firstWhere((img) => img['width'] == 305,
        orElse: () => images.isNotEmpty ? images[0] : null);
    return image != null ? image['url'] : '';
  }

  void addFavorites(Event event) async {
    await hiveService.insertEvent(event);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Evento agregado a favoritos")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventDetails?.name ?? 'Detalles del Evento'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (eventDetails?.imageUrl != null)
                          Image.network(
                            eventDetails!.imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        const SizedBox(height: 16),
                        Text(
                          eventDetails!.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Fecha: ${eventDetails!.date}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Descripción: ${eventDetails!.description}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Precio: \$${eventDetails!.minPrice} - \$${eventDetails!.maxPrice}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (eventDetails != null) {
                              addFavorites(eventDetails!);
                            }
                          },
                          child: const Text("Agregar a favoritos"),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
