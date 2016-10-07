CREATE OR REPLACE VIEW water_z0 AS (
    SELECT geom FROM ne_110m_ocean
    UNION ALL
    SELECT geom FROM ne_110m_lakes
);

CREATE OR REPLACE VIEW water_z1 AS (
    SELECT geom FROM ne_110m_ocean
    UNION ALL
    SELECT geom FROM ne_110m_lakes
);

CREATE OR REPLACE VIEW water_z2 AS (
    SELECT geom FROM ne_50m_ocean
    UNION ALL
    SELECT geom FROM ne_110m_lakes
);

CREATE OR REPLACE VIEW water_z3 AS (
    SELECT geom FROM ne_50m_ocean
    UNION ALL
    SELECT geom FROM ne_110m_lakes
    UNION ALL
    SELECT geom FROM ne_110m_rivers_lake_centerlines
    WHERE featurecla = 'River'
);

CREATE OR REPLACE VIEW water_z4 AS (
    SELECT geom FROM ne_50m_ocean
    UNION ALL
    SELECT geom FROM ne_50m_lakes
    UNION ALL
    SELECT geom FROM ne_50m_rivers_lake_centerlines
    WHERE featurecla = 'River'
);

CREATE OR REPLACE VIEW water_z5 AS (
    SELECT geom FROM ne_10m_ocean
    UNION ALL
    SELECT geom FROM ne_10m_lakes
    UNION ALL
    SELECT geom FROM ne_50m_rivers_lake_centerlines
    WHERE featurecla = 'River'
);

CREATE OR REPLACE VIEW water_z6 AS (
    SELECT geom FROM ne_10m_ocean
    UNION ALL
    SELECT geom FROM ne_10m_lakes
    UNION ALL
    SELECT geom FROM ne_10m_rivers_lake_centerlines
    WHERE featurecla = 'River'
);

CREATE OR REPLACE VIEW water_z8 AS (
    SELECT way AS geom FROM water_areas
    WHERE way_area > 1000000
	UNION ALL
	SELECT way AS geom FROM waterways
	WHERE waterway IN ('river') AND ST_Length(way) > 10000
);

CREATE OR REPLACE VIEW water_z9 AS (
    SELECT way AS geom FROM water_areas
    WHERE way_area > 500000
	UNION ALL
	SELECT way AS geom FROM waterways
	WHERE waterway IN ('river') AND ST_Length(way) > 5000
);

CREATE OR REPLACE VIEW water_z11 AS (
    SELECT way AS geom FROM water_areas
    WHERE way_area > 50000
	UNION ALL
	SELECT way AS geom FROM waterways
	WHERE waterway IN ('river')
);

CREATE OR REPLACE VIEW water_z12 AS (
    SELECT way AS geom FROM water_areas
    WHERE way_area > 40000
	UNION ALL
	SELECT way AS geom FROM waterways
	WHERE waterway IN ('river', 'canal', 'stream')
);

CREATE OR REPLACE VIEW water_z13 AS (
    SELECT way AS geom FROM water_areas
    WHERE way_area > 2000
	UNION ALL
	SELECT way AS geom FROM waterways
	WHERE waterway IN ('river', 'canal', 'stream', 'drain', 'ditch')
);

CREATE OR REPLACE VIEW water_z14 AS (
    SELECT way AS geom FROM water_areas
	UNION ALL
	SELECT way AS geom FROM waterways
);
