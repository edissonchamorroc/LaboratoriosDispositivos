import 'dart:convert';
import 'package:http/http.dart' as http;

class TicketMasterApi {
  static const String apiKey = '0cNktYr35YGpGFEArHcQMYXG1wlLTh0E';
  static const String baseUrl = 'https://app.ticketmaster.com/discovery/v2/events.json';

  Future<Map<String, dynamic>> getAllEvents() async {
    final url = Uri.parse('$baseUrl?apikey=$apiKey');
    return await _fetchData(url);
  }

  Future<Map<String, dynamic>> searchEventsByKeyword(String keyword) async {
    final url = Uri.parse('$baseUrl?apikey=$apiKey&keyword=$keyword');
    return await _fetchData(url);
  }

  Future<Map<String, dynamic>> searchMusicEvents() async {
    final url = Uri.parse('$baseUrl?classificationName=music&apikey=$apiKey');
    return await _fetchData(url);
  }

  Future<Map<String, dynamic>> getEventsForArtistInCanada(String attractionId) async {
    final url = Uri.parse('$baseUrl?attractionId=$attractionId&countryCode=CA&apikey=$apiKey');
    return await _fetchData(url);
  }

  Future<Map<String, dynamic>> _fetchData(Uri url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load events');
    }
  }
  Future<Map<String, dynamic>> getEventById(String id) async {
    final url = Uri.parse('$baseUrl?apikey=$apiKey&id=$id');
    return await _fetchData(url);
  }
}
