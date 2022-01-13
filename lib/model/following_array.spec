{
  "id": "FollowingArray",
  "remark": "This entity is a copy of following.spec which is maintained by functions upon updating follow/spec. Should we consider to not have follow.spec and do everything with an array?",
  "packageName": "eliud_pkg_follow",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": false,
    "generateCache": false,
	"hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "documentID",
      "remark": "Member ID",
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "displayName": "App Identifier",
      "remark": "This is the identifier of the app to which this belongs",
      "fieldType": "String",
      "group": "general",
      "hidden": true
    },
    {
      "fieldName": "followers",
      "displayName": "The member that are following this member with memberID = documentId",
      "fieldType": "String",
      "group": "general",
      "arrayType": "Array",
      "hidden": true
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
  ],
  "depends": ["eliud_core"]
}
