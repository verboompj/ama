# Public-Data Crop Recognition Prototype Plan

## 1. Decision

For the capstone and initial MVP, use publicly available Copernicus and European
agricultural datasets rather than waiting for a formal Hungarian MÁK/MePAR/IACS data
agreement.

The prototype will use:

- **Copernicus CLMS Crop Types** and its confidence layer as weak Hungarian crop
  labels;
- **Sentinel-2 Level-2A** seasonal optical observations;
- **Sentinel-1 GRD VV+VH** seasonal radar observations;
- public field polygons where available, with clearly identified fallback geometries;
- EuroCrops data from nearby countries to develop and test the parcel-processing
  pipeline where useful.

This is the fastest route to a working demonstration. It is not sufficient for a
production CAP decision system because the labels are not independent,
inspection-backed Hungarian ground truth.

## 2. Why This Route

### Advantages

- No initial data-sharing agreement is required.
- Copernicus and CLMS products are open and accessible through CDSE.
- Hungary is covered by the pan-European CLMS Crop Types raster.
- Sentinel-1 and Sentinel-2 provide the same core observations expected in the future
  production architecture.
- The complete ingestion, feature, model, explanation, and evidence pipeline can be
  built before authoritative data access is available.
- The resulting system demonstrates measurable technical value for the capstone.

### Limitations

- CLMS Crop Types is a derived classification product, not inspected ground truth.
- CLMS may itself use Sentinel observations, so training a new model from its labels
  measures how well the prototype reproduces CLMS, not whether it independently
  identifies the true crop.
- CLMS taxonomy may not map exactly to Hungarian IACS/CAP crop codes.
- The 10 m raster does not provide authoritative LPIS parcel geometry.
- Public data cannot support sanctions, payment reductions, or claims of legal
  eligibility.
- EuroCrops v2 does not currently list Hungary in its published coverage.
- A model developed using neighbouring countries may experience domain shift in
  Hungary because of different crop distributions, weather, soils, field sizes, and
  agricultural practices.

The prototype must therefore label its output as **experimental crop evidence** and
retain an explicit transition path to MÁK data.

## 3. Relationship to Other Documents

- Dataset and layer descriptions:
  [`../sentinel-data-and-layers.md`](../sentinel-data-and-layers.md)
- End-to-end parcel analysis:
  [`agricultural-analysis-use-case.md`](./agricultural-analysis-use-case.md)
- Controlled model training and release:
  [`crop-classifier-training-procedure.md`](./crop-classifier-training-procedure.md)
- Sentinel resolution limits and higher-resolution escalation:
  [`high-resolution-data-strategy.md`](./high-resolution-data-strategy.md)

This plan selects the data-acquisition route for the first implementation. It does not
replace the training, evaluation, or governance controls in those documents.

## 4. Prototype Scope

### Initial geography

Select one Hungarian agricultural region with:

- substantial cropland;
- multiple target crop classes;
- good Sentinel coverage;
- manageable processing volume;
- enough distance from national borders to simplify initial data selection.

Expand to a second region only after the first pipeline runs end to end. The second
region is useful as an out-of-region evaluation set.

### Initial years

Use one complete year for training/validation and another year for out-of-time
evaluation where CLMS products are available and comparable.

Do not mix observations and labels from different agricultural years.

### Initial classes

Select 3-5 frequent and visually/phenologically distinguishable CLMS crop classes,
plus:

- `OTHER`;
- `MIXED`;
- `UNKNOWN`;
- `INSUFFICIENT_DATA`.

The selected classes must be confirmed after inspecting class frequency in the chosen
region. Do not decide solely from a European-level crop list.

## 5. Data Sources

### 5.1 Weak crop labels

**Copernicus CLMS Crop Types 2017-present**

- 10 m pan-European raster;
- yearly crop-type classification;
- companion confidence layer;
- accessible through Copernicus Browser, OData, S3, and CDSE services.

Product page:
<https://land.copernicus.eu/en/products/high-resolution-layer-croplands/crop-types-2017-present-raster-10-m-europe-yearly>

CDSE storage identifiers:

- Crop types:
  `clms_vlcc_crop-types_europe_10m_yearly_v1`
- Confidence:
  `clms_vlcc_crop-types-confidence-layer_europe_10m_yearly_v1`

### 5.2 Optical observations

Use Sentinel-2 Level-2A:

- B02, B03, B04, B05, B06, B07, B08, B8A, B11, and B12;
- Scene Classification Layer;
- cloud, cloud-shadow, snow, and valid-data masks;
- all usable dates across the agricultural season.

