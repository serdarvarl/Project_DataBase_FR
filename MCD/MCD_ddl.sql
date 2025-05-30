-- Generated by Mocodo 4.3.2

CREATE TABLE Ape_Gen (
  PRIMARY KEY (Ape),
  Ape      VARCHAR(42) NOT NULL,
  Ape_Name VARCHAR(42),
  Ape_Cat0 VARCHAR(42),
  Ape_Cat1 VARCHAR(42),
  Ape_Cat2 VARCHAR(42),
  Ape_Cat3 VARCHAR(42),
  Libelle  VARCHAR(42),
  Code     VARCHAR(42)
);

CREATE TABLE Charge_chifre (
  PRIMARY KEY (Siren_FK),
  Siren_FK VARCHAR(42) NOT NULL,
  FS       VARCHAR(42),
  FT       VARCHAR(42),
  FU       VARCHAR(42),
  FV       VARCHAR(42),
  FW       VARCHAR(42),
  FX       VARCHAR(42),
  FY       VARCHAR(42),
  FZ       VARCHAR(42),
  Gz_YX    VARCHAR(42),
  Annee    VARCHAR(42)
);

CREATE TABLE Chiffre_Affire (
  PRIMARY KEY (Siren_FK),
  Siren_FK VARCHAR(42) NOT NULL,
  FA       VARCHAR(42),
  FD       VARCHAR(42),
  FG       VARCHAR(42),
  FJ       VARCHAR(42),
  FM       VARCHAR(42),
  FN       VARCHAR(42),
  FO       VARCHAR(42),
  FP       VARCHAR(42),
  FQ       VARCHAR(42),
  FR       VARCHAR(42),
  Annee    VARCHAR(42)
);

CREATE TABLE Compte_Resulta (
  PRIMARY KEY (Siren_FK),
  Siren_FK                 VARCHAR(42) NOT NULL,
  Annee                    VARCHAR(42),
  Resultat_exploitation_GG VARCHAR(42),
  Resultat_financier_GV    VARCHAR(42),
  Resultat_avant_impots_GW VARCHAR(42),
  Resultat_exceptionnel_HI VARCHAR(42),
  Total_produits_HL        VARCHAR(42),
  Total_charges_HM         VARCHAR(42),
  Benefice_perte_HN        VARCHAR(42)
);

CREATE TABLE Produit_chifre (
  PRIMARY KEY (Siren_FK),
  Siren_FK VARCHAR(42) NOT NULL,
  GJ       VARCHAR(42),
  GK       VARCHAR(42),
  GL       VARCHAR(42),
  GM       VARCHAR(42),
  GN       VARCHAR(42),
  GO       VARCHAR(42),
  GP       VARCHAR(42),
  HA       VARCHAR(42),
  HB       VARCHAR(42),
  HC       VARCHAR(42),
  HD       VARCHAR(42),
  ZE       VARCHAR(42),
  YY       VARCHAR(42),
  YZ       VARCHAR(42),
  Annee    VARCHAR(42)
);

CREATE TABLE Societe (
  PRIMARY KEY (Siren),
  Siren        VARCHAR(42) NOT NULL,
  Denomiantion VARCHAR(42),
  Codepostal   VARCHAR(42),
  Town         VARCHAR(42),
  Ape_1        VARCHAR(42),
  Ape_2        VARCHAR(42) NOT NULL,
  Siren_FK_1   VARCHAR(42) NOT NULL,
  Siren_FK_2   VARCHAR(42) NOT NULL,
  Siren_FK_3   VARCHAR(42) NOT NULL,
  Siren_FK_4   VARCHAR(42) NOT NULL,
  Siren_FK_5   VARCHAR(42) NOT NULL,
  Siren_FK_6   VARCHAR(42) NOT NULL,
  Siren_FK_7   VARCHAR(42) NOT NULL,
  Siren_FK_8   VARCHAR(42) NOT NULL,
  Siren_FK_9   VARCHAR(42) NOT NULL
);

CREATE TABLE Subvantion (
  PRIMARY KEY (Siren_FK),
  Siren_FK          VARCHAR(42) NOT NULL,
  Subvantion_Chifre VARCHAR(42),
  Annee             VARCHAR(42)
);

ALTER TABLE Societe ADD FOREIGN KEY (Siren_FK_9) REFERENCES Charge_chifre (Siren_FK);
ALTER TABLE Societe ADD FOREIGN KEY (Siren_FK_8) REFERENCES Produit_chifre (Siren_FK);
ALTER TABLE Societe ADD FOREIGN KEY (Siren_FK_7) REFERENCES Chiffre_Affire (Siren_FK);
ALTER TABLE Societe ADD FOREIGN KEY (Siren_FK_6) REFERENCES Compte_Resulta (Siren_FK);
ALTER TABLE Societe ADD FOREIGN KEY (Siren_FK_5) REFERENCES Produit_chifre (Siren_FK);
ALTER TABLE Societe ADD FOREIGN KEY (Siren_FK_4) REFERENCES Produit_chifre (Siren_FK);
ALTER TABLE Societe ADD FOREIGN KEY (Siren_FK_3) REFERENCES Charge_chifre (Siren_FK);
ALTER TABLE Societe ADD FOREIGN KEY (Siren_FK_2) REFERENCES Subvantion (Siren_FK);
ALTER TABLE Societe ADD FOREIGN KEY (Siren_FK_1) REFERENCES Chiffre_Affire (Siren_FK);
ALTER TABLE Societe ADD FOREIGN KEY (Ape_2) REFERENCES Ape_Gen (Ape);
