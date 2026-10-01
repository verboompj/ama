# Copernicus Sentinel Data and Layers for Agricultural Monitoring

## 1. Purpose

This document introduces the Copernicus Sentinel missions and the data layers that are
relevant to Case Study 47. It is a data reference, not an implementation workflow.
The concrete crop-analysis workflow is documented separately in
[`agricultural-analysis-use-case.md`](./agricultural-analysis-use-case.md).

The key distinction is:

- **Sentinel observations** provide repeat measurements of what can be seen from
  space.
- **Copernicus derived products** provide harmonised land, climate, elevation, and
  thematic context.
- **National administrative data**, especially LPIS parcel geometry and IACS claims,
  determines which legal parcel and declaration are being assessed.

Satellite imagery can support a finding, but it does not by itself establish legal
ownership, the official parcel boundary, or final CAP eligibility.

## 2. Sentinel Mission Overview

| Mission | Sensor and principal data | Typical use | Relevance to this project |
|---|---|---|---|
| Sentinel-1 | C-band Synthetic Aperture Radar (SAR) | All-weather land and surface-change monitoring | **Core**: crop time series, mowing/ploughing signals, moisture and structure, cloud-independent observations |
| Sentinel-2 | Multispectral optical imagery | Vegetation, land cover, water, soil, crop condition | **Core**: crop type, vegetation indices, bare soil, harvest and activity evidence |
| Sentinel-3 | Medium-resolution ocean and land instruments | Land/ocean temperature, colour, large-area vegetation | Supporting: national or regional environmental context; generally too coarse for individual CAP parcels |
| Sentinel-4 | Geostationary atmospheric composition | European air-quality monitoring | Low direct relevance to parcel verification |
| Sentinel-5 | Polar-orbiting atmospheric composition | Global air-quality and atmospheric monitoring | Low direct relevance to parcel verification |
| Sentinel-5P | Atmospheric composition precursor | Trace gases, aerosols, air quality | Low direct relevance; possible environmental research context |
| Sentinel-6 | Radar altimetry | Sea-surface height and oceanography | Not relevant to crop or agricultural-parcel verification |

For the proposed Area Monitoring System, the practical remote-sensing foundation is
therefore **Sentinel-1 plus Sentinel-2**. The other missions should not be included in
the operational pipeline merely because they are available.

## 3. Sentinel-1: Radar Data

### What Sentinel-1 measures

Sentinel-1 is an active radar mission: it sends microwave energy toward the Earth and
measures the returned signal. It works during day or night and through cloud cover,
which makes it valuable when optical observations are unavailable.

The return signal is affected by:

- plant structure and biomass;
- surface roughness;
- soil and vegetation moisture;
- field orientation relative to the radar;
- incidence angle;
- agricultural activity such as ploughing, mowing, or harvest.

Radar values are not equivalent to a photograph. They require radiometric calibration,
terrain correction, speckle handling, and careful time-series interpretation.

### Recommended Sentinel-1 product

Use **Sentinel-1 Level-1 Ground Range Detected (GRD), Interferometric Wide Swath (IW),
dual polarisation VV+VH** as the default operational input.

| Layer or feature | Meaning | Agricultural value |
|---|---|---|
| VV backscatter | Vertical transmit, vertical receive | Surface structure, moisture, crop development |
| VH backscatter | Vertical transmit, horizontal receive | Volume scattering from vegetation structure |
| VV/VH or VH/VV ratio | Relationship between polarisations | Reduces some common variation and tracks crop development |
| Radar Vegetation Index (RVI) | Derived radar vegetation indicator | Supporting vegetation-growth feature |
| Temporal difference | Change between acquisitions | Detects abrupt activity or field-state changes |
| Local incidence angle | Observation geometry | Required to interpret and normalise radar response |
| Data mask | Valid/invalid observation area | Prevents processing outside valid coverage |

### Sentinel-1 processing considerations

- Calibrate raw digital values to a physically meaningful backscatter representation,
  normally sigma nought or gamma nought.
