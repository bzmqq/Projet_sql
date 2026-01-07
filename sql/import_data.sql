CREATE TABLE IF NOT EXISTS vehicule_import (
    id INT,
    marque TEXT,
    modele TEXT,
    annee INT,
    energie TEXT,
    autonomie_km INT,
    immatriculation TEXT,
    etat TEXT,
    localisation TEXT
);

COPY vehicule_import(id, marque, modele, annee, energie, autonomie_km, immatriculation, etat, localisation)
FROM 'C:/Users/pouru/Desktop/projett sql/data/vehicules_clara_2025.csv'
DELIMITER ',' CSV HEADER;

INSERT INTO station (ville, nb_bornes)
SELECT DISTINCT localisation, 5 FROM vehicule_import;

INSERT INTO vehicule (id_vehicule, marque, modele, annee, energie, autonomie_km, immatriculation, statut, id_station)
SELECT vi.id, vi.marque, vi.modele, vi.annee, vi.energie, vi.autonomie_km, vi.immatriculation, vi.etat, s.id_station
FROM vehicule_import vi
JOIN station s ON s.ville = vi.localisation;
