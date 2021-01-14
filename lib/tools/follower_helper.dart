class FollowerHelper {
  static String getKey(String followedId, String followerId) {
    return followedId + '-' + followerId;
  }
}