- Apply terrain correction using a suitable DEM.
- Use the same orbit direction and relative orbit where possible when comparing dates.
- Do not interpret a single bright or dark radar observation as a crop type.
- Preserve acquisition geometry, orbit, processing version, and preprocessing lineage.
- Prefer multi-temporal filtering or parcel statistics over aggressive per-pixel
  smoothing that could remove narrow-field information.

### Where Sentinel-1 helps most

- Optical scenes are obscured by cloud.
- Crop classes have similar colour but different structure or growth timing.
- The system must detect mowing, harvest, ploughing, flooding, or surface change.
- A claim needs a denser time series than Sentinel-2 alone can provide.

## 4. Sentinel-2: Multispectral Optical Data

### Recommended product level

Use **Sentinel-2 Level-2A surface reflectance**. Level-2A is atmospherically corrected
and includes classification/mask information needed to remove cloud, shadow, and
invalid observations.

Level-1C top-of-atmosphere reflectance is useful when a specialist processing chain
requires it, but it should not be the default for crop classification when consistent
Level-2A data is available.

### Sentinel-2 spectral bands

| Band | Name | Native resolution | Primary value |
|---|---|---:|---|
| B01 | Coastal aerosol | 60 m | Atmospheric processing; little direct parcel value |
| B02 | Blue | 10 m | Visible colour, water/soil/vegetation separation |
| B03 | Green | 10 m | Visible colour and vegetation response |
| B04 | Red | 10 m | Chlorophyll absorption; NDVI/EVI input |
| B05 | Red edge 1 | 20 m | Chlorophyll and crop-type sensitivity |
| B06 | Red edge 2 | 20 m | Vegetation state and crop discrimination |
| B07 | Red edge 3 | 20 m | Vegetation state and crop discrimination |
| B08 | Near infrared (NIR) | 10 m | Biomass and vegetation indices |
| B8A | Narrow NIR | 20 m | Red-edge indices and vegetation analysis |
| B09 | Water vapour | 60 m | Atmospheric processing |
| B10 | Cirrus | 60 m in L1C | Cirrus detection; not a standard L2A surface band |
| B11 | Short-wave infrared 1 | 20 m | Vegetation/soil moisture and residue |
| B12 | Short-wave infrared 2 | 20 m | Moisture, soil, residue, fire/burn sensitivity |

For crop classification, retain the **10 m and 20 m analytical bands** rather than
using only an RGB rendering.

### Sentinel-2 quality and mask layers

| Layer | Purpose | Required handling |
|---|---|---|
| Scene Classification Layer (SCL) | Labels cloud, cloud shadow, vegetation, soil, water, snow, and other scene classes | Mask unusable observations; review known classification limitations |
| Cloud probability | Probability that a pixel is cloud affected | Apply a threshold and test sensitivity |
| Snow probability | Probability that a pixel is snow affected | Exclude or treat separately |
| Aerosol Optical Thickness (AOT) | Atmospheric aerosol estimate | Quality/diagnostic input |
| Water Vapour (WVP) | Atmospheric water-vapour estimate | Quality/diagnostic input |
| Data mask | Valid data footprint | Exclude missing or invalid areas |

Tile-level cloud percentage is only a search hint. A tile can report substantial cloud
while a specific parcel is clear, or report low cloud while a small parcel is obscured.
Cloud and shadow must be assessed at parcel/pixel level.

### Useful Sentinel-2 derived indices

| Index | Simplified formula | What it indicates |
|---|---|---|
| NDVI | `(B08 - B04) / (B08 + B04)` | General vegetation greenness and development |
| EVI | Uses B08, B04, and B02 | Vegetation signal with reduced saturation/atmospheric effects |
| NDRE | `(B8A - B05) / (B8A + B05)` | Chlorophyll and crop-state differences using red edge |
| NDMI | `(B08 - B11) / (B08 + B11)` | Vegetation moisture response |
| NDWI | Common variants use green/NIR or NIR/SWIR | Surface water or vegetation-water response; formula must be named |
| BSI | Combination of blue, red, NIR, and SWIR | Bare soil indication |

