# Script Détaillé - Speaker 3: Cas d'Usage & Évolution

**Durée totale**: 9 minutes  
**Temps par slide**: Slide 9 (3 min) | Slide 10 (3 min) | Slide 11 (2 min) | Slide 12 (1 min)

---

## 🎯 SLIDE 9: Cas d'Usage Réels dans l'Entreprise Engagée (3 minutes)

### [AFFICHER SLIDE 9 - Architecture E-commerce]

**Script:**

Bonjour à tous. Je suis [votre nom], et je vais vous présenter des cas d'usage réels qui illustrent comment les topologies de middleware sont déployées dans des entreprises engagées. Nous allons voir trois exemples concrets provenant de secteurs différents.

**[Pause - pointer le diagramme]**

Commençons par notre premier cas : une plateforme e-commerce moderne. Imaginez une entreprise qui traite **10,000 commandes par jour**, avec des pics à **500 commandes par heure**. Cette entreprise doit intégrer plusieurs systèmes hétérogènes.

**[Pointer les composants sur le diagramme]**

Nous avons les clients - web et mobile. Leur requête arrive d'abord sur un **API Gateway** - ici Kong ou AWS API Gateway - qui sert de point d'entrée unique. Cet API Gateway gère la sécurité, le rate limiting, et l'authentification.

