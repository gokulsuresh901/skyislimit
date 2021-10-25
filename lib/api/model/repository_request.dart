class RepositoryRequest {
  String? user_name;
  RepositoryRequest({required this.user_name});

  Map<String?, String?> toJson() {
    return {
      "q": this.user_name,
    };
  }
}