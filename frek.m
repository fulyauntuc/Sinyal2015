function ff=frek(nota,oktav)  
notalar={'Do','Dod', 'Re', 'Mib' ,'Mi' ,'Fa', 'Fad', 'Sol', 'Sold', 'La', 'Sib', 'Si','sus'}; %nota i�in tan�mlad���m karakterleri notalar dizisine atad�m.
referans=16.35;  %do notas�n�n 0.oktav�ndaki de�erini referans olarak ald�m.
k=length(notalar); %k de�i�kenine notalar dizisinin uzunlu�unu atad�m.
if nargin<2
     oktav=4;
end
for i=0:8 %oktav i�in bir for olu�turdum.
    if i==oktav %i'nin de�eri benim giri� yapt���m oktav'�n de�erine e�itse(i==oktav) ise if'in i�ine gir.
       for j=1:k %notalar dizindeki elemanlar i�in for d�ng�s� olu�turdum.
           if  size(nota)==size(notalar{j})
              if nota==notalar{j}%giri� yapt���m nota ,notalar dizisindeki j. elemana e�itse if'in i�ine gir.
                  ff=2^i*(2^((j-1)/12)*referans);%2^i olmas�n�n sebebi oktav� her de�i�ti�inde 2 kat�na ��k�yor.(j-1) olma sebebide j'nin 1 den ba�lamas�d�r.     
              
              end 
           end
       end
     end
end