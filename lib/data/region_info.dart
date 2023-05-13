class Region {
  final int  regionId;
  final String regionName;

  Region({required this.regionId, required this.regionName});
}

final List<Region> regions = [
  Region(regionId: 0, regionName: '全国'),
  Region(regionId: 1, regionName: 'カントー'),
  Region(regionId: 2, regionName: 'ジョウト'),
  Region(regionId: 3, regionName: 'ホウエン'),
  Region(regionId: 4, regionName: 'シンオウ'),
  Region(regionId: 5, regionName: 'イッシュ'),
  Region(regionId: 6, regionName: 'カロス'),
  Region(regionId: 7, regionName: 'アローラ'),
  Region(regionId: 8, regionName: 'ガラル'),
];