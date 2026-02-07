import 'package:chatbot_app/modules/home/data/datasource/chat_local_ds.dart';
import 'package:chatbot_app/modules/home/data/models/massage_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatLocalDsImpl implements ChatLocalDs {
  final FirebaseFirestore firestore;
  final String uid;

  ChatLocalDsImpl(this.firestore, this.uid);

  CollectionReference get _ref =>
      firestore.collection("users").doc(uid).collection("messages");

  @override
  Future<void> saveMessage(MassageModel message) async {
    await _ref.add({
      ...message.toJson(),
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<List<MassageModel>> getHistory() async {
    final snap = await _ref.orderBy("createdAt").get();
    return snap.docs
        .map((e) => MassageModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
}
