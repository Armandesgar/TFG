function modificar_excel(nom_excel,Treu,Deteccio,nomcsv)
T = readtable(nom_excel);
Individu=T.Individu; NomComplert=T.NomComplert;
Detecta_dreta=T.Detecta_dreta; Treu_dreta=T.Treu_dreta; 
Detecta_esquerra=T.Detecta_esquerra; Treu_esquerra=T.Treu_esquerra;
noms=split(nomcsv,'-');
Identificador=str2num(string(noms(1))); CostatChar=char(noms(2));   IdentificadorChar=char(noms(1));
Nomcomplert_str=strcat(IdentificadorChar,'-',CostatChar(3));
Nomcomplert_string=convertCharsToStrings(Nomcomplert_str);
%Caso Izquierda

if CostatChar(1)=='E'
   
    if length(NomComplert)==0
        Individu=[Identificador];
        Detecta_dreta=[0];
        Treu_dreta=[0];
        Detecta_esquerra=[Deteccio];
        Treu_esquerra=[Treu];
        NomComplert=[Nomcomplert_string];
    end
    %Pasem tot el vector a una cela
    Nomcomplert_cell=cellstr(NomComplert);
    %Busquem les posicions que coincideix amb el nom del experiment
    Esta=strcmp(Nomcomplert_cell,Nomcomplert_str);
    index=find(Esta,1);
    %Si coincideix
    if length(index)>0
        if Esta(index)
            Detecta_esquerra(index)=Deteccio;
            Treu_esquerra(index)=Treu;
        end
    %Si no coincideix, com es la primera vegada que inicialitzem la columna
    %pues li diem que els que encara no tenim dades pues són 0
    
    else
        index=length(NomComplert)+1;
        Detecta_dreta(index)=0;
        Treu_dreta(index)=0;
        Detecta_esquerra(index)=Deteccio;
        Treu_esquerra(index)=Treu;
        Individu(index)=Identificador;
        NomComplert(index)=cellstr(Nomcomplert_string);
    end
%Si estem a la dreta
elseif CostatChar(1)=='D'
    if length(NomComplert)==0
        Individu=[Identificador];
        Detecta_dreta=[Deteccio];
        Treu_dreta=[Treu];
        Detecta_esquerra=[0];
        Treu_esquerra=[0];
        NomComplert=[Nomcomplert_string];
    end
    Nomcomplert_cell=cellstr(NomComplert);
    Esta=strcmp(Nomcomplert_cell,Nomcomplert_str);
    index=find(Esta,1);
    if length(index)>0
        if Esta(index)
            Detecta_dreta(index)=Deteccio;
            Treu_dreta(index)=Treu;
        end
    else
        index=length(NomComplert)+1;
        Detecta_dreta(index)=Deteccio;
        Treu_dreta(index)=Treu;
        Detecta_esquerra(index)=0;
        Treu_esquerra(index)=0;
        Individu(index)=Identificador;
        NomComplert(index)=cellstr(Nomcomplert_string);
    end
end
Individu=Individu(:); NomComplert=NomComplert(:);
Detecta_dreta=Detecta_dreta(:);       Treu_dreta=Treu_dreta(:);
Detecta_esquerra=Detecta_esquerra(:); Treu_esquerra=Treu_esquerra(:);
T=table(Individu,Detecta_dreta,Treu_dreta,Detecta_esquerra,Treu_esquerra,NomComplert);

%Caso derecha
writetable(T,nom_excel,'WriteRowNames',true)
