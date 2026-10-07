# High-Resolution Data Strategy for Agricultural Monitoring

## 1. Purpose

This document explains when Sentinel resolution is sufficient, when it is not, and how
the agricultural monitoring solution should escalate to higher-resolution imagery or
other evidence.

The recommended approach is a tiered evidence model:

1. monitor every parcel with open Sentinel-1 and Sentinel-2 data;
2. detect parcels where resolution or observation quality is insufficient;
3. use high-resolution imagery selectively for those exceptions;
4. use sub-metre imagery, aerial evidence, or geo-tagged photographs only for targeted
   investigation.

This controls cost and preserves broad seasonal coverage without pretending that one
data source can resolve every parcel.

Related documents:

- [`../sentinel-data-and-layers.md`](../sentinel-data-and-layers.md)
- [`agricultural-analysis-use-case.md`](./agricultural-analysis-use-case.md)
- [`public-data-crop-prototype-plan.md`](./public-data-crop-prototype-plan.md)
- [`crop-classifier-training-procedure.md`](./crop-classifier-training-procedure.md)
- [`evidence-validation-storyline.md`](./evidence-validation-storyline.md)
- [`drone-survey-validation-process.md`](./drone-survey-validation-process.md)

## 2. Is Resolution the Biggest Risk?

Spatial resolution is a major risk, particularly for:

- small parcels;
- narrow or highly irregular parcels;
- parcels surrounded by different crops;
- parcels containing hedges, trees, roads, water, or buildings;
- mixed-use or split-crop parcels;
- activity detection near parcel boundaries.

It is not the only or universally largest risk. Crop-recognition quality can also be
limited by:

- incorrect or weak crop labels;
- outdated or inaccurate parcel geometry;
- cloud and shadow during important growth stages;
- insufficient seasonal observations;
- similar crop phenology;
- inconsistent crop taxonomy;
- weather anomalies;
- regional and seasonal model drift;
- processing or calibration errors;
- forced predictions where the correct result is unknown.

Higher spatial resolution does not repair incorrect labels, missing temporal
observations, or a poor evaluation design.

## 3. Sentinel Resolution and Mixed Pixels

Sentinel-2 analytical bands are available at 10 m and 20 m resolution:

- a 10 m pixel represents approximately 100 m2 before projection effects;
- a 20 m pixel represents approximately 400 m2.

A pixel crossing a parcel boundary may combine:

- the claimed crop;
- a neighbouring crop;
- bare soil;
- grass margins;
- a road or track;
- trees or hedges;
- drainage or surface water.

This creates a mixed spectral signal. Resampling a 20 m band to a 10 m grid does not
create additional observed detail; it only places the coarser measurement on a finer
grid.

Sentinel-1 has similar spatial constraints and adds radar-specific effects such as
field orientation, incidence angle, speckle, moisture, and structural scattering.

## 4. Accommodating Resolution in the Baseline Pipeline

### 4.1 Use authoritative geometry

Use LPIS geometry for production parcel analysis. In the public-data prototype, mark
all manually generated or segmented polygons as non-authoritative.

Do not derive legal parcel area by counting satellite pixels.

### 4.2 Calculate parcel usability

For every parcel, calculate:

- official or analysis area;
- perimeter and compactness;
- parcel width or narrow-section indicators;
- number of intersecting pixels;
- number of valid interior pixels;
- boundary-pixel proportion;
- valid optical and radar coverage;
- nearby land-cover/crop contrast;
- within-parcel spectral variability.

These values become evidence-quality features and may trigger escalation.

### 4.3 Use an inward buffer

Where the parcel is large enough, calculate features for:

- the complete parcel;
- an inward-buffered interior;
- optionally, a separate boundary zone.

The interior signal is less contaminated by neighbouring fields. The difference
between interior and boundary statistics can reveal geometry problems or mixed use.

The buffer distance must be linked to source resolution. It should not remove the
entire usable area of a small parcel.

### 4.4 Use seasonal observations

Multi-temporal analysis can distinguish crops that look similar on one date. Use:

- optical phenology from Sentinel-2;
- cloud-independent radar time series from Sentinel-1;
- regional crop calendars;
- weather context;
- multiple vegetation, moisture, soil, and structural features.

Temporal information improves crop recognition but cannot recover spatial detail that
was never measured.

### 4.5 Allow abstention

Return `INSUFFICIENT_RESOLUTION` or `UNKNOWN` when:

- too few interior pixels remain;
- boundary contamination is excessive;
- geometry is narrow or fragmented;
- different parts of the parcel show incompatible crop signals;
- the parcel is substantially smaller than the model's validated operating range.

The system must not hide a resolution problem behind a high-confidence-looking
prediction.

## 5. Illustrative Escalation Rules

The following are starting hypotheses for testing, not regulatory thresholds:

