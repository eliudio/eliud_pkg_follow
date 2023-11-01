/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_follow/model/follow_requests_dashboard_repository.dart';


import 'package:eliud_pkg_follow/model/repository_export.dart';
import 'package:eliud_pkg_follow/model/model_export.dart';
import 'package:eliud_pkg_follow/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class FollowRequestsDashboardFirestore implements FollowRequestsDashboardRepository {
  @override
  FollowRequestsDashboardEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return FollowRequestsDashboardEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  Future<FollowRequestsDashboardEntity> addEntity(String documentID, FollowRequestsDashboardEntity value) {
    return FollowRequestsDashboardCollection.doc(documentID).set(value.toDocument()).then((_) => value);
  }

  Future<FollowRequestsDashboardEntity> updateEntity(String documentID, FollowRequestsDashboardEntity value) {
    return FollowRequestsDashboardCollection.doc(documentID).update(value.toDocument()).then((_) => value);
  }

  Future<FollowRequestsDashboardModel> add(FollowRequestsDashboardModel value) {
    return FollowRequestsDashboardCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(FollowRequestsDashboardModel value) {
    return FollowRequestsDashboardCollection.doc(value.documentID).delete();
  }

  Future<FollowRequestsDashboardModel> update(FollowRequestsDashboardModel value) {
    return FollowRequestsDashboardCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<FollowRequestsDashboardModel?> _populateDoc(DocumentSnapshot value) async {
    return FollowRequestsDashboardModel.fromEntity(value.id, FollowRequestsDashboardEntity.fromMap(value.data()));
  }

  Future<FollowRequestsDashboardModel?> _populateDocPlus(DocumentSnapshot value) async {
    return FollowRequestsDashboardModel.fromEntityPlus(value.id, FollowRequestsDashboardEntity.fromMap(value.data()), appId: appId);  }

  Future<FollowRequestsDashboardEntity?> getEntity(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = FollowRequestsDashboardCollection.doc(id);
      var doc = await collection.get();
      return FollowRequestsDashboardEntity.fromMap(doc.data());
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving FollowRequestsDashboard with id $id");
        print("Exceptoin: $e");
      }
    }
return null;
  }

  Future<FollowRequestsDashboardModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = FollowRequestsDashboardCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving FollowRequestsDashboard with id $id");
        print("Exceptoin: $e");
      }
    }
return null;
  }

  StreamSubscription<List<FollowRequestsDashboardModel?>> listen(FollowRequestsDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<FollowRequestsDashboardModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(FollowRequestsDashboardCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDoc(doc)).toList());
    });

    return stream.listen((listOfFollowRequestsDashboardModels) {
      trigger(listOfFollowRequestsDashboardModels);
    });
  }

  StreamSubscription<List<FollowRequestsDashboardModel?>> listenWithDetails(FollowRequestsDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<FollowRequestsDashboardModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(FollowRequestsDashboardCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfFollowRequestsDashboardModels) {
      trigger(listOfFollowRequestsDashboardModels);
    });
  }

  @override
  StreamSubscription<FollowRequestsDashboardModel?> listenTo(String documentId, FollowRequestsDashboardChanged changed, {FollowRequestsDashboardErrorHandler? errorHandler}) {
    var stream = FollowRequestsDashboardCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    var theStream = stream.listen((value) {
      changed(value);
    });
    theStream.onError((theException, theStacktrace) {
      if (errorHandler != null) {
        errorHandler(theException, theStacktrace);
      }
    });
    return theStream;
  }

  Stream<List<FollowRequestsDashboardModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<FollowRequestsDashboardModel?>> _values = getQuery(FollowRequestsDashboardCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<FollowRequestsDashboardModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<FollowRequestsDashboardModel?>> _values = getQuery(FollowRequestsDashboardCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<FollowRequestsDashboardModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<FollowRequestsDashboardModel?> _values = await getQuery(FollowRequestsDashboardCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<FollowRequestsDashboardModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<FollowRequestsDashboardModel?> _values = await getQuery(FollowRequestsDashboardCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return FollowRequestsDashboardCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return FollowRequestsDashboardCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<FollowRequestsDashboardModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return FollowRequestsDashboardCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  FollowRequestsDashboardFirestore(this.getCollection, this.appId): FollowRequestsDashboardCollection = getCollection();

  final CollectionReference FollowRequestsDashboardCollection;
  final GetCollection getCollection;
}

