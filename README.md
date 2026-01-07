# Projet SQL B2 - cIAra Mobility

## Contexte
Gestion d'une flotte de véhicules électriques partagés (voitures, scooters, trottinettes, vélos) pour la start-up cIAra Mobility.

## Tables créées
- `station` : stocke les stations avec leur ville
- `vehicule` : informations sur les véhicules
- `maintenance` : interventions de maintenance sur les véhicules

## Import des données
- Stations : manuellement dans `02_import_data.sql`
- Véhicules : import depuis CSV via COPY

## Requêtes principales
- Nombre de véhicules disponibles
- Autonomie moyenne par marque
- Véhicules par ville
- Vues pour simplifier l’accès aux véhicules disponibles
- Fonction pour calculer le coût d’une location
- Trigger pour mettre à jour automatiquement le statut lors d’une maintenance

## Utilisation
1. Exécuter `01_create_tables.sql`
2. Exécuter `02_import_data.sql`
3. Exécuter `03_queries.sql`
4. Tester SELECT / VUE / FONCTION / TRIGGER