| Condition | Initial response |
|---|---|
| At least 50 valid interior 10 m pixels and low boundary contamination | Standard Sentinel analysis |
| 20-49 valid interior pixels | Sentinel analysis with stricter confidence threshold |
| Fewer than 20 valid interior pixels | Escalate or abstain |
| Boundary pixels exceed 40% of usable pixels | Escalate or apply interior-only analysis |
| Strong disagreement between interior and whole-parcel prediction | Check geometry or mixed use |
| High temporal confidence but poor spatial quality | Retain as supporting evidence; do not auto-resolve |
| Low temporal and spatial quality | Request higher-resolution or farmer/inspection evidence |

These thresholds must be evaluated against real parcels and independently validated
labels. Parcel shape can matter more than area; a long narrow parcel may remain
unusable even when its total area is large.

## 6. Tiered Data Strategy

| Tier | Data | Resolution/cadence | Purpose |
|---|---|---|---|
| 1 | Sentinel-1 and Sentinel-2 | Approximately 10-20 m, frequent seasonal observations | National monitoring, crop phenology, broad activity evidence |
| 2 | Copernicus Contributing Missions VHR or commercial high-resolution imagery | Approximately 2-4 m depending collection/provider | Small or mixed parcels, boundary validation, detailed contextual evidence |
| 3 | Targeted commercial sub-metre imagery | Approximately 30-50 cm depending provider/product | Disputes, damage, detailed boundary/land-use interpretation |
| 4 | National aerial imagery, drone capture, or geo-tagged farmer/inspector photographs | Centimetre to sub-metre | Case-specific evidence and human verification |

Higher tiers should be invoked by evidence-quality rules, not applied automatically to
all 160,000 farmers.

## 7. Copernicus Contributing Missions

### 7.1 What CCM provides

Copernicus Contributing Missions (CCM) supplement Sentinel data with commercial and
national optical, SAR, and elevation missions.

The CCM optical catalogue includes missions such as:

- Pléiades and Pléiades Neo;
- SPOT-6/7;
- WorldView;
- GeoEye;
- PlanetScope;
- Geosat;
- KOMPSAT;
- SuperView;
- Vision-1;
- other historical and current missions.

Available products and licences differ by collection, acquisition period, user
category, and product type.

### 7.2 VHR_IMAGE_2024

`VHR_IMAGE_2024` provides:

- cloud-free coverage of EEA-39;
- acquisitions from the vegetation seasons of 2023 and 2024, with gap filling in
  2025;
- approximately 99.25% final coverage;
- up to 2 m spatial resolution;
- orthorectified imagery;
- European commercial contributing missions including Pléiades, Pléiades Neo,
  Geosat-2, and Vision-1, with SPOT-6 4 m gap filling.

This is valuable for:

- reference mapping;
- identifying narrow and fragmented agricultural fields;
- checking Sentinel mixed-pixel exposure;
- improving demonstration geometries;
- independent visual review of land cover.

It is not a dense seasonal time series. A single cloud-free continental coverage
cannot replace Sentinel-1/Sentinel-2 phenology for crop-type recognition.

### 7.3 Access rights

Sentinel data is open to everyone. CCM download rights are restricted by collection
and user category.

For `VHR_IMAGE_2024`, official download access is granted to:

- Copernicus Services and Union Institutional Users;
- Union Research Projects;
- National Public Authorities.

A Hungarian paying agency is likely to fit the National Public Authority category,
subject to registration, validation, and the ESA user licence. A private capstone
participant should not assume the same download rights.

Access is available through the Copernicus Data Space Ecosystem using:

- Copernicus Browser;
- OData;
- S3 APIs;
- applicable view services.

## 8. Commercial Subscription Options

Where CCM access, timing, cadence, or licensing is insufficient, imagery can be
procured directly from commercial operators or resellers.

Indicative categories:

| Category | Example providers/missions | Best fit |
|---|---|---|
| High-frequency 3-5 m optical | PlanetScope and comparable constellations | Seasonal crop monitoring with improved field separation |
| Tasked approximately 50 cm optical | SkySat and comparable products | Targeted follow-up and rapid event evidence |
| Tasked approximately 30 cm optical | Pléiades Neo, Maxar WorldView/Legion and comparable products | Detailed visual interpretation and high-value disputes |
| High-resolution commercial SAR | ICEYE, Capella and comparable missions | Cloud-independent targeted monitoring |

Exact resolution, revisit, spectral bands, minimum order size, archive availability,
tasking priority, latency, permitted derivatives, retention, redistribution, and price
must be confirmed during procurement.

### Subscription models

Commercial access may be sold as:

- annual area-of-interest subscription;
- archive imagery;
- monitoring programme;
- per-square-kilometre order;
- new tasking request;
- API or platform quota;
- enterprise licence.

For national CAP monitoring, the important cost unit is not only price per square
kilometre. It is cost per parcel resolved, inspection avoided, or financial-correction
risk reduced.

## 9. Aerial, Drone, and Geo-Tagged Evidence

Satellite imagery is not always the best escalation source.

