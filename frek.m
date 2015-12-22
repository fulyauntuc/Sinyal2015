function ff=frek(nota,oktav)  
notalar={'Do','Dod', 'Re', 'Mib' ,'Mi' ,'Fa', 'Fad', 'Sol', 'Sold', 'La', 'Sib', 'Si','sus'}; %nota için tanýmladýðým karakterleri notalar dizisine atadým.
referans=16.35;  %do notasýnýn 0.oktavýndaki deðerini referans olarak aldým.
k=length(notalar); %k deðiþkenine notalar dizisinin uzunluðunu atadým.
if nargin<2
     oktav=4;
end
for i=0:8 %oktav için bir for oluþturdum.
    if i==oktav %i'nin deðeri benim giriþ yaptýðým oktav'ýn deðerine eþitse(i==oktav) ise if'in içine gir.
       for j=1:k %notalar dizindeki elemanlar için for döngüsü oluþturdum.
           if  size(nota)==size(notalar{j})
              if nota==notalar{j}%giriþ yaptýðým nota ,notalar dizisindeki j. elemana eþitse if'in içine gir.
                  ff=2^i*(2^((j-1)/12)*referans);%2^i olmasýnýn sebebi oktavý her deðiþtiðinde 2 katýna çýkýyor.(j-1) olma sebebide j'nin 1 den baþlamasýdýr.     
              
              end 
           end
       end
     end
end