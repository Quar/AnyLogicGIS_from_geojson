Customize AnyLogicGIS Utility Generator
========

Generate Java Utility class from GeoJson Input for AnyLogic GISShape

Requires: `python >= 3.6`

### Usage

Minimalist example:

```bash
python3 ./geojson2java.py input.geojson
```

Commandline arguments:

```bash
$ python3 ./geojson2java.py -h
geojson2java.py [-h] [-o output.java] regions.geojson

Generate Java Utility class from GeoJson Input for AnyLogic GISShape

positional arguments:
  regions.geojson  path to geojson file of regions

optional arguments:
  -h, --help       show this help message and exit
  -o output.java   path of output Java file
```


### Test

```bash
make test

# Or use a customized python location
make test PY=/my/python3/path

```
