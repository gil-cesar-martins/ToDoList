import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://hczbgevrpbvggbbqnxiw.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhjemJnZXZycGJ2Z2diYnFueGl3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDgyMTEwNzgsImV4cCI6MjAyMzc4NzA3OH0.MEFxqFzdRF0eUUjipJNquWKz9Ncs4g3ofhclCDhca0E';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
