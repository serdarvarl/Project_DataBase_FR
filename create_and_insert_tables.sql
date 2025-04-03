CREATE TABLE societe (
  `siren` VARCHAR(20),
  `denomination` TEXT,
  `postal_code` VARCHAR(10),
  `town` TEXT,
  `ape` TEXT
);

INSERT INTO societe (`siren`, `denomination`, `postal_code`, `town`, `ape`)
SELECT `siren`, `denomination`, `postal_code`, `town`, `ape` FROM raw_data;

CREATE TABLE chiffre_affire (
  `siren` VARCHAR(20),
  `year` INT,
  `Ventes de marchandises` FLOAT,
  `Production vendue biens` FLOAT,
  `Production vendue services` FLOAT,
  `Chiffres d’affaires nets` FLOAT,
  `Production stockée` FLOAT,
  `Production immobilisée` FLOAT,
  `Subventions d’exploitation` FLOAT,
  `Reprises sur amortissements et provisions, transfert de charges` FLOAT,
  `Autres produits` FLOAT
);

INSERT INTO chiffre_affire (`siren`, `year`, `Ventes de marchandises`, `Production vendue biens`, `Production vendue services`, `Chiffres d’affaires nets`, `Production stockée`, `Production immobilisée`, `Subventions d’exploitation`, `Reprises sur amortissements et provisions, transfert de charges`, `Autres produits`)
SELECT `siren`, `year`, `Ventes de marchandises`, `Production vendue biens`, `Production vendue services`, `Chiffres d’affaires nets`, `Production stockée`, `Production immobilisée`, `Subventions d’exploitation`, `Reprises sur amortissements et provisions, transfert de charges`, `Autres produits` FROM raw_data;

CREATE TABLE produit_chifre (
  `siren` VARCHAR(20),
  `year` INT,
  `Produits financiers de participations` FLOAT,
  `Produits des autres valeurs mobilières et créances de l’actif immobilisé` FLOAT,
  `Autres intérêts et produits assimilés` FLOAT,
  `Reprises sur provisions et transferts de charges financier` FLOAT,
  `Différences positives de change` FLOAT,
  `Produits nets sur cessions de valeurs mobilières de placement` FLOAT,
  `Produits exceptionnels sur opérations de gestion` FLOAT,
  `Produits exceptionnels sur opérations en capital` FLOAT,
  `Reprises sur provisions et transferts de charges exceptionnel` FLOAT,
  `Total des produits exceptionnels` FLOAT,
  `Dividendes` FLOAT
);

INSERT INTO produit_chifre (`siren`, `year`, `Produits financiers de participations`, `Produits des autres valeurs mobilières et créances de l’actif immobilisé`, `Autres intérêts et produits assimilés`, `Reprises sur provisions et transferts de charges financier`, `Différences positives de change`, `Produits nets sur cessions de valeurs mobilières de placement`, `Produits exceptionnels sur opérations de gestion`, `Produits exceptionnels sur opérations en capital`, `Reprises sur provisions et transferts de charges exceptionnel`, `Total des produits exceptionnels`, `Dividendes`)
SELECT `siren`, `year`, `Produits financiers de participations`, `Produits des autres valeurs mobilières et créances de l’actif immobilisé`, `Autres intérêts et produits assimilés`, `Reprises sur provisions et transferts de charges financier`, `Différences positives de change`, `Produits nets sur cessions de valeurs mobilières de placement`, `Produits exceptionnels sur opérations de gestion`, `Produits exceptionnels sur opérations en capital`, `Reprises sur provisions et transferts de charges exceptionnel`, `Total des produits exceptionnels`, `Dividendes` FROM raw_data;

CREATE TABLE charge_chifre (
  `siren` VARCHAR(20),
  `year` INT,
  `Autres impôts, taxes et versements assimilés` FLOAT,
  `Achats de marchandises (y compris droits de douane)` FLOAT,
  `Variation de stock (marchandises)` FLOAT,
  `Achats de matières premières et autres approvisionnements` FLOAT,
  `Variation de stock (matières premières et approvisionnements)` FLOAT,
  `Autres achats et charges externes` FLOAT,
  `Impôts, taxes et versements assimilés` FLOAT,
  `Salaires et traitements` FLOAT,
  `Charges sociales` FLOAT,
  `Autres charges` FLOAT
);

INSERT INTO charge_chifre (`siren`, `year`, `Autres impôts, taxes et versements assimilés`, `Achats de marchandises (y compris droits de douane)`, `Variation de stock (marchandises)`, `Achats de matières premières et autres approvisionnements`, `Variation de stock (matières premières et approvisionnements)`, `Autres achats et charges externes`, `Impôts, taxes et versements assimilés`, `Salaires et traitements`, `Charges sociales`, `Autres charges`)
SELECT `siren`, `year`, `Autres impôts, taxes et versements assimilés`, `Achats de marchandises (y compris droits de douane)`, `Variation de stock (marchandises)`, `Achats de matières premières et autres approvisionnements`, `Variation de stock (matières premières et approvisionnements)`, `Autres achats et charges externes`, `Impôts, taxes et versements assimilés`, `Salaires et traitements`, `Charges sociales`, `Autres charges` FROM raw_data;

CREATE TABLE compteresulta (
  `siren` VARCHAR(20),
  `year` INT,
  `Résultat d'exploitation` FLOAT,
  `Résultat financier` FLOAT,
  `Résultat en cours avant impôts` FLOAT,
  `Résultat exceptionnel` FLOAT,
  `Total des produits` FLOAT,
  `Total des charges` FLOAT,
  `Bénéfices ou perte (Total des produits ‐ Total des charges)` FLOAT
);

INSERT INTO compteresulta (`siren`, `year`, `Résultat d'exploitation`, `Résultat financier`, `Résultat en cours avant impôts`, `Résultat exceptionnel`, `Total des produits`, `Total des charges`, `Bénéfices ou perte (Total des produits ‐ Total des charges)`)
SELECT `siren`, `year`, `Résultat d'exploitation`, `Résultat financier`, `Résultat en cours avant impôts`, `Résultat exceptionnel`, `Total des produits`, `Total des charges`, `Bénéfices ou perte (Total des produits ‐ Total des charges)` FROM raw_data;

