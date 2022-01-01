import 'dart:convert';

import 'package:alot/model/crypto_model.dart';
import 'package:http/http.dart' as http;

class Network{

  static const String url = 'http://data.messari.io/api/v2/assets?fields=name,symbol,metrics/market_data/price_usd';


  Future<Crypto> fetchCrypto() async {
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      return Crypto.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load Crypto');
    }
  }


}