### 5.3 Radar observations

Use Sentinel-1 GRD IW dual-polarisation data:

- VV;
- VH;
- VV/VH or VH/VV ratio;
- acquisition/orbit metadata;
- calibrated and terrain-corrected seasonal observations.

### 5.4 Parcel or analysis geometry

Use this order of preference:

1. Public Hungarian GSA/LPIS-compatible parcel polygons, if an official endpoint
   provides reusable geometry.
2. Another suitable public agricultural-field polygon source with documented licence
   and provenance.
3. Manually selected demonstration polygons for a small capstone workflow.
4. Segmented or generated field-like objects, clearly labelled as non-authoritative
   analysis units.

Generated geometries must never be described as official parcels. Their calculated
area is an analysis-area measurement only.

### 5.5 Nearby-country development data

EuroCrops v2 currently publishes GSA parcel/crop data for regions including Slovakia,
Slovenia, and Czechia, but not Hungary.

Use this data to:

- develop GeoParquet and polygon-processing code;
- test crop-code mapping;
- test leakage-safe grouped splits;
- benchmark feature extraction over real agricultural polygons;
- pretrain experimental models.

Do not report nearby-country model accuracy as Hungarian accuracy.

EuroCrops v2:
<https://jeodpp.jrc.ec.europa.eu/ftp/jrc-opendata/DRLL/EuroCropsV2/>

## 6. Implementation Steps

### Step 1: Select region, year, and classes

1. Choose the Hungarian prototype area.
2. Download or query CLMS crop types and confidence for the selected year.
3. Count pixels/area by class.
4. Inspect representative samples in Copernicus Browser.
5. Select target classes with adequate coverage.
6. Record the class-code mapping and product version.

**Output:** Versioned prototype scope and crop taxonomy.

### Step 2: Acquire analysis geometries

1. Check the EU IACS member-state portal inventory for a Hungarian public endpoint.
2. Confirm licence, year, geometry meaning, and whether crop attributes are present.
3. If reusable parcel polygons are unavailable, create a small manually reviewed
   demonstration set or generated analysis objects.
4. Store geometry in an equal-area CRS, preferably `EPSG:3035` for European
   prototyping.
5. Assign a stable, non-personal analysis-unit ID.

**Output:** GeoParquet/GeoJSON layer containing analysis-unit geometry, area, source,
licence, year, and authority status.

### Step 3: Assign weak labels

For every analysis unit:

1. Overlay the CLMS Crop Types raster.
2. Calculate class proportions inside the geometry.
3. Calculate mean/minimum confidence from the confidence layer.
4. Assign a weak label only if:
   - a target class covers an approved proportion of the interior;
   - confidence exceeds the selected threshold;
   - boundary/mixed-pixel exposure is acceptable.
5. Otherwise assign `MIXED` or `UNKNOWN`.

Suggested starting rule for experimentation:

- dominant class covers at least 80% of valid interior pixels;
- confidence passes a threshold selected after inspecting its distribution;
- at least 20 valid interior 10 m pixels are available.

These values are prototype assumptions and must be evaluated rather than treated as
regulatory thresholds.

**Output:** Analysis units with weak label, class proportions, confidence, and label
provenance.

### Step 4: Build leakage-safe splits

Do not randomly split individual pixels.

1. Group nearby analysis units into spatial blocks.
2. Assign complete blocks to train, validation, or test.
3. Keep the second region or later year isolated for transfer testing.
4. Confirm no overlapping geometry occurs across splits.
5. Record split IDs in the dataset.

**Output:** Reproducible train/validation/test manifests.

### Step 5: Extract Sentinel-2 time series

For each analysis unit and date:

1. discover Sentinel-2 L2A products through STAC;
2. apply SCL and cloud/shadow masks;
3. calculate valid coverage;
4. extract parcel medians and variability for analytical bands;
5. calculate NDVI, NDRE, NDMI, EVI, and bare-soil features;
6. preserve product ID, date, processing version, and quality information.

**Output:** Parcel-date optical feature table.

### Step 6: Extract Sentinel-1 time series

For each analysis unit and acquisition:

1. discover Sentinel-1 GRD IW VV+VH products;
2. apply calibration and terrain correction;
3. preserve orbit/acquisition geometry;
4. calculate parcel VV, VH, ratio, variability, and temporal-change features.

**Output:** Parcel-date radar feature table.

### Step 7: Build seasonal features

Aggregate per-date features into:

- green-up timing;
- seasonal peak and value;
- seasonal integral;
- senescence/harvest transition;
- optical/radar change points;
- valid observation counts;
- maximum observation gap;
- cloud and boundary quality;
- CLMS weak-label confidence.

