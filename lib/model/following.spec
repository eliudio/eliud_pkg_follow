{
  "id": "Following",
  "packageName": "eliud_pkg_follow",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "isDocumentCollection": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "remark": "Member response ID - Member request ID",
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
      "fieldName": "follower",
      "displayName": "The member (that wants to be) following another member",
      "fieldType": "MemberPublicInfo",
      "association": true,
      "group": "general"
    },
    {
      "fieldName": "followed",
      "displayName": "The member (that wants to be) being followed by another member",
      "fieldType": "MemberPublicInfo",
      "association": true,
      "group": "general"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "follower.name"
  },
  "depends": ["eliud_core", "eliud_pkg_membership"]
}