### National orthophotography

Recent national aerial orthophotos may offer high spatial detail and consistent
mapping quality. Their revisit frequency may be too low for annual crop classification,
but they can improve:

- parcel boundaries;
- permanent-feature mapping;
- tree/hedge/road masking;
- historical geometry review.

### Drone imagery

Drones can provide centimetre-level evidence but require:

- lawful operation;
- trained operators;
- flight planning and weather suitability;
- georeferencing and chain of custody;
- privacy controls;
- scalable operational justification.

They are most appropriate for targeted inspection, not national routine monitoring.
They may also support a statistically designed random validation sample used to
measure monitoring accuracy and detect false-consistent results. The mission must
follow the controlled planning, capture, chain-of-custody, review, and audit process
in [`drone-survey-validation-process.md`](./drone-survey-validation-process.md).

### Farmer or inspector photographs

Geo-tagged photographs are explicitly relevant to the Area Monitoring System. They can
resolve conditions that satellite imagery cannot observe, provided the service
validates:

- identity and case association;
- capture time;
- location and orientation;
- file integrity;
- replay or manipulation risk;
- whether the required condition is visible.

The farmer photo capability should be available throughout the season but should not
be mandatory for every parcel unless an approved scheme rule requires it. The
normal, requested, and inspection-escalation paths are defined in
[`evidence-validation-storyline.md`](./evidence-validation-storyline.md).

## 10. Data Fusion

Higher-resolution imagery should complement, not silently replace, the seasonal
Sentinel model.

Recommended separation:

- **Sentinel model:** predicts crop/activity from seasonal optical and radar signals.
- **Spatial-quality model:** evaluates parcel shape, interior pixels, boundary
  contamination, and mixed use.
- **VHR analysis:** improves boundary/land-cover interpretation or supplies targeted
  evidence.
- **Rules engine:** decides whether evidence is sufficient for consistency,
  discrepancy review, or escalation.

Do not combine sources with different acquisition dates as though they describe the
same field state.

## 11. Super-Resolution Warning

AI super-resolution can make Sentinel imagery appear sharper, but it cannot guarantee
that generated detail corresponds to reality.

It may be suitable for:

- user-interface visualisation;
- exploratory feature research;
- image-registration support after validation.

It should not be used as:

- independent crop evidence;
- proof of a boundary or agricultural activity;
- a substitute for genuinely higher-resolution acquisition;
- the basis for an adverse administrative decision.

Any use must preserve the original imagery and clearly label the enhanced image as a
derived visualisation.

## 12. Recommended Architecture Decision

Use a cost-controlled escalation pipeline:

1. Run Sentinel-1/Sentinel-2 monitoring for every parcel.
2. Calculate parcel spatial-quality and temporal-quality scores.
3. Resolve high-quality, high-confidence consistent cases using the approved workflow.
4. Route uncertain cases according to cause:
   - temporal gap: wait for/retrieve another observation or use radar;
   - spatial-resolution problem: use VHR imagery;
   - non-monitorable condition: request geo-tagged evidence;
   - legal or factual dispute: human review or inspection;
   - approved random validation: independent field or drone evidence, kept separate
     from risk-targeted inspection reporting.
5. Record why higher-resolution evidence was requested and whether it resolved the
   case.
6. Use resolution outcomes to refine future escalation thresholds.

This approach uses free, frequent Sentinel coverage for scale and pays for detailed
evidence only where it changes an operational decision.

## 13. Pilot Evaluation

Before procurement, evaluate a stratified parcel sample:

- large compact parcels;
- medium parcels;
- small parcels;
- narrow/irregular parcels;
- parcels adjacent to different crops;
- mixed-use parcels;
- parcels with verified crop labels.

Compare:

1. Sentinel-only classification;
2. Sentinel plus 2-4 m imagery;
3. Sentinel plus sub-metre imagery where available.

Measure:

- crop-classification improvement;
- reduction in `UNKNOWN`;
- reduction in false discrepancies;
- boundary/geometry issue detection;
- number of cases resolved without inspection;
- acquisition latency;
- cost per resolved parcel;
- licensing and operational burden.

Purchase national-scale high-resolution coverage only if measured operational value
justifies it.

## 14. Official References

- [Copernicus Contributing Missions documentation](https://documentation.dataspace.copernicus.eu/Data/Others/CCM.html)
- [CCM collection descriptions](https://dataspace.copernicus.eu/explore-data/data-collections/copernicus-contributing-missions/ccm-collections-description)
- [CCM user categories](https://dataspace.copernicus.eu/explore-data/data-collections/copernicus-contributing-missions/ccm-user-categories)
- [VHR_IMAGE_2024 completion and access](https://dataspace.copernicus.eu/news/2026-3-31-vhrimage2024-collection-copernicus-contributing-missions-ccm-now-completed-and)
- [Copernicus Rapid Response Desk](https://www.rapidresponse.copernicus.eu/)
