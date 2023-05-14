class Region {
  final int  regionId;
  final String regionName;

  Region({required this.regionId, required this.regionName});
}

final List<Region> regions = [
  Region(regionId: 0, regionName: 'Kanto'),
  Region(regionId: 1, regionName: 'Johto'),
  Region(regionId: 2, regionName: 'Hoenn'),
  Region(regionId: 3, regionName: 'Sinnoh'),
  Region(regionId: 4, regionName: 'Unova'),
  Region(regionId: 5, regionName: 'Kalos'),
  Region(regionId: 6, regionName: 'Alola'),
  Region(regionId: 7, regionName: 'Galar'),
];