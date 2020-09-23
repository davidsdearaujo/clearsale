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
  Map<SocialNetworkEnum, int> get _values => const {
        SocialNetworkEnum.facebook: 1,
        SocialNetworkEnum.twitter: 2,
        SocialNetworkEnum.linkedin: 3,
        SocialNetworkEnum.google: 4,
        SocialNetworkEnum.outros: 5,
      };
  int toMap() => _values[this];
}
