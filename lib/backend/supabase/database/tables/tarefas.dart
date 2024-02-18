import '../database.dart';

class TarefasTable extends SupabaseTable<TarefasRow> {
  @override
  String get tableName => 'tarefas';

  @override
  TarefasRow createRow(Map<String, dynamic> data) => TarefasRow(data);
}

class TarefasRow extends SupabaseDataRow {
  TarefasRow(super.data);

  @override
  SupabaseTable get table => TarefasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);
}
