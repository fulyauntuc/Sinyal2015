Fs=8500; %ornekleme frekans� deger atamas� yap�ld�.
gecikme=round(Fs/100); %echo icin gecikme suresi tan�mland�.
notalar=[]; %notalar matrisine ilk deger atamas� yap�ld�.
duraklama=[]; %Fs/10000; %duraklama suresi degeri atand�.
oktdegis=3; %oktav degerlerini degistiren degisken[-3,+3].
dosya=fopen('notalar.txt','r'); %text dosyas�n� acar,'r':okumak i�in.
[nota,oktav,olcu]=textread('notalar.txt','%s%d%s','delimiter',','); %text dosyas� okundu ve , ile ayr�lm�s degiskenler yeni matrislere atand�.
fclose(dosya); %text dosyas� kapat�ld�.
%% Program icinde oktav degisimi kosulu
if oktdegis~=0 %oktdegis degiskeninde degisiklik yap�lmas� durumunda islenecek sart. 
    for j=1:length(oktav) %text'ten cekilen oktav degerleri dongu icerisinde degistirilecek.
        oktav(j)=oktav(j)+oktdegis; 
    end
end
%% Notalar matrisi icinde notalar�n sinyallerini olusturma
for i=1:length(nota)
    frekans=frek(nota{i},oktav(i)); %frek fonsiyonu cag�r�larak i. notan�n frekans degeri hesapland�. 
    [sindalga,t]=note(frekans,str2num(olcu{i})); %note fonksiyonu cag�r�larak i.notan�n sinus sinyali cizildi.
    notalar=[notalar sindalga duraklama]; %notalar�n sinyalleri aras�na bosluk eklenerek notalar matrisinde birlestirildi.
end  
%% Notalar matrisine echo ekleme
for i=1:length(notalar)
    if (i+gecikme)<=length(notalar) %gecikme notalar uzunlugunu asmad�g� surece islenecek sart.
        notalar(i+gecikme)=notalar(i+gecikme)+0.3*notalar(i); %Fs, 10'da biri s�resince geciktirilip(gecikme)
    end                                               %++genli�i %30 oran�nda d���r�lerek kendisi ile topland�.
end
%% Notalar matrisi sinyallerinin tepe degeri 1'e normalize edildi.
notalar=notalar/max(abs(notalar));
%% Notalar matrisinin grafigi cizdirilip, ses olarak cal�nd�
plot(notalar)
sound(notalar,Fs);