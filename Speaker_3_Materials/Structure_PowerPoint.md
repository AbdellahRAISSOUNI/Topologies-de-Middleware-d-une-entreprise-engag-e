# Structure PowerPoint - Speaker 3

## 🎨 Design Guidelines

### Thème Global
- **Couleurs** : Bleu professionnel (#2C3E50) avec accents verts (#27AE60) et oranges (#E67E22)
- **Police** : Titre : Montserrat Bold, Corps : Open Sans Regular
- **Style** : Minimaliste, aéré, beaucoup d'espace blanc
- **Images** : Haute qualité, professionnelles, icônes cohérentes

### Règle d'Or
- **Maximum 6 mots par ligne, 6 lignes par slide** (guideline, pas stricte)
- **Une idée principale par slide**
- **Beaucoup de visuels, peu de texte**
- **Diagrammes préférés aux listes à puces**

---

## 📊 SLIDE 9: Cas d'Usage Réels - Architecture E-commerce

### Layout
- **Titre** : "Cas d'Usage 1: E-commerce" (grand, en haut)
- **Diagramme d'architecture** : Centré, grande taille
- **3-4 puces très courtes** : Bas du slide (patterns EIP utilisés)
- **Pas de texte long** - tout doit être dans le diagramme et le script

### Contenu Visuel
- Diagramme d'architecture complet (utiliser `diagram_ecommerce.drawio`)
- Icônes : Cloud, Server, Database, API Gateway
- Flèches animées (optionnel) montrant le flux de données
- Badges colorés pour : SOAP, REST, Kafka, WSO2

### Texte Minimal
```
Patterns EIP:
• Message Translator (SOAP ↔ REST)
• Content Enricher (CRM data)
• Content-Based Router
• Circuit Breaker
```

---

## 📊 SLIDE 9b: Architecture Banque

### Layout
- **Titre** : "Cas d'Usage 2: Banque & Systèmes Legacy"
- **Diagramme d'architecture** : Centré
- **Zone technique** : Adapters détaillés (icônes)

### Contenu Visuel
- Diagramme avec ESB IBM + Adapters (utiliser `diagram_banque.drawio`)
- Icônes : Mainframe, AS/400, Mobile App, Lock (sécurité)
- Highlight sur les adapters (couleur différente)
- Badge "PCI-DSS Compliant"

### Texte Minimal
```
Défis:
• Transformation COBOL → JSON
• Performance & Résilience
• Conformité réglementaire
```

---

## 📊 SLIDE 9c: Architecture Santé

### Layout
- **Titre** : "Cas d'Usage 3: Santé & Interopérabilité"
- **Diagramme d'architecture** : Centré
- **Standards HL7** : Icônes/badges pour v2, v3, FHIR

### Contenu Visuel
- Diagramme Message Bus avec HL7 Gateway (utiliser `diagram_sante.drawio`)
- Icônes : Hospital, Microscope, Pill, X-Ray, Shield (sécurité)
- Flèches Publish-Subscribe (multi-direction)
- Badge "HL7/FHIR Compliant"

### Texte Minimal
```
Standards: HL7 v2, v3, FHIR
Patterns:
• Message Translator
• Publish-Subscribe
• Message Store (audit)
```

---

## 📊 SLIDE 10: SOA vs Microservices

### Layout
- **Titre** : "SOA/ESB vs Microservices"
- **Deux colonnes** : Diagramme ESB à gauche, Microservices à droite
- **Tableau comparatif** : En bas (compact)

### Contenu Visuel
- **Gauche** : Diagramme ESB centralisé (utiliser `diagram_soa_vs_microservices.drawio`)
- **Droite** : Diagramme Microservices distribué
- **Tableau** : Critères techniques comparés (couleurs : vert = avantage, rouge = inconvénient)
- **Flèche du milieu** : "Migration Strategy"

### Texte Minimal (Tableau)
```
Critère          | ESB           | Microservices
────────────────────────────────────────────────
Architecture     | Centralisée   | Distribuée
Scalabilité      | Verticale     | Horizontale
Résilience       | Point unique  | Distribuée
Technologie      | Homogène      | Polyglot
```

---

## 📊 SLIDE 11: API Economy & Middleware

### Layout
- **Titre** : "Middleware dans l'Économie de Services"
- **Diagramme central** : API Management Platform (utiliser `diagram_api_economy.drawio`)
- **Logos autour** : Stripe, Twilio, AWS, Google (petites icônes)

### Contenu Visuel
- Architecture API Management au centre
- Composants : Gateway, Security, Analytics, Developer Portal
- Flèches montrant les flux
- Icônes : Lock (security), Chart (analytics), Code (dev portal)

### Texte Minimal
```
API Management:
• Gateway (routage, LB)
• Security (OAuth, Rate Limit)
• Analytics (métriques)
• Dev Portal (docs, SDKs)

Patterns: BFF, API Composition, Event-Driven
```

---

## 📊 SLIDE 12: Conclusion & Perspectives

### Layout
- **Titre** : "Synthèse & Perspectives"
- **4 icônes** : Une par topologie (Point-à-Point, ESB, Message Bus, Service Mesh)
- **Timeline future** : Bas du slide (Serverless, Edge, AI/ML, Low-Code)

### Contenu Visuel
- **4 boîtes** représentant les 4 topologies principales
- **Timeline horizontale** : Tendances futures avec icônes
- **Matrice de décision** : Petit diagramme de choix
- **Message final** : Citation en grand, centrée

### Texte Minimal
```
Topologies:
[Icon] Point-à-Point  [Icon] ESB  [Icon] Message Bus  [Icon] Service Mesh

Tendances:
Serverless → Edge Computing → AI/ML → Low-Code

"Le choix de la topologie est une décision stratégique"
```

---

## 🎬 Animations (Optionnelles mais Recommandées)

### Slide 9 (E-commerce)
- **Entrance** : Diagramme apparaît progressivement (de gauche à droite)
- **Flèches** : Animation de flux des données (1 seconde par flèche)
- **Highlight** : API Gateway pulse au début

### Slide 10 (SOA vs Microservices)
- **Split animation** : Deux diagrammes apparaissent simultanément
- **Tableau** : Lignes apparaissent une par une (si temps)
- **Highlight** : Criteres importants en surbrillance

### Slide 11 (API Economy)
- **Composants** : API Management apparaît en couches (Gateway d'abord, puis Security, etc.)
- **Logos** : Apparaissent autour du diagramme central

### Slide 12 (Conclusion)
- **Topologies** : Apparaissent une par une
- **Timeline** : Avance de gauche à droite
- **Message final** : Apparaît en dernier, effet "fade in"

---

## 📐 Dimensions & Spécifications

### Slide Size
- **Standard** : 16:9 (1920x1080)
- **Pour impression** : Format également disponible en 4:3 si nécessaire

### Diagrammes
- **Taille minimale** : 1200px de largeur
- **Haute résolution** : 300 DPI pour impression
- **Format source** : .drawio (modifiable)
- **Format export** : PNG transparent ou SVG

### Typographie
- **Titre principal** : 44-48pt
- **Sous-titres** : 28-32pt
- **Corps de texte** : 18-20pt (minimum 16pt)
- **Annotations diagrammes** : 12-14pt

---

## ✅ Checklist Avant Présentation

- [ ] Tous les diagrammes sont chargés et visibles
- [ ] Les animations sont testées
- [ ] Les polices sont installées (Montserrat, Open Sans)
- [ ] Les couleurs sont cohérentes sur tous les slides
- [ ] Les icônes sont de la même famille (FlatIcon, Icons8, etc.)
- [ ] Les liens hypertexte fonctionnent (si présents)
- [ ] La présentation fonctionne sur l'ordinateur de présentation
- [ ] Backup PDF exporté (au cas où)

---

## 🎨 Ressources Visuelles Recommandées

### Icônes
- **Flaticon** : https://www.flaticon.com (gratuit avec attribution)
- **Icons8** : https://icons8.com
- **The Noun Project** : https://thenounproject.com

### Images de Fond (si nécessaire)
- **Unsplash** : https://unsplash.com (gratuit, haute qualité)
- Thème : Technology, Business, Architecture

### Couleurs Professionnelles
- **Bleu principal** : #2C3E50
- **Bleu accent** : #3498DB
- **Vert** : #27AE60
- **Orange** : #E67E22
- **Rouge (attention)** : #E74C3C
- **Gris texte** : #7F8C8D






