abstract class IAnimal {
  final String name;
  final String latinName;
  final String aninmalType;
  final String activeTime;
  final String habitat;
  final String diet;
  final String geoRange;
  final String lengthMin;
  final String lengthMax;
  final String weightMin;
  final String weightMax;
  final String lifespan;
  final int id;
  final Uri imageLink;

  IAnimal(
      this.name,
      this.latinName,
      this.aninmalType,
      this.activeTime,
      this.habitat,
      this.diet,
      this.geoRange,
      this.lengthMin,
      this.lengthMax,
      this.weightMin,
      this.weightMax,
      this.lifespan,
      this.id,
      this.imageLink);
}
