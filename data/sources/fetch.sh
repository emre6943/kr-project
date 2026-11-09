#!/usr/bin/env bash
# Downloads the raw source ontologies into data/sources/raw/ (gitignored: too large for git).
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p raw
curl -fsSL -o raw/doid.obo https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/main/src/ontology/doid.obo
curl -fsSL -o raw/doid.owl https://raw.githubusercontent.com/DiseaseOntology/HumanDiseaseOntology/main/src/ontology/doid.owl
curl -fsSL -o raw/symp.obo http://purl.obolibrary.org/obo/symp.obo
grep -m1 '^data-version' raw/doid.obo
grep -m1 '^data-version' raw/symp.obo
