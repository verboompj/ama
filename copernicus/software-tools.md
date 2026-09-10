# Copernicus Software, Tools & Processing Chains

| Tool | Description |
|---|---|
| **SNAP (Sentinel Application Platform)** | ESA's primary open-source toolbox for Sentinel-1/2/3 data. Includes S1TBX, S2TBX, S3TBX toolboxes plus plugins for atmospheric correction, terrain analysis, visualization, and processing. |
| **openEO** | Open API/ecosystem for standardized, cloud-based EO processing. Client libraries for R, Python, JavaScript, plus a QGIS plugin and web editor; enables workflows without local data download. |
| **Sen2Cor** | Atmospheric/terrain/cirrus correction processor for Sentinel-2 — converts Level 1C to Level 2A products. Runs standalone or inside SNAP. |
| **Sen4CAP (Sentinels for Common Agricultural Policy)** | Ready-to-use Sentinel-1/2 processing chain for monitoring agricultural practices — crop mapping, land cover classification, management-practice monitoring. Directly supports CAP Area Monitoring System implementation. Includes GUI + batch processing, integrates with SNAP/openEO. |
| **Sen2Three** | Generates Level 3 (multi-temporal) products from Sentinel-2. |
| **Sen2Res** | Spatial resolution enhancement for Sentinel-2. |
| **SNAPHU** | Phase unwrapping for InSAR (radar interferometry) processing. |
| **IdePix** | Pixel identification/classification — cloud masks, water/land separation. |
| **PolSARpro** | Advanced polarimetric SAR data analysis. |
| **Proba-V Toolbox / SMOS Toolbox / Atmospheric Toolbox** | Mission- or domain-specific SNAP-ecosystem toolboxes. |

Most tools are open-source, distributed via ESA's STEP platform, GitHub, or the Copernicus Data Space Ecosystem.

## APIs (Copernicus Data Space Ecosystem)
- **S3 Protocol** — high-performance scalable downloads (`https://eodata.dataspace.copernicus.eu/`)
- **OData API** — RESTful data publication/management
- **STAC API** — programmatic metadata/data access
- **openEO API** / **Sentinel Hub API** — cloud processing and analytics

## Sources
- [STEP – Science Toolbox Exploitation Platform (ESA)](https://step.esa.int/)
- [Sentinels Toolboxes — SentiWiki](https://sentiwiki.copernicus.eu/web/sentinels-toolboxes)
- [openEO](https://openeo.org/) / [openEO software list](https://openeo.org/software.html)
- [openEO — Copernicus Data Space Ecosystem](https://dataspace.copernicus.eu/analyse/openeo)
- [APIs — Copernicus Data Space Ecosystem](https://dataspace.copernicus.eu/analyse/apis)
- [Documentation portal — Copernicus Data Space Ecosystem](https://documentation.dataspace.copernicus.eu/)
- [awesome-sentinel — curated tools list (GitHub)](https://github.com/kr-stn/awesome-sentinel)
