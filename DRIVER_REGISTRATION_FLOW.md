# SafeMove Driver Registration Flow

Ce projet implémente le flux complet d'inscription des conducteurs pour l'application SafeMove.

## Flux d'inscription

### Étapes du processus d'inscription

1. **Page d'accueil (WelcomerView)**
   - Choix entre inscription conducteur/passager
   - Lien vers la connexion

2. **Step 2/4 - Enregistrement du véhicule (VehicleRegistrationView)**
   - Sélection de la marque (avec recherche)
   - Saisie du modèle
   - Année du véhicule (validation 2005+)
   - Couleur du véhicule (avec palette)
   - Numéro de plaque d'immatriculation

3. **Step 3/4 - Téléchargement des documents (DocumentUploadView)**
   - Photo du permis de conduire
   - Photo de la carte grise
   - Photo de l'assurance véhicule
   - Photo de profil
   - Interface de navigation entre les étapes

4. **Step 4/4 - Statut de la demande (ApplicationStatusView)**
   - Confirmation de soumission
   - Statut "En cours de révision"
   - Informations sur les délais
   - Options pour vérifier le statut

## Structure des fichiers

### Modules créés/modifiés

```
lib/app/modules/
├── welcomer/                     # Page d'accueil améliorée
│   ├── controllers/
│   │   └── welcomer_controller.dart
│   └── views/
│       └── welcomer_view.dart
│
├── vehicleRegistration/          # Step 2 - Enregistrement véhicule
│   ├── bindings/
│   │   └── vehicle_registration_binding.dart
│   ├── controllers/
│   │   └── vehicle_registration_controller.dart
│   ├── views/
│   │   └── vehicle_registration_view.dart
│   └── widgets/
│       ├── brand_selector_view.dart    # Sélecteur de marques
│       └── color_selector_view.dart    # Sélecteur de couleurs
│
├── documentUpload/               # Step 3 - Téléchargement documents
│   ├── bindings/
│   │   └── document_upload_binding.dart
│   ├── controllers/
│   │   └── document_upload_controller.dart
│   └── views/
│       └── document_upload_view.dart
│
└── application_status/           # Step 4 - Statut de la demande
    ├── bindings/
    │   └── application_status_binding.dart
    ├── controllers/
    │   └── application_status_controller.dart
    └── views/
        └── application_status_view.dart
```

### Contrôleur global

```
lib/app/controllers/
└── global_controller.dart        # Gestion des données entre les étapes
```

## Fonctionnalités implémentées

### VehicleRegistrationController
- Validation des formulaires en temps réel
- Gestion des erreurs par champ
- Sélection de marque avec recherche
- Sélection de couleur avec palette visuelle
- Validation de l'année (2005+)
- Sauvegarde des données du véhicule

### DocumentUploadController
- Gestion de 4 types de documents
- Capture photo/sélection galerie
- Navigation entre les étapes de documents
- Prévisualisation des images
- Validation avant soumission

### ApplicationStatusController
- Différents statuts d'application
- Calcul du temps écoulé depuis soumission
- Interface pour vérifier le statut
- Navigation vers les paramètres ou accueil

### GlobalController
- Stockage centralisé des données d'inscription
- Validation de complétude des étapes
- Gestion du statut global de l'application

## Routes configurées

```dart
Routes.VEHICLE_REGISTRATION     // /vehicle-registration
Routes.DOCUMENT_UPLOAD          // /document-upload
Routes.APPLICATION_STATUS       // /application-status
```

## Dépendances requises

Pour utiliser complètement ce flux, ajoutez ces dépendances dans `pubspec.yaml`:

```yaml
dependencies:
  image_picker: ^1.0.4           # Pour la capture/sélection d'images
  permission_handler: ^11.0.1    # Pour les permissions caméra/galerie
```

## Navigation du flux

1. **WelcomerView** → "Register as Driver" → **VehicleRegistrationView**
2. **VehicleRegistrationView** → "Continue" → **DocumentUploadView**
3. **DocumentUploadView** → "Submit" → **ApplicationStatusView**

## Validation et gestion d'erreurs

- Validation en temps réel des champs
- Messages d'erreur contextuels
- Gestion des états de chargement
- Persistance des données entre les étapes
- Gestion des erreurs réseau/API

## Design Pattern utilisé

- **GetX Pattern** pour la gestion d'état
- **Reactive Programming** avec Obx()
- **Dependency Injection** avec les bindings
- **Navigation déclarative** avec GetX routes
- **Séparation des responsabilités** (Controller/View/Binding)

## Personnalisation

### Couleurs principales
- **Primary Blue**: `Color(0xFF1A237E)`
- **Background**: `Colors.grey[50]`
- **Text**: `Color(0xFF1A1A1A)`

### Marques de véhicules
La liste des marques est configurable dans `VehicleRegistrationController.vehicleBrands`

### Types de documents
Les types de documents sont définis dans l'enum `DocumentType` du `DocumentUploadController`
