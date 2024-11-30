import 'package:flutix_movie/core/resources/data_state.dart';
import 'package:flutix_movie/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteSource {
  Future<DataState<UserModel>> createNewUser(
      {required String email, required String password, required String name});
}

class SupabaseDataSource extends AuthRemoteSource {
  final SupabaseClient _supabaseClient;

  SupabaseDataSource(SupabaseClient supabaseClient)
      : _supabaseClient = supabaseClient;

  @override
  Future<DataState<UserModel>> createNewUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final AuthResponse res = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'display_name': name},
      );

      final User? user = res.user;

      if (user == null) {
        throw Exception("failed to get user from supabase");
      }

      return DataSuccess(UserModel.fromJson(user.toJson()));
    } catch (e) {
      return DataFailed(Exception(e));
    }
  }
}
