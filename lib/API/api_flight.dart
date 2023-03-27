import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Model/fligth.dart';
import '../Model/offer.dart';

Future<http.Response> fetchVuelos() {
  return http.get(Uri.parse('https://flights-delta.vercel.app/vuelos'));
}

Future<http.Response> fetchOffer() {
  return http.get(Uri.parse('https://flights-delta.vercel.app/vuelos/ofertas'));
}

class FlightApi {
  Future<List<Fligth>> fetchVuelos() async {
    final response =
        await http.get(Uri.parse('https://flights-delta.vercel.app/vuelos'));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);

      return List.generate(decode.length, (i) {
        return Fligth(
            id: decode[i]['id'],
            img: decode[i]['img'],
            name: decode[i]['name'],
            price: decode[i]['price'],
            date: decode[i]['date'],
            tag: decode[i]['tag'],
            country: decode[i]['country']);
      });
    } else {
      throw Exception('Error al cargar vuelos');
    }
  }
}

class OfferApi {
  Future<List<Offer>> fetchOffer() async {
    final response = await http
        .get(Uri.parse('https://flights-delta.vercel.app/vuelos/ofertas'));
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);

      return List.generate(decode.length, (i) {
        return Offer(
            id: decode[i]['id'],
            img: decode[i]['img'],
            name: decode[i]['name'],
            price: decode[i]['price'],
            date: decode[i]['date'],
            tag: decode[i]['tag'],
            country: decode[i]['country']);
      });
    } else {
      throw Exception('Error al cargar ofertas');
    }
  }
}