An index is a feature, not a crop label. Crop type normally emerges from the **shape
and timing of several features across a season**.

## 5. Sentinel-3 Through Sentinel-6

### Sentinel-3

Sentinel-3 provides broad land and ocean observations, including land-surface
temperature and large-area vegetation information. Its resolution is useful for
regional drought, heat, and environmental context but is generally too coarse to
determine the condition of individual agricultural parcels.

Use Sentinel-3 only for contextual products where its scale matches the question.

### Sentinel-4, Sentinel-5, and Sentinel-5P

These missions focus on atmospheric composition and air quality. They can support
environmental or climate research but do not materially improve routine crop-type or
parcel-area assessment.

### Sentinel-6

Sentinel-6 is an ocean-altimetry mission. It should not form part of this agricultural
verification architecture.

## 6. Copernicus Land Monitoring Service Layers

The Copernicus Land Monitoring Service (CLMS) provides derived European products that
can accelerate prototyping and provide context.

| Dataset | Typical scale/cadence | Project use | Limitation |
|---|---|---|---|
| High Resolution Layer Croplands | 10 m, annual products | Prior/reference for crop type, cropping pattern, seasonality | Not the authoritative current-year Hungarian claim record |
| Crop Types | 10 m, yearly | Benchmark, weak label, national comparison, model feature | Product taxonomy may not match CAP scheme taxonomy |
| Cropping Patterns | 10 m, yearly | Emergence, harvest, bare-soil period, crop duration | Derived product with its own uncertainty |
| High Resolution Layer Grasslands | 10 m, annual products | Grassland extent and status | Must not replace current parcel evidence |
| Grassland mowing layers | Product-dependent | Supporting evidence for mowing activity | Validate event timing and local accuracy |
| CORINE Land Cover | Pan-European, coarser and multi-year | Broad land-cover context and obvious anomaly checks | Too coarse and infrequent for parcel eligibility |
| Copernicus DEM | 10 m/30 m depending entitlement/coverage | Terrain correction, slope/aspect, erosion context | Elevation is not a crop observation |

CLMS layers are valuable as priors, contextual features, and independent comparison
datasets. They should not silently become the legal source of parcel boundaries or
farmer declarations.

## 7. Copernicus Climate Data

### ERA5-Land

ERA5-Land provides hourly land-surface reanalysis from 1950 onward at approximately
9 km resolution. Relevant variables include:

- precipitation;
- 2 m air temperature;
- soil temperature;
- volumetric soil water;
- evaporation;
- snow;
- wind and radiation variables.

### Agrometeorological indicators

Copernicus provides daily agriculture-oriented indicators derived from reanalysis.
These can help explain unusual phenology, drought, delayed planting, heat stress, or
conditions that cause an optical/radar time series to differ from historical patterns.

Climate products are contextual. Their grid cells are much larger than a CAP parcel
and should not be presented as a direct observation of one field.

## 8. Administrative Data Required Alongside Copernicus

The following inputs are not Copernicus products but are required for the CAP use case:

| Data | Why required |
|---|---|
| LPIS parcel geometry | Defines the authoritative agricultural parcel and supports official area calculation |
| IACS claim/declaration | States the crop, activity, scheme, applicant, and claim year being verified |
| Scheme and eligibility rules | Defines what must be observed and which evidence is legally sufficient |
| Historical validated claims | Supplies labels for crop models and evaluation |
| Inspection outcomes | Provides ground truth and failure analysis |
| Farmer geo-tagged evidence | Resolves conditions that satellite data cannot observe confidently |
| Regional crop calendar | Helps interpret phenology and select analysis windows |

The project must keep the distinction between **observation**, **inference**,
**declaration**, and **legal decision** explicit.

## 9. Data Access Options

