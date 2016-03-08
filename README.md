# Hitobito Dsj

This hitobito wagon defines the organization hierarchy with groups and roles
of Dachverband Schweizer Jugendparlamente.


## Organization Hierarchy

* Dachverband
  * Dachverband
    * Adressverwaltung: [:layer_full]
  * Geschäftsstelle
    * Mitarbeiter/-in: [:admin, :layer_and_below_full, :contact_data]
  * Vorstand
    * Vorstandsmitglied: [:layer_full, :contact_data]
  * Externe Kontakte
    * Rolle: [:group_full]
    * Kontakt: []
  * Gremium
    * Leitung: [:group_full, :contact_data]
    * Mitglied: [:group_read]
* Jugendparlament
  * Jugendparlament
    * Adressverwaltung: [:layer_full]
  * Leitung
    * Präsidium: [:layer_full, :contact_data]
    * Co-Präsidium: [:layer_full, :contact_data]
    * Adressverwaltung: [:layer_full]
  * Vorstand
    * Vorstandsmitglied: [:layer_full, :contact_data]
  * Mitglieder
    * Adressverwaltung: [:group_full]
    * Mitglied: []
  * Externe Kontakte
    * Adressverwaltung: [:group_full]
    * Kontakt: []
* Easyvote
  * Easyvote
    * Adressverwaltung: [:layer_full]
  * Abonnenten
    * Adressverwaltung: [:group_full]
    * Abonnent/-in: []
  * Community
    * Adressverwaltung: [:group_full]
    * Communitymitglied: []
  * Gruppe
    * Adressverwaltung: [:group_full]
    * Kontakt: []
