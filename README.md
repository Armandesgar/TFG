# TFG
Repositori dels codis utilitzats durant el TFG

Tots aquests codis són codis que serveixen per a generar un excel capaç de trobar diferents resultats de cada prova:
Primer s'ha d'iniciar l'excel amb l'arxiu: excel_iniciador_propietats.m
Després per a omplir l'excel es fa servir l'arxiu: excel_complert.m se li ha de passar els arxius csv dels videos que es vulguin analitzar juntament amb la corresponent imatge del cervell. Aquest s'encarrega d'executar els diferents arxius per tal d'obtenir els resultats.
Principalment els arxius importants són: tape_removal.m, rotarod.m i imatges.m.
tape_removal.m donarà els resultats de la prova Tape Removal, i fa servir els codis: canvi_a_cm.m per fer el canvi de coordenades, centremasses_ratoli.m per trobar el centre de masses del ratolí, filtre_5_punts.m és un filtre de 5 punts per les dades, llegir_dades.m, matriu_transformacio.m que permet fer el canvi de perspectiva i neteja_dades.m que elimina els pics degut a errors del DeepLabCut.
rotarod.m dona els resultats de la prova Rotarod, i fa servir els codis: filtre_5_punts.m i llegir_dades_rotarot.m.
imatges.m dona els resultats del %Volum Infartat de les imatges, fa servir tots els codis de createMask, createCervell.m, closeCervell.m, create_linees.m i segmentImage.m.


