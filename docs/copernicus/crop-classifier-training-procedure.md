# Crop Classifier Training Procedure

## 1. Purpose

This document defines a controlled procedure for training, evaluating, approving, and
operating a parcel-level crop classifier for Case Study 47.

The model's task is:

> Given an official LPIS parcel geometry and a seasonal Sentinel-1/Sentinel-2 time
> series, estimate the crop class and uncertainty so the paying agency can compare the
> observation with the farmer's IACS declaration.

The model produces evidence and a recommendation. It does not determine the official
parcel area, legal eligibility, payment reduction, or sanction.

Related documents:

- [`sentinel-data-and-layers.md`](./sentinel-data-and-layers.md) describes available
  Sentinel and supporting data.
- [`agricultural-analysis-use-case.md`](./agricultural-analysis-use-case.md) describes
  the end-to-end crop and parcel-area use case.
- [`public-data-crop-prototype-plan.md`](./public-data-crop-prototype-plan.md) defines
  the agreed public-data route for the first capstone/MVP implementation.

### Prototype versus production labels

For the first public-data prototype, CLMS Crop Types may be used as weak labels
according to
[`public-data-crop-prototype-plan.md`](./public-data-crop-prototype-plan.md). These
labels are suitable for pipeline development and experimental evaluation but do not
meet the independent-validation standard described below.

## 2. Training Principles

1. **Train at parcel level.** The operational unit is an LPIS parcel, not an arbitrary
   image tile or individual pixel.
2. **Use seasonal time series.** Crop type is identified from growth pattern,
   structure, and timing across multiple observations.
3. **Use independently validated labels.** Farmer declarations alone are not reliable
   ground truth because the model is intended to detect declaration errors.
4. **Prevent data leakage.** Parcels from the same farm, season, or spatial cluster
   must not leak across training and evaluation splits.
5. **Represent uncertainty.** The model must be able to return `UNKNOWN` or abstain.
6. **Measure operational harm.** A false discrepancy creates work and can affect a
   farmer; accuracy alone is not an adequate metric.
7. **Keep policy separate from prediction.** The crop classifier estimates crop type.
   A versioned rules service determines whether that result matters for a scheme.
8. **Make every release reproducible.** Data snapshot, code, features, taxonomy,
   parameters, thresholds, and evaluation results must be versioned.

## 3. Required Inputs

### 3.1 Parcel and claim data

- LPIS parcel identifier and geometry.
- Geometry version and effective dates.
- Claim/scheme year.
- IACS declared crop/activity.
- Region or agro-ecological zone.
- Farm/holding identifier stored in a protected form suitable for grouped splitting.

### 3.2 Candidate labels

Use labels in this order of confidence:

| Label source | Suggested confidence | Use |
|---|---:|---|
| Completed field inspection with definitive crop finding | Highest | Training, validation, and test |
| Expert-reviewed remote-sensing result with supporting evidence | High | Training/validation after quality review |
| Claim confirmed through several independent controls | Medium | Training with label-confidence weighting |
| Farmer declaration with no independent validation | Low | Unlabelled/weakly labelled data; not gold-standard test data |
| Disputed, appealed, mixed, or unresolved parcel | Unknown | Exclude from supervised labels or assign `UNKNOWN` |

Do not automatically treat a human override as ground truth. An override may correct
the model, apply a legal exception, repair bad geometry, or reflect a procedural
decision rather than identify the crop.

### 3.3 Earth-observation data

- Sentinel-2 Level-2A:
  - B02, B03, B04, B05, B06, B07, B08, B8A, B11, and B12;
  - Scene Classification Layer;
  - cloud, shadow, snow, and valid-data information.
- Sentinel-1 GRD IW VV+VH:
  - calibrated and terrain-corrected VV and VH;
  - acquisition/orbit geometry;
  - valid-data mask.
- Optional supporting data:
  - CLMS crop types/cropping patterns;
  - CLMS grasslands;
  - Copernicus DEM;
  - ERA5-Land or agrometeorological indicators;
  - approved regional crop calendars.

## 4. Define the Classification Taxonomy

Before extracting features, define the classes the model is expected to predict.

### Procedure