| Access method | Best use |
|---|---|
| Copernicus Browser | Manual exploration, visual inspection, selecting sample dates |
| CDSE STAC API | Programmatic scene discovery and metadata search |
| CDSE OData/S3 download | Native product and band download |
| Sentinel Hub Process API | On-demand image/index rendering for a parcel or map |
| Sentinel Hub Statistical API | Parcel-level statistics and time-series extraction |
| Sentinel Hub Batch API | Large national processing jobs |
| openEO | Cloud-native time-series processing and reproducible analysis graphs |
| Sen4CAP | Established CAP-oriented processing workflows and algorithms |
| SNAP | Specialist desktop/batch processing for Sentinel products |

### Recommended pattern for this project

1. Use **STAC** to discover acquisitions and preserve metadata.
2. Use **openEO, Sentinel Hub Batch, or a controlled raster pipeline** for national
   time-series processing.
3. Store selected derived parcel features and evidence snapshots, not uncontrolled
   copies of every source product.
4. Preserve source product identifiers, processing baselines, algorithms, and model
   versions for audit reproduction.

## 10. Recommended Data Tiers

### Tier 1: Required for the first crop-monitoring release

- Sentinel-2 Level-2A bands B02, B03, B04, B05, B06, B07, B08, B8A, B11, B12.
- Sentinel-2 SCL and cloud-quality layers.
- Sentinel-1 GRD IW VV+VH time series.
- LPIS geometry and IACS declaration.
- Approved scheme/crop taxonomy.
- Historical validated parcel labels.

### Tier 2: Strong supporting inputs

- CLMS Crop Types and Cropping Patterns.
- CLMS Grasslands/mowing products for relevant schemes.
- Copernicus DEM for terrain and radar correction.
- ERA5-Land or agrometeorological indicators.
- Regional crop calendars and validated inspection outcomes.

### Tier 3: Contextual or specialist inputs

- Sentinel-3 regional temperature/vegetation context.
- CORINE Land Cover for broad anomaly/context checks.
- Sentinel-1 SLC/coherence for specialist activity-detection research.

### Not required for this use case

- Sentinel-4, Sentinel-5, Sentinel-5P, or Sentinel-6 in the operational parcel
  verification pipeline.

## 11. Official References

- [Copernicus Data Space Ecosystem documentation](https://documentation.dataspace.copernicus.eu/)
- [Sentinel-1 mission documentation](https://documentation.dataspace.copernicus.eu/Data/SentinelMissions/Sentinel1.html)
- [Sentinel-1 GRD data documentation](https://documentation.dataspace.copernicus.eu/APIs/SentinelHub/Data/S1GRD.html)
- [Sentinel-2 mission documentation](https://documentation.dataspace.copernicus.eu/Data/SentinelMissions/Sentinel2.html)
- [Sentinel-2 Level-2A data documentation](https://documentation.dataspace.copernicus.eu/APIs/SentinelHub/Data/S2L2A.html)
- [CDSE STAC API](https://documentation.dataspace.copernicus.eu/APIs/STAC.html)
- [CDSE openEO API](https://documentation.dataspace.copernicus.eu/APIs/openEO.html)
- [CDSE Sentinel Hub APIs](https://dataspace.copernicus.eu/analyse/apis/sentinel-hub)
- [CLMS High Resolution Layer Croplands](https://land.copernicus.eu/en/products/high-resolution-layer-croplands)
- [CLMS Crop Types](https://land.copernicus.eu/en/products/high-resolution-layer-croplands/crop-types-2017-present-raster-10-m-europe-yearly)
- [CLMS High Resolution Layer Grasslands](https://land.copernicus.eu/en/products/high-resolution-layer-grasslands)
- [CLMS dataset catalogue](https://land.copernicus.eu/en/dataset-catalog)
- [ERA5-Land](https://cds.climate.copernicus.eu/datasets/reanalysis-era5-land)
- [Copernicus agrometeorological indicators](https://cds.climate.copernicus.eu/datasets/sis-agrometeorological-indicators)

