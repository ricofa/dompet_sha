import 'dart:convert';

import 'package:dompet_sha/models/topup_form_model.dart';
import 'package:dompet_sha/models/transfer_form_model.dart';
import 'package:dompet_sha/services/auth_services.dart';
import 'package:dompet_sha/shared/environment.dart';
import 'package:http/http.dart' as http;

class TransactionServices {
  Future<String> topUp(TopupFormModel data) async {
    try {
      final tokken = await AuthServices().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/top_ups'),
        headers: {
          'Authorization': tokken,
        },
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TransferFormModel data) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/transfers'),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