1. Export the current IACS/CAP crop codes for the target scheme year.
2. Map codes to agronomically meaningful remote-sensing classes.
3. Identify classes that cannot be reliably separated with the available observations.
4. Group indistinguishable classes where legally acceptable.
5. Add explicit classes for:
   - `UNKNOWN`;
   - mixed crop/use;
   - non-agricultural or invalid parcel;
   - insufficient observations.
6. Version the taxonomy independently from the model.

### Example

The legal taxonomy may distinguish several wheat or grassland subtypes while the
satellite signal only supports broader classes. The model should predict the broader
observable class and leave the legal subtype to other evidence rather than claim false
precision.

## 5. Build the Training Cohort

### Step 1: Select scope

Start with:

- one or a small number of Hungarian regions;
- one complete agricultural season;
- a limited set of common and distinguishable crops;
- parcels above a minimum usable size;
- labels with known provenance.

### Step 2: Apply geometry quality controls

Reject or quarantine parcels with:

- invalid polygons;
- missing or ambiguous CRS;
- overlapping administrative records;
- geometry changes not aligned with the claim year;
- extremely narrow shapes dominated by mixed pixels;
- insufficient interior area after buffering;
- substantial non-agricultural content.

Record exclusion reasons. Do not silently remove difficult parcels from evaluation,
because they will still exist in production.

### Step 3: Analyse class and regional coverage

Produce counts and total area by:

- crop class;
- region;
- farm/holding;
- parcel-size band;
- label source and confidence;
- season/year;
- valid optical and radar coverage.

Rare classes can be merged, handled with specialist models, or routed to `UNKNOWN`.
Synthetic oversampling cannot compensate for missing real-world crop, region, and
season coverage.

## 6. Create Leakage-Safe Data Splits

A random parcel split is insufficient because neighbouring parcels, parcels from the
same holding, and observations from the same year can be highly correlated.

### Required split strategy

Create three isolated datasets:

- **Training set:** used to fit model parameters.
- **Validation set:** used for feature choices, hyperparameters, calibration, and
  thresholds.
- **Test set:** locked until the candidate model and thresholds are fixed.

### Grouping rules

- Keep all parcels from the same holding in one split where identifiers permit.
- Keep spatially adjacent or strongly related parcel clusters in one split.
- Prevent duplicate or successor geometries from appearing in multiple splits.
- For temporal generalisation, reserve at least one later season as an out-of-time
  test.
- For geographic generalisation, reserve one or more regions as an out-of-region test.

Recommended evaluations:

1. **In-season/in-region test:** expected operating distribution.
2. **Out-of-region test:** geographic transfer.
3. **Out-of-time test:** next-season robustness.
4. **Stress set:** small parcels, mixed pixels, cloud gaps, unusual weather, and rare
   crops.

## 7. Preprocess Observations

### 7.1 Sentinel-2

For every parcel and acquisition:

1. Locate intersecting Level-2A products.
2. apply SCL/cloud/shadow/snow/valid-data masks;
3. harmonise processing baselines where required;
4. resample 20 m analytical bands to the selected parcel-analysis grid;
5. calculate statistics for:
   - the full polygon;
   - an inward-buffered interior where geometry permits;
6. record valid coverage, observation date, product ID, and mask percentages.

Do not interpolate through long optical gaps without preserving an uncertainty or
missingness feature.

### 7.2 Sentinel-1

For every parcel and acquisition:

1. apply precise orbit information where available;
2. remove thermal/border noise as appropriate;
3. calibrate backscatter;
4. apply terrain correction using a versioned DEM;
5. normalise or preserve incidence-angle information;
6. separate or consistently combine orbit direction/relative orbit;
7. extract parcel-level VV, VH, ratio, and variability statistics.

### 7.3 Boundary handling

For each parcel, calculate:

- official polygon area;
- number of intersecting pixels;
- number of interior pixels;
- boundary-pixel proportion;
- valid-observation percentage.

Use boundary and coverage measures as quality features. Avoid assigning a confident
crop class when the majority of observations are mixed boundary pixels.

## 8. Engineer Seasonal Features

### Optical spectral features

Per date:

- median and percentiles of B02-B08, B8A, B11, and B12;
- within-parcel standard deviation or interquartile range;
- valid-pixel coverage.

### Vegetation and soil indices

