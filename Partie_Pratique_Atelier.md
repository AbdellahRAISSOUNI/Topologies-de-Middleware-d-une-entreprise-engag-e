# Partie Pratique - Atelier Middleware

**Durée**: 20-30 minutes  
**Animateur**: 4ème personne du groupe  
**Objectif**: Appliquer les concepts théoriques à un scénario réel

---

## 📋 Scénario Détaillé

### Contexte de l'Entreprise

**E-Commerce "TechStore"** est une entreprise en croissance qui vend des produits électroniques en ligne. L'entreprise a connu une croissance rapide et doit maintenant intégrer plusieurs systèmes pour améliorer son efficacité opérationnelle.

### Systèmes à Intégrer

1. **ERP Legacy (SAP R/3)**
   - Gère: Inventaire, commandes, facturation
   - Protocole: **SOAP/XML uniquement**
   - Performance: Traitement de 5,000 commandes/jour
   - Disponibilité: 99.5% (maintenance planifiée le dimanche)

2. **CRM Moderne (Salesforce)**
   - Gère: Clients, campagnes marketing, service client
   - Protocole: **REST/JSON**
   - Performance: 10,000+ requêtes/jour
   - Disponibilité: 99.9%

3. **Système de Paiement (Stripe)**
   - Gère: Traitement des paiements en ligne
   - Protocole: **REST/JSON**
   - Performance: Traitement en temps réel
   - Disponibilité: 99.99%

4. **Service de Livraison Externe (API Partenaire)**
   - Gère: Calcul des frais de livraison, suivi des colis
   - Protocole: **REST/JSON**
   - Performance: Latence variable (100-500ms)
   - Disponibilité: 98% (peut être indisponible)

5. **Système de Notifications en Temps Réel**
   - Gère: Emails transactionnels, SMS, notifications push
   - Protocole: **REST/JSON**
   - Performance: 20,000+ notifications/jour
   - Disponibilité: 99%

### Flux Métier à Implémenter

**Flux: Traitement d'une Commande**

1. **Création de commande** (depuis le site web)
   - Client passe commande → Validation du stock (ERP)
   - Enrichissement avec données client (CRM)
   - Calcul des frais de livraison (Service externe)
   - Traitement du paiement (Stripe)
   - Création de la commande dans l'ERP
   - Mise à jour du CRM (historique client)
   - Envoi de notifications (email de confirmation, SMS)

2. **Contraintes Techniques**
   - Volume: **10,000 commandes/jour** (pic: 500 commandes/heure)
   - Disponibilité requise: **99.9%**
   - Latence acceptable: < 2 secondes pour la réponse au client
   - Gestion des erreurs: Retry automatique en cas d'échec
   - Audit: Toutes les transactions doivent être tracées

3. **Défis Spécifiques**
   - **Transformation SOAP ↔ REST**: ERP utilise SOAP, autres systèmes utilisent REST
   - **Résilience**: Le service de livraison peut être indisponible
   - **Performance**: Traitement de 500 commandes/heure en pic
   - **Cohérence**: S'assurer que toutes les étapes sont complétées ou rollback

---

## 🎯 Mission des Participants

### Tâche Principale

**En groupes de 2-3 personnes**, concevoir une architecture de middleware pour intégrer tous ces systèmes et supporter le flux de traitement de commande.

### Livrables Attendus (15 minutes)

Chaque groupe doit produire:

1. **Diagramme d'Architecture** (sur papier ou tableau)
   - Représenter tous les systèmes
   - Montrer la topologie choisie (ESB, Message Bus, hybride, etc.)
   - Indiquer les flux de données

2. **Justification des Choix** (à présenter oralement)
   - Pourquoi cette topologie?
   - Quels patterns EIP sont utilisés?
   - Comment gérer les défis (transformation, résilience, performance)?

3. **Identification des Patterns EIP**
   - Lister les patterns utilisés
   - Expliquer leur rôle dans l'architecture

### Questions à Réfléchir

- Quelle topologie choisir? (Point-à-Point, ESB, Message Bus, hybride)
- Comment gérer la transformation SOAP ↔ REST?
- Comment assurer la résilience si le service de livraison tombe?
- Comment scaler pour gérer 500 commandes/heure en pic?
- Comment garantir la cohérence des données?

---

## 📝 Guide pour l'Animateur

### Phase 1: Présentation du Scénario (5 minutes)

1. **Lire le scénario** (2 min)
   - Présenter l'entreprise et les systèmes
   - Expliquer le flux métier
   - Mentionner les contraintes

2. **Clarifier les attentes** (2 min)
   - Expliquer les livrables
   - Montrer un exemple de diagramme simple
   - Répondre aux questions

3. **Former les groupes** (1 min)
   - Diviser la classe en groupes de 2-3
   - S'assurer que chaque groupe a du papier et des stylos

### Phase 2: Travail en Groupe (15 minutes)

**Rôle de l'animateur**:
- Circuler entre les groupes
- Répondre aux questions techniques
- Donner des indices si un groupe est bloqué
- S'assurer que tous progressent

