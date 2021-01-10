class FollowerHelper {
  static String getKey(String followerId, String followedId) {
    return followedId + '-' + followerId;
  }
}