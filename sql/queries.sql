-- 1er test, le nb de véhcules dispo
SELECT * FROM vehicule WHERE statut = 'Disponible';

-- 2ème test,  nb de véhicules par ville
SELECT ville, COUNT(*) FROM vehicule
JOIN station USING(id_station)
GROUP BY ville;

-- 3ème test,  autonomie moyenne par marque
SELECT marque, AVG(autonomie_km)
FROM vehicule
GROUP BY marque;

-- 4ème test,  véhicules en maintenance
SELECT * FROM vehicule WHERE statut = 'En maintenance';

-- 5ème test,  Les véhicules qui sont hors service
SELECT * FROM vehicule WHERE statut = 'Hors service';

-- 6ème test,  Les villes avec le plus de véhicules 
SELECT ville, COUNT(*) AS total
FROM vehicule JOIN station USING(id_station)
GROUP BY ville
ORDER BY total DESC
LIMIT 1;

-- 7ème test, Les véhicules qui sont dispo
CREATE VIEW vue_vehicules_disponibles AS
SELECT marque, modele, ville
FROM vehicule JOIN station USING(id_station)
WHERE statut = 'Disponible';

-- 8ème test,  Les couts de locaiton selon la durée
CREATE OR REPLACE FUNCTION calcul_cout(duree INT)
RETURNS NUMERIC AS $$
BEGIN
    RETURN duree * 12.5;
END;
$$ LANGUAGE plpgsql;

-- 9ème test, Les véhicules qui sont indisponibles si y'as une maintenance
CREATE OR REPLACE FUNCTION maj_statut()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE vehicule
    SET statut = 'En maintenance'
    WHERE id_vehicule = NEW.id_vehicule;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_maintenance
AFTER INSERT ON maintenance
FOR EACH ROW
EXECUTE FUNCTION maj_statut();

-- 10 ème test, sert a ajouté une maintenance
INSERT INTO maintenance (date_intervention, type_intervention, id_vehicule)
SELECT CURRENT_DATE, 'Batterie', id_vehicule
FROM vehicule
LIMIT 1;

