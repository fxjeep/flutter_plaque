import 'package:fplaque/providers/supabase.dart';
import 'package:fplaque/providers/supabase_models.dart';
import 'dart:convert';

class SupabasePlaqueRepo {
  Future<void> addOrUpdateContact(Contact c) async {
    if (c.id == null) {
      await SupabaseManager.client?.from('Contact').insert(c.toMap());
    } else {
      await SupabaseManager.client?.from('Contact').update(c.toMap()).eq('id', c.id!);
    }
  }

  Future<List<Contact>> searchContacts(String word) async {
    final data = await SupabaseManager.client
        ?.from('Contact')
        .select()
        .or("Name.like.%$word%, Code.like.%$word%");

    var list = List<Contact>.empty(growable: true);
    data?.forEach((item) {
      var contact =
          Contact.full(item["id"], item["Name"], item["Code"], item["LastPrint"], item["IsPrint"]);
      list.add(contact);
    });

    return list;
  }

  void addOrUpdateDetail(Detail d) {}
  void setContactToPrint(int contactId) {}
  void setDetailToPrint(int detailId) {}
  Future<void> deleteContact(String contactId) async {
    await SupabaseManager.client?.from('Contact').delete().eq('id', int.parse(contactId));
  }

  void deleteDetail(int detailId) {}
}
