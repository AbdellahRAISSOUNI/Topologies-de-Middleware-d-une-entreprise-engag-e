# Guide des Diagrammes - Speaker 3

## 📁 Fichiers Disponibles

Tous les diagrammes sont dans le dossier `Diagrams/` :

1. **diagram_ecommerce.drawio** - Architecture E-commerce
2. **diagram_banque.drawio** - Architecture Banque/Legacy
3. **diagram_sante.drawio** - Architecture Santé/HL7
4. **diagram_soa_vs_microservices.drawio** - Comparaison SOA vs Microservices
5. **diagram_api_economy.drawio** - API Economy & API Management

## 🔧 Comment Utiliser ces Diagrammes

### Option 1 : Lucidchart

1. Ouvrez [Lucidchart](https://www.lucidchart.com)
2. Créez un nouveau diagramme
3. **Import** → **Import from** → Sélectionnez le fichier `.drawio`
4. Les diagrammes s'afficheront avec tous les éléments

### Option 2 : draw.io (diagrams.net)

1. Allez sur [draw.io](https://app.diagrams.net) ou [diagrams.net](https://www.diagrams.net)
2. **File** → **Open from** → Sélectionnez le fichier `.drawio`
3. Modifiez selon vos besoins
4. Exportez en PNG/SVG haute résolution

### Option 3 : Visual Studio Code

1. Installez l'extension "Draw.io Integration"
2. Ouvrez le fichier `.drawio`
3. Éditez directement dans VS Code

## 🎨 Placeholders pour Icônes

Les diagrammes contiennent des placeholders `{nom-icon}` que vous devez remplacer par de vraies icônes.

### Liste des Placeholders à Remplacer

#### diagram_ecommerce.drawio
- `{web-icon}` - Icône navigateur/web
- `{mobile-icon}` - Icône téléphone mobile
- `{api-gateway-icon}` - Icône gateway/routeur
- `{server-icon}` - Icône serveur
- `{esb-icon}` - Icône bus/middleware
- `{kafka-icon}` - Logo Apache Kafka (optionnel)
- `{database-icon}` - Icône base de données
- `{cloud-icon}` - Icône cloud
- `{payment-icon}` - Icône paiement/carte
- `{truck-icon}` - Icône camion/livraison
- `{notification-icon}` - Icône notification/bell

#### diagram_banque.drawio
- `{mobile-icon}` - Icône mobile
- `{web-icon}` - Icône web
- `{api-icon}` - Icône API
- `{api-gateway-icon}` - Icône gateway
- `{esb-icon}` - Icône ESB
- `{adapter-icon}` - Icône adaptateur/connecteur
- `{cics-icon}` - Icône CICS/mainframe
- `{mainframe-icon}` - Icône mainframe/serveur
- `{db-icon}` - Icône base de données
- `{breaker-icon}` - Icône circuit breaker/switch
- `{lock-icon}` - Icône cadenas/sécurité

#### diagram_sante.drawio
- `{hospital-icon}` - Icône hôpital/croix
- `{gateway-icon}` - Icône gateway
- `{rabbitmq-icon}` - Logo RabbitMQ (optionnel)
- `{database-icon}` - Icône base de données
- `{microscope-icon}` - Icône microscope/laboratoire
- `{pill-icon}` - Icône pilule/pharmacie
- `{xray-icon}` - Icône rayons X/imagerie
- `{insurance-icon}` - Icône assurance
- `{storage-icon}` - Icône stockage/archive
- `{lock-icon}` - Icône cadenas

#### diagram_soa_vs_microservices.drawio
- `{service-icon}` - Icône service/application
- `{esb-icon}` - Icône ESB
- `{database-icon}` - Icône base de données
- `{ms-icon}` - Icône microservice/container
- `{api-gateway-icon}` - Icône API Gateway
- `{mesh-icon}` - Icône mesh/réseau
- `{arrow-icon}` - Flèche migration

#### diagram_api_economy.drawio
- `{partner-icon}` - Icône partenaire/entreprise
- `{mobile-icon}` - Icône mobile
- `{web-icon}` - Icône web
- `{external-icon}` - Icône externe/3rd party
- `{api-gateway-icon}` - Icône gateway
- `{platform-icon}` - Icône plateforme
- `{lock-icon}` - Icône sécurité
- `{chart-icon}` - Icône graphique/analytics
- `{code-icon}` - Icône code/developeur
- `{compose-icon}` - Icône composition/agrégation
- `{api-icon}` - Icône API
- `{event-icon}` - Icône événement
- `{stripe-icon}` - Logo Stripe
- `{twilio-icon}` - Logo Twilio
- `{aws-icon}` - Logo AWS
- `{google-icon}` - Logo Google

## 📚 Sources d'Icônes Recommandées

### Gratuites (avec attribution)
- **Flaticon** : https://www.flaticon.com
- **Icons8** : https://icons8.com
- **The Noun Project** : https://thenounproject.com
- **Font Awesome** : https://fontawesome.com (pour les icônes système)

### Premium (meilleure qualité)
- **Icons8 Premium** : Icônes cohérentes
- **Noun Project Pro** : Style professionnel

## 🔄 Processus de Remplissage

1. **Ouvrir le diagramme** dans Lucidchart/draw.io
2. **Identifier les placeholders** : Recherchez `{nom-icon}`
3. **Remplacer** : 
   - Supprimez le texte `{nom-icon}`
   - Importez votre icône (PNG/SVG)
   - Redimensionnez si nécessaire
   - Alignez correctement
4. **Cohérence** : Utilisez la même famille d'icônes partout
5. **Export** : Exportez en PNG 300 DPI pour PowerPoint

## 🎨 Style des Icônes

### Recommandations
- **Style** : Flat design, moderne
- **Couleurs** : Cohérentes avec le thème (bleu, vert, orange)
- **Taille** : 32x32px à 64x64px selon le contexte
- **Format** : SVG (meilleur) ou PNG haute résolution
- **Transparence** : Fond transparent recommandé

### Palette de Couleurs
- **Bleu** : #3498DB (composants principaux)
- **Vert** : #27AE60 (succès, données)
- **Orange** : #E67E22 (warnings, sécurité)
- **Rouge** : #E74C3C (erreurs, critiques)
- **Gris** : #95A5A6 (neutres)

## ✅ Checklist Avant Présentation

- [ ] Tous les placeholders sont remplacés par de vraies icônes
- [ ] Les icônes sont cohérentes (même style/famille)
- [ ] Les diagrammes sont exportés en haute résolution (300 DPI)
- [ ] Les diagrammes s'affichent correctement dans PowerPoint
- [ ] Les textes sont lisibles (taille de police ≥ 11pt)
- [ ] Les couleurs sont cohérentes avec le thème PowerPoint
- [ ] Les flèches et connexions sont claires
- [ ] Les labels sont corrects et sans fautes

## 🔍 Détails Techniques

### Format des Fichiers
- **Format source** : `.drawio` (XML)
- **Format export PowerPoint** : PNG (recommandé) ou SVG
- **Résolution** : 300 DPI minimum pour impression/présentation

### Compatibilité
- ✅ Lucidchart : Compatible 100%
- ✅ draw.io / diagrams.net : Natif
- ✅ Visual Studio Code : Avec extension
- ✅ PowerPoint : Import PNG/SVG

## 💡 Conseils Pro

1. **Groupez les éléments** : Dans Lucidchart, groupez les éléments connexes pour faciliter le déplacement
2. **Utilisez des layers** : Créez des calques pour les icônes, le texte, les flèches
3. **Alignez proprement** : Utilisez les outils d'alignement de Lucidchart
4. **Export progressif** : Exportez chaque diagramme individuellement
5. **Backup** : Gardez une version avec les placeholders au cas où

## 📞 Support

Si vous avez des problèmes avec les diagrammes :
1. Vérifiez que vous utilisez une version récente de Lucidchart/draw.io
2. Essayez d'ouvrir dans draw.io d'abord, puis importez dans Lucidchart
3. Les placeholders `{nom-icon}` peuvent être supprimés si vous n'avez pas d'icônes - le diagramme restera fonctionnel






