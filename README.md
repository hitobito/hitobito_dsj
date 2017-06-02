# Hitobito Dsj

This hitobito wagon defines the organization hierarchy with groups and roles
of Dachverband Schweizer Jugendparlamente.


## Organization Hierarchy

* Dachverband
  * Geschäftsstelle
    * Administrator/-in: [:layer_and_below_full, :admin, :contact_data]
    * Mitarbeiter/-in: [:group_read, :contact_data]
  * Vorstand
    * Vorstandsmitglied: [:layer_full, :contact_data]
  * Projektgruppe
    * Leitung: [:group_and_below_full, :contact_data]
    * Mitglied: [:group_and_below_read]
  * Externe Kontakte
    * Adressverwalter/-in: [:group_and_below_full]
    * Kontakt: []
* Jupa Status
  * Jupa Status
    * Adressverwalter/-in: [:layer_and_below_full, :contact_data]
* Jugendparlament
  * Leitung
    * Präsidium: [:layer_full, :contact_data]
  * Vorstand
    * Vorstandsmitglied: [:layer_full, :contact_data]
  * Mitglieder
    * Mitglied: []
  * Externe Kontakte
    * Kontakt: []
  * Projektgruppe
    * Leitung: [:group_and_below_full]
    * Mitglied: [:group_and_below_read]
