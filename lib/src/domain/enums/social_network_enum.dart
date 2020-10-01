///Rede Social (socialNetwork)
enum SocialNetworkEnum {
  ///Facebook
  facebook,

  ///Twitter
  twitter,

  ///Linkedin
  linkedin,

  ///Google
  google,

  ///Outros
  outros,
}

extension SocialNetworkEnumExtension on SocialNetworkEnum {
  static Map<SocialNetworkEnum, int> get _values => const {
        SocialNetworkEnum.facebook: 1,
        SocialNetworkEnum.twitter: 2,
        SocialNetworkEnum.linkedin: 3,
        SocialNetworkEnum.google: 4,
        SocialNetworkEnum.outros: 5,
      };
  int toMap() => _values[this];
  static SocialNetworkEnum fromMap(int val) {
    if (val == null) return null;
    return _values.entries
        .firstWhere((e) => e.value == val, orElse: () => _values.entries.first)
        .key;
  }
}
