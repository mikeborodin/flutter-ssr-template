import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';
import 'package:store_app/env.dart';

final layoutsServiceProvider =
    Provider<LayoutsService>((ref) => CloudflareAppLayoutsService());

abstract class LayoutsService {
  Future<AppLayouts> getAppLayouts();
}

class CloudflareAppLayoutsService implements LayoutsService {
  @override
  Future<AppLayouts> getAppLayouts() async {
    final response = await Dio().get(
      baseURL.replace(path: 'layout').toString(),
    );

    final encoded = AppLayouts.fromJson(
      jsonDecode(
        response.data,
      ),
    );
    return encoded;
  }
}