**[Pointer l'ESB/Message Bus]**

Ensuite, nous avons une architecture hybride : un **ESB** - dans ce cas WSO2 Enterprise Integrator - couplé à un **Message Bus** Apache Kafka. Pourquoi cette combinaison ?

**[Pause pour laisser réfléchir]**

L'ESB gère la transformation critique : nous avons ici un **ERP SAP** qui utilise uniquement **SOAP/XML**, alors que tous les autres systèmes - le CRM Salesforce, Stripe pour les paiements, et les services de livraison - utilisent **REST/JSON**. L'ESB effectue cette transformation en temps réel.

**[Pointer Kafka]**

Kafka, en parallèle, traite les commandes de manière asynchrone. Cela permet de découpler le processus et d'assurer une scalabilité élevée. Les patterns EIP utilisés ici sont le **Content-Based Router** - pour router selon le type de produit - et le **Content Enricher** - pour enrichir la commande avec les données client depuis le CRM.

**Question rhétorique**: "Qui parmi vous a déjà travaillé avec des APIs comme Stripe ou PayPal ?" **[Pause pour regarder l'audience]**

Les défis principaux sont : la transformation de protocoles, le volume élevé nécessitant une scalabilité horizontale, et une tres haute disponibilité qui exige une architecture résiliente.

---

### [AFFICHER SLIDE 9b - Architecture Banque]

**[Transition]** Passons maintenant à un cas plus complexe : une grande banque. Ici, nous voyons parfaitement pourquoi la **topologie Hub-and-Spoke avec ESB** est le choix architectural optimal pour une entreprise engagée avec des systèmes legacy.

**[Pointer le diagramme de haut en bas]**

Regardons l'architecture complète. En haut, nous avons trois types de clients : applications mobiles, web, et APIs pour partenaires. Tous arrivent sur un **API Gateway** - point d'entrée unique qui gère OAuth 2.0, rate limiting, et la terminaison SSL/TLS.

**[Pointer l'ESB]**

Ensuite, le cœur de l'architecture : un **ESB IBM Integration Bus**. C'est ici que nous voyons la **topologie Hub-and-Spoke** en action. Pourquoi cette topologie pour une banque ? 

**[Pause pour laisser réfléchir]**

Premièrement, nous avons **plusieurs systèmes legacy hétérogènes** - un mainframe IBM avec COBOL et CICS, un AS/400 avec RPG, et une base de données DB2. Sans ESB, nous aurions besoin de connexions point-à-point entre chaque application moderne et chaque système legacy - c'est ingérable. L'ESB centralise toutes ces intégrations.

**[Pointer les adapters]**

Deuxièmement, la transformation de protocoles est complexe. L'ESB utilise des **adapters spécialisés** - un CICS Adapter qui traduit COBOL vers JSON, un Mainframe Adapter pour le protocole 3270 vers REST, et un Database Adapter pour DB2. C'est le pattern **Message Translator** appliqué à chaque protocole legacy.

**[Pointer le Circuit Breaker]**

Troisièmement, et c'est critique : la **résilience**. Entre l'ESB et les adapters, nous avons une couche **Circuit Breaker**. Pourquoi ici ? Les systèmes legacy peuvent être lents - parfois 5, 10 secondes pour répondre - ou complètement indisponibles. Le Circuit Breaker surveille chaque requête. Si un mainframe ne répond pas dans les 3 secondes, le circuit s'ouvre et retourne immédiatement des données en cache ou un message d'erreur gracieux. Sans ça, une panne de mainframe ferait planter toutes les applications mobiles - inacceptable pour une banque.

**[Pointer les badges PCI-DSS/GDPR en haut]**

Enfin, la **gouvernance centralisée**. En haut du diagramme, vous voyez les badges PCI-DSS et GDPR. L'ESB centralise la gestion de toutes les politiques de sécurité, l'audit trail complet, le chiffrement - essentiel pour la conformité réglementaire bancaire.

**Pourquoi Hub-and-Spoke et pas Message Bus ici ?** Les systèmes legacy sont **synchrones** par nature - une transaction bancaire doit être validée immédiatement. Un Message Bus asynchrone ne conviendrait pas. L'ESB permet l'orchestration synchrone tout en gérant la complexité des transformations.

Cette architecture illustre parfaitement comment une **topologie centralisée** est adaptée quand vous avez beaucoup de systèmes legacy avec des protocoles propriétaires, et des exigences strictes de gouvernance et de conformité.

---

### [AFFICHER SLIDE 9c - Architecture Santé]

**[Transition]** Dernier cas : un hôpital moderne. Ici, nous voyons une **topologie Message Bus** - très différente de l'ESB centralisé de la banque.

**[Pointer le diagramme de haut en bas]**

Regardons l'architecture. En haut, les **applications hospitalières** - systèmes EMR, postes cliniques - publient des messages HL7. Ces messages arrivent sur un **HL7/FHIR Gateway** qui transforme les différents standards : HL7 v2, v3, vers FHIR - le standard moderne basé sur REST/JSON.

**[Pointer le Message Bus]**

Ensuite, le cœur de l'architecture : un **Message Bus RabbitMQ**. C'est ici que nous voyons la **topologie Message Bus** en action - décentralisée et asynchrone. Pourquoi cette topologie pour un hôpital ?

**[Pause]**

Le pattern **Publish-Subscribe** est essentiel. Quand un laboratoire publie de nouveaux résultats d'analyse, plusieurs systèmes doivent être notifiés **simultanément** - le SIH pour mettre à jour le dossier patient, la pharmacie pour vérifier les interactions médicamenteuses, et l'assurance maladie pour le remboursement. Avec un ESB centralisé, il faudrait orchestrer ces appels séquentiellement. Le Message Bus permet la notification simultanée et découplée.

**[Pointer les systèmes hospitaliers]**

Vous voyez les flèches pointillées - c'est le Publish-Subscribe. Un message, plusieurs destinataires. Le laboratoire ne connaît même pas qui va recevoir le message - c'est le Message Bus qui route.

**[Pointer Message Store]**

À gauche, le **Message Store** archive tous les messages - requis légalement pour les données médicales. Traçabilité complète pour la conformité HIPAA et GDPR.

**[Pointer les badges en haut]**

En haut, les badges HIPAA, GDPR, et les standards HL7/FHIR/DICOM indiquent la conformité de l'architecture entière.

**Pourquoi Message Bus et pas ESB ici ?** Les notifications médicales sont **asynchrones** par nature - un résultat de labo n'a pas besoin d'être traité immédiatement. Le Message Bus permet cette communication asynchrone et multi-cast, parfait pour les environnements hospitaliers où plusieurs systèmes doivent être informés simultanément.

Cette architecture illustre comment la **topologie Message Bus** est adaptée pour les communications asynchrones et les notifications multi-systèmes.

---

## 🎯 SLIDE 10: SOA vs Microservices - Comparaison Technique (3 minutes)

### [AFFICHER SLIDE 10 - Tableau Comparatif avec Diagrammes]

**Script:**

Maintenant, comparons deux paradigmes architecturaux majeurs : **SOA avec ESB** versus **Microservices**. C'est un choix stratégique qui impacte toute l'architecture d'une entreprise engagée.

**[Pointer le diagramme ESB à gauche]**

SOA avec ESB : architecture **centralisée**. Tous les services communiquent via le bus d'entreprise. La gouvernance est centralisée - une seule équipe gère les transformations, les routages, les politiques de sécurité. 

**Avantages techniques** : Excellente pour intégrer des systèmes legacy, transformation complexe SOAP/REST facilitée, visibilité centralisée de tous les flux.

**[Pointer le diagramme Microservices à droite]**

Microservices : architecture **décentralisée**. Chaque service est indépendant, avec sa propre base de données. Communication via REST ou gRPC, souvent avec un Service Mesh pour la gestion du trafic.

**Avantages techniques** : Scalabilité horizontale indépendante par service, déploiement indépendant permettant des releases fréquentes, polyglot - chaque service peut utiliser la technologie optimale.

**[Pointer le tableau comparatif]**

Regardons les critères de choix :

**Nombre de systèmes** : Moins de 5 systèmes ? Le coût d'un ESB n'est peut-être pas justifié. Plus de 10 ? L'ESB devient intéressant pour réduire la complexité.

**Types de systèmes** : Systèmes legacy nombreux ? ESB. Systèmes modernes cloud-native ? Microservices.

**Volume** : Faible volume ? ESB suffit. Très haut volume - millions de transactions par jour ? Message Bus avec microservices.

**[Question à l'audience]** "Selon vous, pour un projet de fin d'études avec 3-4 services, quelle approche serait la plus appropriée ?" **[Pause, écouter les réponses]**

**Stratégies de migration** : Souvent, les entreprises utilisent une approche hybride - garder l'ESB pour les systèmes legacy, utiliser des microservices pour les nouvelles fonctionnalités, avec un API Gateway pour unifier l'accès. C'est le **Strangler Fig Pattern** : on enveloppe progressivement le legacy sans tout casser d'un coup.

---

## 🎯 SLIDE 11: Middleware dans l'Économie de Services (2 minutes)

### [AFFICHER SLIDE 11 - API Economy Diagram]

**Script:**

Nous arrivons maintenant à un point crucial : les APIs ne sont plus seulement des interfaces techniques. Elles sont devenues des **produits à part entière** - c'est ce qu'on appelle l'**API Economy**.

**[Pointer les exemples sur le slide]**

Stripe - API de paiement utilisée par des centaines de milliers d'entreprises. Twilio pour les communications. Google Maps API. AWS expose tous ses services via des APIs. Ces APIs génèrent des revenus directs.

**[Pointer API Management Platform]**

Pour gérer ces APIs comme des produits, nous avons besoin d'une plateforme d'**API Management** complète :

**API Gateway** : Point d'entrée unique, routage, load balancing.

**Security** : OAuth 2.0, API Keys, rate limiting pour protéger contre les abus, chiffrement mTLS.

**Analytics** : Métriques d'utilisation, performance en temps réel, détection d'anomalies. Business metrics : combien de revenus génère chaque API ?

**Developer Portal** : Documentation interactive Swagger, SDKs dans différents langages, gestion des clés API, support développeurs.

**[Pointer les patterns modernes]**

Patterns d'intégration modernes :

**Backend for Frontend (BFF)** : Au lieu d'une API unique, vous créez des APIs optimisées par client - une API mobile simplifiée avec moins de données, une API web complète. Chaque frontend a exactement ce dont il a besoin.

**API Composition** : Combiner plusieurs microservices APIs pour créer une API métier cohérente. Par exemple, une API "Order Details" qui agrège Order Service + Customer Service + Product Service.

**Event-Driven Integration** : Au lieu d'appels synchrones continus, on utilise des événements. Un changement d'état déclenche automatiquement des notifications - beaucoup plus efficace et scalable.

---

## 🎯 SLIDE 12: Conclusion & Perspectives (1 minute)

### [AFFICHER SLIDE 12 - Synthèse Visuelle]

**Script:**

Pour conclure, synthétisons les topologies de middleware pour une entreprise engagée :

**[Pointer chaque topologie rapidement]**

**Point-à-Point** : Simple, mais non scalable au-delà de quelques systèmes.

**ESB** : Centralisé, excellent pour les systèmes legacy, transformation complexe.

**Message Bus** : Asynchrone, hautement scalable, adapté aux microservices et événements.

**Service Mesh** : Décentralisé, cloud-native, pour les architectures modernes distribuées.

**[Pointer la matrice de décision]**

Le choix dépend de plusieurs facteurs : nombre de systèmes, types de systèmes, volume de données, contraintes de temps réel, budget, et compétences de l'équipe.

**[Pointer les tendances futures]**

Les tendances futures que nous observons :

**Serverless Integration** : Functions as a Service - plus de gestion d'infrastructure, pay-per-use.

**Edge Computing** : Traitement à la périphérie pour réduire la latence - crucial pour l'IoT.

**AI/ML dans l'intégration** : Routage intelligent, détection d'anomalies automatique, optimisation des performances.

**Low-Code/No-Code** : Plateformes visuelles permettant aux non-développeurs de créer des intégrations.

**[Pause solennelle]**

**Message final** : Le choix de la topologie de middleware n'est pas une décision technique isolée. C'est une **décision stratégique** qui impacte l'agilité, la scalabilité, et les coûts de votre entreprise. Il n'y a pas de solution unique - la meilleure architecture est celle qui correspond aux besoins spécifiques de votre organisation.

**[Transition vers la partie pratique]**

Maintenant que nous avons vu la théorie et les cas d'usage concrets, passons à la pratique ! Vous allez pouvoir appliquer ces concepts à un scénario réel. [Nom de l'animateur], c'est à toi !

**[Remerciement]** Merci pour votre attention. Questions ?

---

## 📝 Notes pour le Présentateur

### Timing
- **Slide 9** : 3 minutes exactes (1 min par cas d'usage)
- **Slide 10** : 3 minutes (comparaison technique approfondie)
- **Slide 11** : 2 minutes (API Economy - rapide mais impactant)
- **Slide 12** : 1 minute (conclusion percutante)
- **Total** : 9 minutes

### Interactions
- Posez **2 questions maximum** à l'audience (une sur Stripe/Twilio, une sur le projet de fin d'études)
- Regardez l'audience, pas seulement l'écran
- Utilisez le pointeur laser pour pointer les éléments du diagramme

### Ton
- Technique mais accessible
- Enthousiaste mais professionnel
- Confiant - vous maîtrisez le sujet

### Gestes
- Pointez les diagrammes pour guider l'attention
- Pausez après les questions techniques pour laisser réfléchir
- Variez le rythme - accélérez sur les détails, ralentissez sur les concepts clés


