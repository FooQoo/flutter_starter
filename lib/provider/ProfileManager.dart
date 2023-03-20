import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:flutter_starter/repository/LineUserRepository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProfileProvider = FutureProvider<UserProfile>((ref) async {
  return await lineUserRepository.getProfile();
});
