{version}: let
  versionHashes = {
    "9.9" = {
      portable = "cf5bdfba24b683968c406ee516dac65debbe2e69";
      openbsd = "65b0882149d7c1a22208b0415b9ece507d8f9522";
    };
    "9.8" = {
      portable = "15554f28842d7d9e6cc31eab5f95e36053b42f35";
      openbsd = "027566b8e6827a9e280a0ef067464fc2336f0179";
    };
    "9.7" = {
      portable = "f2739829894cfab2711593e41a41dc79410f2d4b";
      openbsd = "d3b84557015cbdbc96a15c23884bc78346d3eb40";
    };
    "9.6" = {
      portable = "5f446a23b2df68b821fdba4310399465e8e0247c";
      openbsd = "d246553b8e3fcc8b9a82c289fe3f56a68570a353";
    };
    "9.5" = {
      portable = "36abf5dbc510ef98e5139f776806b723d3bcc705";
      openbsd = "1554c95de36d9b1fe74790a7db1a6b3f071eb6ff";
    };
    "9.4" = {
      portable = "98954f463a60c1aa1f9c0c0de83370558ba452c7";
      openbsd = "5170815c3471eed15ee869ac41ac2a10623a848a";
    };
    "9.3" = {
      portable = "12c58dcd8f61d18567fda0689ba64cb4b8c70a2d";
      openbsd = "37160d03007ab5c4ac577f3e1f04d8447811c41f";
    };
    "9.2" = {
      portable = "6d8627a9ef5606f4df11534e3b88fa52b3004bb1";
      openbsd = "3758dd3a04fdc42cd7c1aa4fcb6355ce1b828a35";
    };
    "9.1" = {
      portable = "a8aadf11866008666e17c65da76132659942fe2c";
      openbsd = "076b08ef64fdca1624b943c777ae09cd3e3f84d4";
    };
    "9.0" = {
      portable = "47fb45fd13e402a21b51c794a76511a526b5d556";
      openbsd = "82a8ebe0be15c8467421432a269bb0ccb14a9a64";
    };
    "8.9" = {
      portable = "70efa83594d4589521814fa782e1e453caf97697";
      openbsd = "4932043c63602ea49f547d1a0918e498432bde96";
    };
    "8.8" = {
      portable = "6453604c2c565a67853ac09758c7d7332f98cb0c";
      openbsd = "057c939514f111947154148c3f12ac8a5dc73dae";
    };
    "8.7" = {
      portable = "b55270c7f1b7a876a887edffb479ac413dd36c3d";
      openbsd = "f421d8a9b65856ccb1c979290ed8f4d91d0ac169";
    };
    "8.6" = {
      portable = "aa554ab91add82bb68de00d323e02c9d20621aee";
      openbsd = "21d3748110a503f00205781a2c7f523a9fb073c5";
    };
    "8.5" = {
      portable = "07a27ac52359837077743dbc5171ab2893dcc44d";
      openbsd = "6c8a37af0e529c0f16dd667c0d7cbdfa465223a7";
    };
    "8.4" = {
      portable = "678f9acc0f6e8d96e65daeed891caf277cbc4633";
      openbsd = "70f19891bb176202088c267851e83571cfa40b06";
    };
  };
  versionSet =
    if builtins.hasAttr version versionHashes
    then builtins.getAttr version versionHashes
    else throw "${version} is not valid RPKI version (minimum version: 8.4)";
in  "--override-input rpki-client-src github:rpki-client/rpki-client-portable/${versionSet.portable} --override-input rpki-openbsd-src github:rpki-client/rpki-client-openbsd/${versionSet.openbsd}"