- NDVI;
- EVI;
- NDRE;
- NDMI;
- bare-soil indicators;
- additional indices only where their value is demonstrated.

### Radar features

- median VV and VH;
- VV/VH or VH/VV ratio;
- radar vegetation indicators;
- temporal change;
- within-parcel variability.

### Temporal/phenology features

- date and value of seasonal maximum/minimum;
- green-up date;
- peak date;
- senescence or harvest transition;
- seasonal integral/area under the curve;
- number and magnitude of abrupt changes;
- duration above/below selected vegetation thresholds;
- time since rainfall or accumulated growing-degree days where justified.

### Missingness features

Missing observations are informative and must be explicit:

- count of valid optical/radar dates;
- maximum observation gap;
- cloud/shadow percentage;
- whether key phenological windows are missing;
- whether only one orbit or sensor is available.

## 9. Establish Baselines

Train and document simple baselines before a complex temporal model.

### Required baselines

1. **Majority-class baseline.**
2. **CLMS/reference-layer baseline**, where available.
3. **Rule or nearest-signature baseline.**
4. **Tree-based model** such as Random Forest or gradient boosting using engineered
   seasonal parcel features.

The tree-based baseline is the recommended first production candidate because it:

- handles mixed numeric and missingness features;
- is fast to train and evaluate;
- supports feature-importance and explanation tooling;
- provides a strong benchmark for more complex sequence models.

Only adopt a temporal deep-learning model if it demonstrates a meaningful, repeatable
improvement in difficult classes, calibration, or observation gaps that justifies the
additional operational complexity.

## 10. Train Candidate Models

### Procedure

1. Freeze and register the training-data snapshot.
2. Freeze the taxonomy and feature definitions.
3. Fit preprocessing only on the training set.
4. Tune hyperparameters against the validation set.
5. Use class weighting where justified by operational priorities.
6. Avoid naive duplication of rare parcels.
7. Record random seeds and software/container versions.
8. Save the complete pipeline, not only the estimator.

### Candidate model outputs

The model must return:

- probability for every supported crop class;
- top predicted class;
- second/alternative classes;
- quality/coverage indicators;
- out-of-distribution or unknown score where implemented;
- model and taxonomy versions.

## 11. Calibrate Probabilities and Add Abstention

Raw model probabilities are often overconfident. Apply probability calibration using
the validation set, for example isotonic or Platt-style calibration where suitable.

Define three outcomes:

| Outcome | Meaning |
|---|---|
| `CONSISTENT` | Declared crop and model evidence agree above approved thresholds |
| `REVIEW_REQUIRED` | Evidence materially conflicts with the declaration and quality is sufficient |
| `UNKNOWN` | Confidence, coverage, geometry, or distribution is insufficient |

The threshold for generating a discrepancy must be based on the operational cost of a
false flag, not selected solely to maximise overall F1.

Example decision inputs:

- calibrated top-class confidence;
- margin between top and second class;
- valid optical/radar coverage;
- parcel-size/boundary quality;
- agreement between Sentinel-1 and Sentinel-2 features;
- out-of-distribution score;
- class-specific minimum performance.

## 12. Evaluate the Model

### Core predictive metrics

- precision, recall, and F1 per crop;
- macro-F1 and weighted-F1;
- confusion matrix;
- balanced accuracy;
- probability calibration and Brier score;
- top-2 accuracy where classes are difficult to distinguish;
- unknown/abstention coverage and retained accuracy.

### Operational metrics

- false discrepancy rate;
- percentage of parcels marked `CONSISTENT`;
- percentage routed to `UNKNOWN`;
- review workload by crop and region;
- number/area of affected farmers and parcels;
- expected physical inspections avoided;
- errors weighted by potential payment impact.

### Slice evaluation

Report all key metrics by:

- crop class;
- region;
- parcel-size band;
- observation-coverage band;
- label source;
- boundary-pixel proportion;
- season/year;
- model confidence band;
- farm type or other dimensions only where lawful, available, and meaningful.

### Acceptance conditions

Release criteria must be agreed before viewing final test results. At minimum:

- no critical crop class below its minimum recall/precision;
- calibrated confidence behaves as documented;
- false discrepancy rate remains within the operational limit;
- unknown/abstention catches low-quality cases;
- out-of-region and out-of-time degradation is understood;
- the model beats the approved baseline;
- legal, operational, data-protection, and model-risk reviews are complete.

