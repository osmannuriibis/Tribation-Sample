/* import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ots/enums/e_collection.dart';
import 'package:ots/models/base_model/okullar_model/model_under_okullar/yorum_model.dart';
import 'package:ots/models/base_model/users_model/user_info_model.dart';
import 'package:ots/services/firebase_ref_service.dart';
import 'package:ots/services/model_services/etkinlik_service.dart';

class EtkinlikCardVM extends ChangeNotifier {
  EtkinlikService etkinlikService;

  bool _isCommenting = false;

  bool _isOpenComments = false;

  List<YorumModel> _listComment = [];

  StreamSubscription<List<YorumModel>>? listenComments;

  Type serviceType;

  List<YorumModel> get listComment {
    _listComment.sort((y, e) => (e.zaman ?? Timestamp.now()).compareTo(y.zaman ?? Timestamp.now()));
    return _listComment;
  }

  set listComment(List<YorumModel> listComment) {
    _listComment = listComment;

    notifyListeners();
  }

  bool get isOpenComments => _isOpenComments;

  set isOpenComments(bool isOpenComments) {
    _isOpenComments = isOpenComments;
    notifyListeners();
  }

  bool get isCommenting => _isCommenting;

  var controllerYorum = TextEditingController();

  InputBorder get border => const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  set isCommenting(bool isCommenting) {
    _isCommenting = isCommenting;
    notifyListeners();
  }

  EtkinlikCardVM({required this.etkinlikService, required this.serviceType}) {
    init();
  }

  void init() {
    setComments();
  }

  void setComments() {
    listenComments = etkinlikService.getCommentsAsStream.listen((event) {
      listComment = event;
    });
  }

  @override
  void dispose() {
    if (listenComments != null) listenComments!.cancel();
    super.dispose();
  }

  void addYorum(UserInfoModel userInfo) {
    var yorum = YorumModel(
        id: getFirebaseRandomId,
        kimdenId: userInfo.id,
        kimdenPhotoURL: userInfo.photoURL,
        kimdenDisplayName: userInfo.displayName,
        text: controllerYorum.text,
        zaman: Timestamp.now());
    etkinlikService.addYorum(yorum);

    controllerYorum.clear();
    listComment.add(yorum);
    notifyListeners();
  }

  void setLike(String userId, bool isLiked) {
    etkinlikService.setLike(userId, isLiked);
  }

  deleteYorum(YorumModel yorum) {
    return etkinlikService.reference.collection(E_ColName.yorumlar.name).doc(yorum.id).delete();
  }

  yorumUygunsuzBildir(YorumModel yorum) {
  return  etkinlikService.reference
        .collection(E_ColName.yorumlar.name)
        .doc(yorum.id)
        .update({'uygunsuzSayisi': FieldValue.increment(1)});
  }
}
 */