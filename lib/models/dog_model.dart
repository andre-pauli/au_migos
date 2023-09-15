class DogModel {
  String? name;
  String? username;
  String? description;
  List<String>? images;

  DogModel({this.name, this.username, this.description, this.images});

  static List<DogModel> getImages = [
    DogModel(
        name: 'Rex',
        username: 'rex_doguinho',
        description: 'Dálmata com pitbull',
        images: ['assets/dog_01.png']),
    DogModel(
        name: 'Milly Cristina',
        username: 'milly_cris',
        description: 'Vira lata linda',
        images: ['assets/dog_02.png']),
    DogModel(
        name: 'Puguizinho',
        username: 'pug_zinho',
        description: 'Pub',
        images: ['assets/dog_03.png']),
    DogModel(
        name: 'Sadan',
        username: 'american_bully_sadan',
        description: 'Pra quem gosta!',
        images: ['assets/dog_04.png']),
  ];
}