## 13. Error Analysis

Manually review representative errors from:

- each major confusion-matrix cell;
- high-confidence incorrect predictions;
- farmer declarations confirmed on appeal;
- small/narrow parcels;
- mixed or changed parcel boundaries;
- cloud-heavy periods;
- unusual weather;
- double crops;
- grassland and mowing cases;
- rare crops;
- regional clusters of discrepancies.

Assign a primary cause:

- incorrect label;
- bad/outdated LPIS geometry;
- insufficient observations;
- mixed pixels;
- preprocessing failure;
- taxonomy mismatch;
- genuine model error;
- unusual agricultural practice;
- policy/claim interpretation issue.

Do not solve a label or geometry problem by making the model more complex.

## 14. Explainability and Evidence

For every production inference, retain:

- source product IDs and acquisition dates;
- valid/masked coverage;
- parcel statistics and time-series features;
- predicted class probabilities;
- feature contributions or comparable explanation;
- representative evidence dates/images;
- quality and abstention reasons;
- model, taxonomy, feature, and preprocessing versions.

Provide two explanation levels:

- **Caseworker/auditor:** technical evidence, lineage, uncertainty, and alternatives.
- **Farmer:** plain-language difference between declaration and observation, relevant
  dates, uncertainty, and available response options.

Feature importance is not itself a legal reason. The final administrative explanation
must connect reliable evidence to the applicable rule and preserve human review.

## 15. Approval and Release

### Required release artifacts

- model card;
- training-data statement and lineage;
- taxonomy and supported/unsupported classes;
- evaluation report including all slices;
- calibration and threshold report;
- error-analysis report;
- known limitations;
- risk assessment and human-oversight design;
- reproducible training configuration;
- signed model artifact/container;
- rollback plan.

### Approval roles

At minimum:

- geospatial/data science owner;
- CAP operations owner;
- legal/compliance representative;
- data protection/AI risk representative;
- security/platform representative.

Approval should be tied to a specific scheme year, region, taxonomy, and model version.

## 16. Deployment

Recommended promotion stages:

1. **Offline retrospective evaluation.**
2. **Shadow mode:** production data, no case action.
3. **Assisted review:** visible recommendation to caseworkers only.
4. **Bounded automation:** automatically mark clearly consistent cases where approved;
   discrepancies still receive human or farmer-resolution safeguards.
5. **Expanded scope:** additional regions/classes only after measured success.

No model should progress directly from offline metrics to autonomous adverse action.

## 17. Monitoring and Retraining

Monitor:

- input-band and feature distributions;
- missing/cloud coverage;
- crop-class distribution;
- confidence and abstention rate;
- discrepancy and override rate;
- inspection and appeal outcomes;
- performance on newly validated labels;
- regional and seasonal drift;
- service latency/failures;
- changes in Sentinel processing baselines or source products.

### Retraining triggers

- new agricultural season;
- material taxonomy or CAP rule change;
- new region or crop scope;
- Sentinel processing change;
- sustained drift;
- performance below an approved threshold;
- systematic appeal/inspection evidence against a class;
- corrected LPIS or label-quality issue.

Retraining creates a new candidate version. It must repeat validation, locked test
evaluation, approval, and staged deployment. Production feedback must not
automatically retrain or promote a model.

## 18. Recommended First Training Experiment

1. Select 3-5 common crop classes plus `OTHER` and `UNKNOWN`.
2. Use one historical season for training and validation.
3. Reserve the following season as the out-of-time test.
4. Group splits by holding and spatial cluster.
5. Extract parcel-level Sentinel-2 and Sentinel-1 seasonal features.
6. Train:
   - majority baseline;
   - Sentinel-2-only gradient-boosted model;
   - Sentinel-1 plus Sentinel-2 gradient-boosted model.
7. Calibrate probabilities.
8. Add a conservative abstention threshold.
9. Compare false discrepancy rate and retained coverage.
10. Run in shadow mode against a current-season sample.

This experiment answers the most important early question: whether adding Sentinel-1
and multi-temporal features produces enough reliable improvement over a transparent
Sentinel-2 baseline to justify the operational pipeline.
