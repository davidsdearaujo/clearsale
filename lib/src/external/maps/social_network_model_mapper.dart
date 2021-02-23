import 'dart:convert';

import 'package:clearsale/src/domain/models/social_network_model.dart';

class SocialNetworkModelMapper {
  static Map<String, dynamic> toMap(SocialNetworkModel model) {
    if (model == null) return null;
    return {
      if (model.optInCompreConfie != null) 'optInCompreConfie': model.authenticationToken,
      if (model.typeSocialNetwork != null) 'typeSocialNetwork': model.typeSocialNetwork,
      if (model.authenticationToken != null) 'authenticationToken': model.authenticationToken,
    };
  }

  static SocialNetworkModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SocialNetworkModel(
      optInCompreConfie: map['optInCompreConfie'],
      typeSocialNetwork: map['typeSocialNetwork'],
      authenticationToken: map['authenticationToken'],
    );
  }

  static String toJson(SocialNetworkModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static SocialNetworkModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