**Indices à donner si nécessaire**:
- "Pensez à la transformation SOAP/REST - quel pattern EIP pourrait aider?"
- "Comment gérer l'indisponibilité du service de livraison?"
- "Pour le volume élevé, quelle topologie serait la plus scalable?"

**Points à vérifier**:
- Les groupes identifient bien la nécessité de transformation
- Ils pensent à la résilience
- Ils considèrent la scalabilité

### Phase 3: Présentation des Solutions (10 minutes)

**Format**:
- 2-3 groupes présentent leur solution (3 minutes chacun)
- Chaque présentation doit inclure:
  - Le diagramme d'architecture
  - La topologie choisie et pourquoi
  - Les patterns EIP utilisés
  - Comment ils gèrent les défis

**Rôle de l'animateur**:
- Modérer les présentations
- Poser des questions de clarification
- Encourager la discussion comparative
- Mettre en évidence les bonnes pratiques

**Questions à poser après chaque présentation**:
- "Pourquoi avez-vous choisi cette topologie plutôt qu'une autre?"
- "Comment gérez-vous la transformation SOAP/REST?"
- "Que se passe-t-il si le service de livraison tombe?"
- "Comment scaleriez-vous cette architecture?"

### Phase 4: Discussion Comparative (5 minutes)

**Points à discuter**:
- Comparer les différentes approches
- Identifier les avantages/inconvénients de chaque solution
- Discuter des compromis (complexité vs performance, coût vs scalabilité)

**Synthèse**:
- Il n'y a pas de solution unique
- Le choix dépend des contraintes (volume, budget, compétences)
- Les patterns EIP sont des outils réutilisables

---

## 💡 Solutions Attendues (Référence pour l'Animateur)

### Solution Recommandée: Architecture Hybride

**Topologie**: ESB + Message Bus

**Architecture**:
```
Site Web
    ↓
API Gateway (Kong/AWS API Gateway)
    ↓
┌─────────────────────────────────────┐
│  ESB (WSO2/IBM)                     │
│  - Transformation SOAP ↔ REST       │
│  - Routage                          │
│  - Orchestration                    │
└─────────────────────────────────────┘
    ↓
┌─────────────────────────────────────┐
│  Message Bus (Kafka)                │
│  - Traitement asynchrone            │
│  - Scalabilité                      │
└─────────────────────────────────────┘
    ↓
ERP (SAP)  CRM  Paiement  Livraison  Notifications
```

**Justification**:
- **ESB** pour la transformation SOAP/REST et l'orchestration
- **Message Bus** pour le traitement asynchrone et la scalabilité
- **API Gateway** pour l'entrée unique et la sécurité

**Patterns EIP utilisés**:
1. **Message Translator**: Transformation SOAP ↔ REST
2. **Content Enricher**: Enrichir la commande avec les données client
3. **Content-Based Router**: Router selon le type de produit
4. **Publish-Subscribe**: Notifications à plusieurs services
5. **Circuit Breaker**: Protection contre les pannes du service de livraison
6. **Retry Pattern**: Retry automatique en cas d'échec
7. **Message Store**: Stocker les commandes en échec pour traitement différé

**Gestion des défis**:
- **Transformation**: ESB avec médiateurs de transformation
- **Résilience**: Circuit breaker pour le service de livraison, retry pour les autres
- **Performance**: Message Bus pour traitement asynchrone, scalabilité horizontale
- **Cohérence**: Saga pattern ou compensation en cas d'échec partiel

### Alternatives Possibles

**Option 1: ESB Pur**
- Avantage: Simplicité, gouvernance centralisée
- Inconvénient: Goulot d'étranglement, scalabilité limitée
- Adapté si: Volume modéré, équipe centralisée

**Option 2: Message Bus Pur**
- Avantage: Scalabilité, performance
- Inconvénient: Transformation SOAP complexe, pas d'orchestration native
- Adapté si: Tous les systèmes utilisent REST, volume très élevé

**Option 3: Microservices avec Service Mesh**
- Avantage: Scalabilité, résilience, modernité
- Inconvénient: Complexité opérationnelle, nécessite adapter l'ERP
- Adapté si: Budget pour moderniser, équipe DevOps mature

---

## 📊 Matériel Nécessaire

- **Papier et stylos** pour chaque groupe
- **Tableau blanc ou paperboard** pour les présentations
- **Marqueurs de différentes couleurs**
- **Timer** pour gérer le temps
- **Exemple de diagramme** (à préparer à l'avance)

---

## ✅ Checklist de Préparation

- [ ] Préparer le scénario (imprimer ou projeter)
- [ ] Préparer un exemple de diagramme simple
- [ ] Tester le timing (5 min présentation + 15 min travail + 10 min présentation)
- [ ] Préparer des questions de suivi
- [ ] Avoir les solutions de référence en tête
- [ ] Préparer du matériel (papier, stylos, tableau)

---

## 🎓 Objectifs Pédagogiques de la Partie Pratique

À la fin de cette activité, les participants devraient être capables de:
1. Appliquer les concepts théoriques à un cas réel
2. Faire des compromis entre différentes approches
3. Identifier les patterns EIP appropriés
4. Justifier leurs choix architecturaux
5. Comprendre qu'il n'y a pas de solution unique