Keep the original time-series table for charts and future temporal models.

**Output:** One model-ready row per analysis unit/year plus lineage.

### Step 8: Train transparent baselines

Train and compare:

1. majority-class baseline;
2. CLMS label/reference baseline;
3. Sentinel-2-only gradient-boosted model;
4. Sentinel-1 plus Sentinel-2 gradient-boosted model.

Calibrate probabilities and implement `UNKNOWN`/abstention behaviour as defined in
[`crop-classifier-training-procedure.md`](./crop-classifier-training-procedure.md).

**Output:** Reproducible baseline models and evaluation report.

### Step 9: Evaluate honestly

Measure:

- per-class precision, recall, and F1;
- macro-F1;
- confusion matrix;
- calibration;
- abstention rate and retained accuracy;
- performance by region, parcel size, confidence, and observation coverage;
- Sentinel-1 plus Sentinel-2 improvement over Sentinel-2 alone.

Interpret results as:

> Agreement with CLMS weak labels under the prototype conditions.

Do not describe them as field-verified Hungarian crop accuracy.

### Step 10: Build the demonstration

The demonstration should show:

1. selected analysis polygon and calculated area;
2. seasonal true-colour/false-colour observations;
3. NDVI/NDRE and Sentinel-1 time-series charts;
4. weak CLMS label and confidence;
5. model prediction, alternatives, and calibrated confidence;
6. explanation of important seasonal evidence;
7. an `UNKNOWN` example;
8. a complete provenance/evidence record.

## 7. Prototype Dataset Schema

Minimum analysis-unit table:

| Field | Description |
|---|---|
| `analysis_unit_id` | Stable non-personal identifier |
| `geometry` | Polygon in the documented CRS |
| `area_m2` | Calculated analysis area |
| `geometry_source` | Official public, third party, manual, or generated |
| `official_parcel` | Always false unless confirmed by the source authority |
| `country` | `HU` for Hungarian prototype units |
| `region` | Selected prototype region |
| `year` | Agricultural year |
| `weak_crop_code` | CLMS-derived crop class |
| `weak_label_confidence` | Aggregated confidence-layer value |
| `dominant_class_fraction` | Fraction covered by the selected class |
| `label_source` | CLMS product identifier/version |
| `split` | Train, validation, or test |
| `spatial_group_id` | Leakage-prevention group |

Feature tables should use `analysis_unit_id`, `year`, and acquisition date as join
keys and preserve Sentinel product identifiers.

## 8. Definition of Done

The public-data prototype is complete when:

- one Hungarian region and one full season are processed;
- analysis geometries and areas are reproducible;
- CLMS crop and confidence layers are joined with documented thresholds;
- Sentinel-2 and Sentinel-1 seasonal features are available;
- spatially isolated train/validation/test splits exist;
- baseline models and calibrated abstention are evaluated;
- a farmer/caseworker-style evidence view is demonstrated;
- all outputs clearly state that labels are weak and non-authoritative;
- the transition requirements for MÁK data are documented.

## 9. Transition to Authoritative Hungarian Data

When MÁK data becomes available:

1. retain the ingestion and feature pipeline;
2. replace weak CLMS labels with pseudonymised, independently validated labels;
3. map the model taxonomy to Hungarian IACS codes;
4. rebuild leakage-safe splits using holding identifiers;
5. fine-tune or retrain the model;
6. evaluate on a locked, inspection-backed Hungarian test set;
7. redefine confidence and discrepancy thresholds using real operational costs;
8. repeat legal, data-protection, AI-risk, and operational approval;
9. deploy first in shadow mode.

The public-data prototype reduces technical uncertainty. It does not remove the need
for official validation before administrative use.

## 10. Key References

- [CLMS Crop Types 2017-present](https://land.copernicus.eu/en/products/high-resolution-layer-croplands/crop-types-2017-present-raster-10-m-europe-yearly)
- [Copernicus Data Space Ecosystem](https://dataspace.copernicus.eu/)
- [CDSE STAC API](https://documentation.dataspace.copernicus.eu/APIs/STAC.html)
- [EU Member State IACS geoportals](https://agridata.ec.europa.eu/extensions/iacs/iacs.html)
- [EuroCrops v2 coverage and downloads](https://jeodpp.jrc.ec.europa.eu/ftp/jrc-opendata/DRLL/EuroCropsV2/)
- [JRC IACS spatial-data interoperability guidance](https://publications.jrc.ec.europa.eu/repository/handle/JRC132427)
