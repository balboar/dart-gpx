library gpx.test.gpx_test;

import 'dart:io';

import 'package:gpx/gpx.dart';
import 'package:test/test.dart';

void main() {
  test('compare gpx objects with empty lists', () async {
    final gpx1 = Gpx();
    final gpx2 = Gpx();

    expect(gpx1, gpx2);

    gpx1.version = '1';
    gpx2.version = '2';
    expect(gpx1, isNot(gpx2));
  });

  test('compare gpx objects with wpts', () async {
    final gpx1 = Gpx();
    final gpx2 = Gpx();

    gpx1.wpts = [];
    gpx2.wpts = [];
    expect(gpx1, gpx2);

    gpx1.wpts = [Wpt(lat: 1)];
    gpx2.wpts = [Wpt(lat: 1)];
    expect(gpx1, gpx2);

    gpx1.rtes = [
      Rte(rtepts: [Wpt(lat: 1)])
    ];
    gpx2.rtes = [
      Rte(rtepts: [Wpt(lat: 1)])
    ];
    expect(gpx1, gpx2);

    gpx1.trks = [
      Trk(trksegs: [
        Trkseg(trkpts: [Wpt(lat: 1)])
      ])
    ];
    gpx2.trks = [
      Trk(trksegs: [
        Trkseg(trkpts: [Wpt(lat: 1)])
      ])
    ];
    expect(gpx1, gpx2);

    gpx1.trks = [
      Trk(trksegs: [
        Trkseg(trkpts: [Wpt(lat: 1)])
      ])
    ];
    gpx2.trks = [
      Trk(trksegs: [
        Trkseg(trkpts: [Wpt(lat: 2)])
      ])
    ];
    expect(gpx1, isNot(gpx2));
  });

  test('compare wpt objects', () async {
    final wpt1 = Wpt();
    final wpt2 = Wpt();
    expect(wpt1, wpt2);

    wpt1.lat = 1.0;
    wpt2.lat = 1.0;
    expect(wpt1, wpt2);

    wpt1.links = [Link()];
    wpt2.links = [Link()];
    expect(wpt1, wpt2);
    expect(wpt1.toString(), wpt2.toString());

    wpt1.lat = 1.0;
    wpt2.lat = 2.0;
    expect(wpt1, isNot(wpt2));
    expect(wpt1.toString(), isNot(wpt2.toString()));
  });

  test('compare email objects', () async {
    expect(Email(), Email());
    expect(Email(id: 'mail'), Email(id: 'mail'));
    expect(Email(id: 'mail', domain: 'test.com'),
        Email(id: 'mail', domain: 'test.com'));

    expect(Email(id: 'mail', domain: 'test.com').toString(),
        Email(id: 'mail', domain: 'test.com').toString());

    expect(Email(id: 'mail', domain: 'test.com').hashCode,
        Email(id: 'mail', domain: 'test.com').hashCode);

    expect(Email(id: 'mail', domain: 'test.com'),
        isNot(equals(Email(id: 'mail1', domain: 'test.com'))));

    expect(Email(id: 'mail', domain: 'test.com'),
        isNot(equals(Email(id: 'mail', domain: 'test1.com'))));
  });

  test('compare metadata objects', () async {
    final mt1 = Metadata();
    final mt2 = Metadata();
    expect(mt1, mt2);

    mt1.copyright = Copyright(year: 1);
    mt2.copyright = Copyright(year: 1);
    expect(mt1, mt2);

    mt1.links = [Link()];
    mt2.links = [Link()];
    expect(mt1, mt2);
  });
}
