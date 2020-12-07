# TRNIDS: Turkish National Identifier Suite

### **TR [ ENG ⇣ ]**

```
████████╗██████╗░███╗░░██╗██╗██████╗░░██████╗
╚══██╔══╝██╔══██╗████╗░██║██║██╔══██╗██╔════╝
░░░██║░░░██████╔╝██╔██╗██║██║██║░░██║╚█████╗░
░░░██║░░░██╔══██╗██║╚████║██║██║░░██║░╚═══██╗
░░░██║░░░██║░░██║██║░╚███║██║██████╔╝██████╔╝
░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═════╝░╚═════╝░

[ Nuri ACAR ] [ nuriacar.com ]

[ TRNIDS ] [ Turkish National Identifier Suite ]    [ v0.1.0 : 20201206203040 ]

[ Menu ]
===============================================================================
.
... 1. Check NID Validation
... 2. Generate Last Two Digits
... 3. NID Whois
... 4. Get Possible Relatives
... 5. Generate Random Valid NID
... 6. Generate All Possible NID's

... 98. About & Source Code Repository & Version History
... 99. Exit
===============================================================================

Select an Option!

>>>
```

### **MERNİS : TRNIDS**

Bu program Merkezi Nüfus İdare Sistemi'ne (MERNIS) öykünen bir yeni yetme.
Bence de komik... :) Özetle; TCNO doğrulaması, geçerli rastgele TCNO üretimi,
kişinin potansiyel akrabalarını bulma (soyağacı) (tanımadığınız akrabalarınızı
bulabilir ki baya enteresan oluyor), MERNIS sisteminin dağıtabileceği tüm
geçerli TCNO havuzunu (geçmiş, şimdi, gelecek) üretebilme vb. işlemler
gerçekleştiriyor.

![Var mi bonbamız?](/assets/img/var-mi-bonbamiz.jpg "Var mı bonbamız?")

> MERNİS, [Ahvâl-i
> şahsiyye](https://islamansiklopedisi.org.tr/ahval-i-sahsiyye) bilgilerini
> elektronik ortama aktaran ve [ahvâl-i
> şahsiyye](https://islamansiklopedisi.org.tr/ahval-i-sahsiyye) bilgilerinde
> meydana gelen her tür değişikliğin ülkenin her tarafına dağılmış
> merkezlerden anlık güncellenmesini ve bir ağ üzerinden güvenle paylaşımını
> sağlayan bir projedir.
>> [Nüfus ve Vatandaşlık İşleri Genel
>> Müdürlüğü](https://www.nvi.gov.tr/genel-olarak-mernis)

Bir de bu işlere bakan [milletlerarası bir
komisyon](https://tr.wikipedia.org/wiki/Milletleraras%C4%B1_Ahvali_%C5%9Eahsiye_Komisyonu)
varmış ki ilk kurulduğu günlerden üyeymişiz! Enteresan!

### **Program özellikleri ve kodlara dair...**

[![TRNID GitHub](/assets/img/github-icon.png "TRNID GitHub")](https://github.com/nuriacar/trnids)

Kaynak Kod Deposu
{: style="color:gray; font-size: 80%; text-align: left;"}

Bash, Python, Common Lisp ve C ile kodladım. Benim için özel yanı, bilmediğim
ama öğrenmeye merak saldığım tüm progrmalama dillerini bu programı yazarak
öğrenmeye çalışıyor olmam. Bash ve C ile başlayıp Python 3'e port ettim,
ardından Python 3'ten Common Lisp'e port ettim, ardından tekrar Python 3'e
aktardım. Bakalım zamanla daha hangi dillere evrilecek.

`[ Bash & C ] => [ Python 3 & C ] => [ Common Lisp ] => [ Python 3 & C ]`

**Not: Bash, Common Lisp ve Python 3 versiyonları birbirinin aynısı değil!
Bash ve Common Lisp kodları, Python 3'ün fonksiyonel eşdeğerine güncellenmedi
fakat yine de bazı fonksiyonlar hariç benzer çalışıyorlar! Birbirine en yakın
olanlar Common Lisp ve Python 3.**

Versiyon geçmişi şöyle:

```
===============================================================================
[ Version History ]
===============================================================================

20190417       :        : Coding with Bash started.

20190423085333 : v0.0.1 : All engines running. Liftoff! We have a liftoff... :)
20190424180421 : v0.0.2 : C generator coded because of slow generating.
20190425010841 : v0.0.3 : Elapsed time function fixed.
20200331161407 :        : Coding with Python3 started.
20200405145247 : v0.0.4 : Done. Ported to Python3.
20200405234321 : v0.0.5 : All nid gen. added on Windows py function.
20200406151747 : v0.0.6 : Keyboard Interrupt errors handled in main.
20200411051239 : v0.0.6 : Program name edited.
20200527004701 :        : Coding with Common Lisp started.
20200601160705 : v0.0.7 : Done. Ported to Common Lisp.
20200603003901 : v0.0.8 : Variable based compilation errors fixed.
20200603003901 : v0.0.8 : let, let*, defvar, defparameter... :(
20200603003901 : v0.0.8 : Program flow changed.
20200606201807 : v0.0.9 : History record. Flow change. Classify.
20200730111939 :          Port to Python3 from Common Lisp started.
20200806135339 : v0.0.9 : Done. Ported to Python3.
20201206203040 : v0.1.0 : After unsuccessful packaging attemp on Python3;
                          version history added, fn name changed.
```

Menüye göz atacak olursak:

```
.
... 1. Check NID Validation
... 2. Generate Last Two Digits
... 3. NID Whois
... 4. Get Possible Relatives
... 5. Generate Random Valid NID
... 6. Generate All Possible NID's

... 98. About & Source Code Repository & Version History
... 99. Exit
```

`1.` Girilen TCNO'nun doğru olup olmadığını kontrol eder.

`2.` İlk 9 hane verildiğinde son 2 haneyi üretir.

`3.` Henüz kodlamadım. Kişilere dair mümkün olan tüm bilgileri içeren bir veri
tabanı olsun isterim. Sorgulanan kişiye dair olabildiğince alakalı veri
döndürecek.

`4.` TCNO'su girilen kişinin muhtemel(!) akrabalarını buluyor. ("**Aşağıda,
TCKNO Nedir? Nasıl dağıtılır?**" kısmı sonunda bahsettiğim alakasız kimlik
numarası verilmesi ihtimalini unutmayın!)

`5.` Girilen sayı kadar, rastgele oluşturulmuş, geçerli TCNO üretir.

`6.` MERNİS sisteminin dağıtabileceği tüm muhtemel TCNO havuzunu üretir,
dosyaya kaydeder. Bu dosya ~11GB boyutta oluyor. Aslında programın içinde *nix
sistemlere özel LZMA arşivleyicisini ve çözücüsünü de ekledim lakin, kontrol
edip düzenlemedim, haliyle aktif değil. Belki gelecekte düzenler ve
aktifleştiririm. Gerçi zaten ortalık yerde, isteyen aktifleştirsin.

Ek olarak, bu `6.` özelliği hem Bash, hem Python 3, hem Common Lisp, hem de C
ile kodladım zira i5-2410M sistemimde Python 3 generatörü (jeneratör) ~55
saatte tüm havuzu üretip dosyaya kaydedebiliyorken C ile kodladığım hali ~18
dakikada tüm havuzu üretip dosyaya kaydedebiliyor. Bash'le yazdığım
versiyonunun üretip kaydetme süresini hatırlamıyorum ama yüksek ihtimal baya
sürüyor ki projenin en başında oturup C generatörü kodlamışım değil mi?

Bkz. Version History, `20190424180421: v0.0.2 : C generator coded because of
slow generating.`

Common Lisp'le yazdığım versiyonu ise ~5 saatte aynı işlemi
gerçekleştirebiliyor. Peki neden Common Lisp? Çünkü gelecek fonksiyoneldir!
Fakat bu başka bir zamanın konusu.

`98.` Program hakkında bilgiler verir, kaynak kod deposuna yönlendirir,
versiyon geçmişini görüntüler.

`99.` Programdan çıkar.

**Bir de, olur da gelecekte lazım olur diye yapılan sorguları, sonuçları,
geçmiş (history, log) kaydı olarak tutuyor.** Geçmiş kayıtlarından bakarak
gelecekteki sorgularla da alaka kursa, hiç olmadı otomatik tamamlasa güzel
olabilir ama henüz yapamıyor. Büyüyecek.

Bundan sonrası TCNO, algoritması ve haliyle programın işleyişine dair bilgiler
içeriyor. Dikkat! Bundan sonrasını okumak, çamaşır makinesi seyreden çocuğun
yaşadığı türde bir aydınlanmaya sebep olabilir. :)

### **T.C. Kimlik Numarası (TCNO) nedir? Nasıl dağıtılır?**

Burada yazılan bazı bilgiler kesin değil! Öyle olduklarını düşünüyorum ama
ıspatlayamam. **Dikkat! İki [!] arasında *italik* yazılan bilgiler doğru
olmayabilir!**

Türkiye Cumhuriyeti kimlik numarası (TCNO) iki kısımdan oluşan (9 + 2) 11
haneli kişiye özel bir numara. İlk 9 hane 100000001 ile 999999999 aralığında!
Belki de 9 haneli sayıların ilki olan 100000000, başka bir şeyin anahtarıdır.
Belki de değildir. Belki de kedidir! Her neyse! Son iki hane, ilk 9 haneden
türetiliyor. Bu 9 basamaklı kökün ilk basamağı 0 olamıyor. Hem neden olsun! 0
olursa 8 haneye düşer değil mi? **[!]** *İlk 9 hane, aile kütük numarası.
Defterlerde kayıtlı, bilinen en büyük dedeye veriliyor. Aynı soydan olanlar
dedenin kütük numarasından üretiliyor.*

*Bir de kadınların evli, bekar durumları var. TCNO ilk dağıtım aşamasında,
kişi hangi kütükteyse oradan numara alıyor. İlk TCNO dağıtım aşamasından önce
evli olan kadınlara, dedelerinin değil, eşlerinin kütüğünden numara verilmiş.
Bekarlara ise babalarının (dedelerinin) kütüğünden numara verilmiş. Kadın
evlendiğinde eşinin kütüğüne geçer (enteresan!) ama babasının kütüğündeyken
TCNO dağıtıldığı için TCNO eşiyle uyumsuz olabiliyor. Gene benzer şekilde, ilk
TCNO dağıtım aşamasında zaten doğmuş olan çocukların TCNO'su babanın
TCNO'sundan türetilmiş ki bunu görüp deneyimledim. Bu numara, dedenin
kütüğünde aşağı doğru boşta olan ilk numara. Yeni doğan çocuklarda ise aykırı
bir durum gözlemledim ki bu çocukların TCNO'su dedenin (haliyle babanın)
kütüğünden farklı olabiliyor. Belki de TCNO dağıtım zamanından sonra doğan tüm
çocuklar böyle. İllaki baba ile bir alakası vardır lakin henüz nasıl olduğunu
çözebilmiş değilim. Ayrıca sanıyorum yabancı uyrukluların pek çoğuna o anda
uğramakta oldukları devlet işlemleri gerçekleştirilebilsin diye 11111111110
atanmış ki bu algoritmaya göre geçerli bir numara. Belki tuhaf kodlama
hataları, belki memurların uygulama hataları (müdürleri öyle dediği için öyle
yapmış olmaları kesin!), belki her ikisi birden, belki hiç biri... Belki de
kedi! (Evet, gene kedi! Ne oldu? Zoruna mı gitti? Trafoya giren, neler yapmaz
haberin var mı!) Günü kurtaran çözümler bakalım gelecekte nelere sebep
olacak.* **[!]**

[MERNİS Hizmete Açılış Tarihi: 20.01.2003](https://www.milliyet.com.tr/gundem/mernis-yarin-hizmette-262466)
[MERNİS Skandalı](https://www.milliyet.com.tr/ekonomi/mernis-skandali-181319)

### **Nasıl oluşturulur?**

İlk 9 hane 100000001 ile 999999999 aralığında! Son iki hane, ilk 9 haneden
türetiliyor. Şöyle:

1. İlk dokuz hanenin tek basamaktaki rakamlarının toplamı x 7 = n
2. İlk dokuz hanenin çift basamaktaki rakamlarının toplamı = m
3. (n - m) % 10 = TCNO 10. hane olur. Şimdi elimizde 10 hane oldu.
4. İlk 10 hanenin toplamı % 10 = TCNO 11. hane. Ta daa!

#### **Örnek 1:**

Rastgele bir TCNO şöyle olsun (11 hane): **123456789xy**

Numaranın kökü ilk 9 hane: **123456789** ki bu bize yeterli.

```
. . . . .
123456789xy
 : : : :
```

Üstünde '.' olanlar tek basamaktaki, altında ':' olanlar çift basamaktaki
rakamlar! Şimdi "Nasıl hesaplanır?" kısmındaki algoritmaya göre hesaplayalım:

1. (1 + 3 + 5 + 7 + 9) * 7 = 175
2. (2 + 4 + 6 + 8) = 20
3. (175 - 20) % 10 = 5 (x = 5) (1234567895y)
4. (1 + 2 + 3 + 4 + 5 + 6 +7 + 8 + 9 + 5) % 10 = 0 (y = 0)

**TCNO : 12345678950**

#### **Örnek 2:**

Diğer bir rastgele TCNO şöyle olsun (11 hane): **192837465xy**

Numaranın kökü ilk 9 hane: **192837465** ki bu bize yeterli.

```
. . . . .
192837465xy
 : : : :
```

Üstünde '.' olanlar tek basamaktaki, altında ':' olanlar çift basamaktaki
rakamlar! Şimdi "Nasıl hesaplanır?" kısmındaki algoritmaya göre hesaplayalım:

1. (1 + 2 + 3 + 4 + 5) * 7 = 105
2. (9 + 8 + 7 + 6) = 30
3. (105 - 30) % 10 = 5 (x = 5) (1928374655y)
4. (1 + 9 + 2 + 8 + 3 + 7 + 4 + 6 + 5 + 5) % 10 = 0 (y = 0)

**TCNO : 19283746550**

**Dikkat! 10. hane rakamların durumuna göre negatif bir rakam olabiliyor. Bu
yüzden 10. hane için her zaman absolute (mutlak) değer aldım. Belki de bu
negatif çıkan 10. basamak yüzünden ~900 milyonluk (999999999 - 100000001 =
899999999) muhtemel TCNO havuzunun tamamını dağıtamıyorlardır.**

### **Peki aile bireyleri?**

1. **Büyükler**: Aynı ailede senden büyükleri bulabilmek için kendi kimlik
   numaranın ilk 9 hanesine 29999 ekle, oluşan 9 haneli rakamdan yukarıdaki
   algoritmayla son 2 haneyi türet. Kütükte senden bir üstte bulunan kişinin
   TCNO hazır. Yeni oluşan numaraya da istediğin kadar bu işlemi uygulayarak
   soyda yukarılara doğru gidebilirsin.

2. **Küçükler**: Aynı ailede senden küçükleri bulabilmek için kendi kimlik
   numaranın ilk 9 hanesinden 29999 çıkar, oluşan 9 haneli rakamdan yukarıdaki
   algoritmayla son 2 haneyi türet. Kütükte senden bir altta bulunan kişinin
   TCNO hazır. Yeni oluşan numaraya da istediğin kadar bu işlemi uygulayarak
   soyda aşağılara doğru gidebilirsin.

Özeti mi kaldı, roman oldu lakin özetle, böyleyken böyle!

---

### **ENG**

```
████████╗██████╗░███╗░░██╗██╗██████╗░░██████╗
╚══██╔══╝██╔══██╗████╗░██║██║██╔══██╗██╔════╝
░░░██║░░░██████╔╝██╔██╗██║██║██║░░██║╚█████╗░
░░░██║░░░██╔══██╗██║╚████║██║██║░░██║░╚═══██╗
░░░██║░░░██║░░██║██║░╚███║██║██████╔╝██████╔╝
░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═════╝░╚═════╝░

[ Nuri ACAR ] [ nuriacar.com ]

[ TRNIDS ] [ Turkish National Identifier Suite ]    [ v0.1.0 : 20201206203040 ]

[ Menu ]
===============================================================================
.
... 1. Check NID Validation
... 2. Generate Last Two Digits
... 3. NID Whois
... 4. Get Possible Relatives
... 5. Generate Random Valid NID
... 6. Generate All Possible NID's

... 98. About & Source Code Repository & Version History
... 99. Exit
===============================================================================

Select an Option!

>>>
```

### **MERNİS : TRNIDS**

This program is a newbie imitator of the Central Population Management System
(MERNIS) of Turkey. I think it's funny too... :) To sum up; TRNID
verification, valid random TRNID generation, finding potential relatives of
the person (family tree) (finding relatives you do not know, which is quite
interesting), being able to generate the entire valid TRNID pool (past,
present, future) that the MERNIS system can distribute, etc. performsi

![Do we have bnob?](/assets/img/var-mi-bonbamiz.jpg "Do we have bnob?")

> MERNIS is a project that transfers personal information to electronic
> environment and ensures that all changes in personal information are
> instantly updated from centers scattered all over the country and securely
> shared over a network.
>> [General Directorate of Population and Citizenship
>> Affairs](https://www.nvi.gov.tr/genel-olarak-mernis)

There was also an [international
commission](http://www.ciec1.org/SITECIEC_WEB/FR/index.awp) that took care of
these issues, and Turkey were members from the first days it was founded!
Interesting!

### **About program features and codes...**

[![TRNID GitHub](/assets/img/github-icon.png "TRNID GitHub")](https://github.com/nuriacar/trnids)

Source Code Repository
{: style="color:gray; font-size: 80%; text-align: left;"}

I coded with Bash, Python, Common Lisp and C. The special thing for me is that
I am trying to learn all programming languages that I do not know but are
curious to learn by writing this program. I started with Bash and C and ported
to Python 3, then I ported from Python 3 to Common Lisp, then transferred back
to Python 3. Let's see which languages will be next.

`[ Bash & C ] => [ Python 3 & C ] => [ Common Lisp ] => [ Python 3 & C ]`

**Note: Bash, Common Lisp and Python 3 versions are not the same! Bash and
Common Lisp codes have not been updated to the functional equivalent of Python
3, but they still work similarly except for some functions! The closest to
each other are Common Lisp and Python 3.**

```
===============================================================================
[ Version History ]
===============================================================================

20190417       :        : Coding with Bash started.

20190423085333 : v0.0.1 : All engines running. Liftoff! We have a liftoff... :)
20190424180421 : v0.0.2 : C generator coded because of slow generating.
20190425010841 : v0.0.3 : Elapsed time function fixed.
20200331161407 :        : Coding with Python3 started.
20200405145247 : v0.0.4 : Done. Ported to Python3.
20200405234321 : v0.0.5 : All nid gen. added on Windows py function.
20200406151747 : v0.0.6 : Keyboard Interrupt errors handled in main.
20200411051239 : v0.0.6 : Program name edited.
20200527004701 :        : Coding with Common Lisp started.
20200601160705 : v0.0.7 : Done. Ported to Common Lisp.
20200603003901 : v0.0.8 : Variable based compilation errors fixed.
20200603003901 : v0.0.8 : let, let*, defvar, defparameter... :(
20200603003901 : v0.0.8 : Program flow changed.
20200606201807 : v0.0.9 : History record. Flow change. Classify.
20200730111939 :          Port to Python3 from Common Lisp started.
20200806135339 : v0.0.9 : Done. Ported to Python3.
20201206203040 : v0.1.0 : After unsuccessful packaging attemp on Python3;
                          version history added, fn name changed.
```

Let's take a look at the menu:

```
.
... 1. Check NID Validation
... 2. Generate Last Two Digits
... 3. NID Whois
... 4. Get Possible Relatives
... 5. Generate Random Valid NID
... 6. Generate All Possible NID's

... 98. About & Source Code Repository & Version History
... 99. Exit
```

`1.` Checks whether the entered TRNID is correct.

`2.` When the first 9 digits are given, it produces the last 2 digits.

`3.` I haven't coded yet. I would like to have a database containing all
possible information on people. It will return as much relevant data as
possible on the person of interest.

`4.` Find probable(!) relatives of the person whose TRNID is entered.
(Remember the possibility of giving an irrelevant ID that I mentioned at the
end of the "**What is TRNID? How is it distributed?**" section below!)

`5.` Generates a randomly generated valid TRNID for the number of times
entered.

`6.` Generates all possible TRNID repositories that MERNIS system can
distribute, saves it to the file. This file is ~11GB in size. In fact, I added
the LZMA archiver and decoder specific to *nix systems in the program, but I
did not check and edit it, so it is not active. Maybe I'll edit and activate
in the future. Though it is already in the repository, who wants to activate
it.

In addition, I coded feature `6` with Bash, Python 3, Common Lisp, and C
because on my i5-2410M system, the Python 3 generator can generate and save
the entire pool in ~55 hours, while the version I coded with C can generate
the pool and save it to the file in ~18 minutes. I do not remember the time to
generate and save the version I wrote with Bash, but it probably takes a long
time.  I sat at the very beginning and coded the C generator right?

See. Version History, `20190424180421: v0.0.2: C generator coded because of
slow generating.`

The version I wrote with Common Lisp can do the same in ~5 hours. So why
Common Lisp? Because the future is functional! But this is a topic for another
time.

`98.` Gives information about the program, directs to the source code
repository, displays version history.

`99.` Exits the program.

**In addition, it keeps the query and results as a history (history, log)
record for future use in case of need.** It might be nice if it connects to
future queries by looking at the past records, at least autocomplete, but it
cannot yet. It will grow.

After that, the post contains information about the algorithm and the
functioning of the program. Attention! Reading from now on can cause the kind
of enlightenment experienced by the child watching the washing machine. :)

### **What is TR Identification Number (TRNID)? How is it distributed?**

Some information written here is not exact! I think they are, but I can't
prove **Attention! Two [!] between *italics* written information may not be
correct!** 

Republic of Turkey identification number (TRNID) consisting of two parts (9 +
2) a special 11-digit number to the person. The first 9 digits range from
100000001 to 999999999! Perhaps the first of the 9-digit numbers, 100000000,
is the key to something else. Maybe not. Maybe it's the cat! Anyway! The last
two digits are derived from the first 9 digits. The first digit of this 9
digit root cannot be 0. And why wouldn't it! If it is 0, it will be 8 digits
right?  **[!]** *First 9 digits, family registry number. It is given to the
greatest known grandfather recorded in the books. Those of the same lineage
are produced from your grandfather's number.*

*Also, women have single and married statuses. In the first distribution phase
of the TRNID, the person receives the number from whatever registry he or she
is in. Before the first TRNID distribution phase, married women were numbered
from the registry of their spouses, not their grandfathers. Singles are given
numbers from their father's (grandfather's) registry. When the woman gets
married, she goes on the registry of her husband (interesting!), but TRNID may
be incompatible with her husband because TRNID is distributed while she is on
her father's registry. Similarly, the TRNID of the children who were already
born during the first TRNID distribution phase is derived from the father's
TRNID, which I have seen and experienced. This number is the first number that
is idle down on your grandfather's registry. On the other hand, I observed a
contradictory situation in newborns, where TRNID of these children may differ
from the registry of the grandfather (naturally the father). Perhaps all
children born after the time of TRNID distribution are like that. It must have
something to do with the father's number, but I haven't figured out how it
happened yet. In addition, I think 11111111110 has been assigned to most of
the foreign nationals so that the state transactions they are currently
undergoing can be carried out, which is a valid number according to this
algorithm. Maybe weird coding mistakes, maybe the officers' execution mistakes
(they certainly did because their principal said so!), Maybe both, maybe
none... Maybe the cat! (Yes, again the cat! What happened? Nervous? Cat that
goes into the transformer does everything!) Let's see what the solutions that
save the day will cause in the future.* **[!]**

[The MERNİS Opening Date: 20.01.2003](https://www.milliyet.com.tr/gundem/mernis-yarin-hizmette-262466)

[The MERNIS Scandal](https://www.milliyet.com.tr/ekonomi/mernis-skandali-181319)

### **How is it produced?**

The first 9 digits range from 100000001 to 999999999! The last two digits are
derived from the first 9 digits. It is as follows:

1. The sum of the single digits of the first nine digits x 7 = n
2. The sum of the double digits of the first nine digits = m
3. (n - m) % 10 = 10th digit of TRNID. Now we have 10 households.
4. Total of the first 10 digits % 10 = 11th digit of TRNID. Ta daa!

#### **Example 1:**

Let a random TRNID be (11 digits): **123456789xy**

The root of the number is the first 9 digits: **123456789** which is enough
for us.

```
. . . . .
123456789xy
 : : : :
```

On '.' those in single digits, below ':' ones in double digits numbers! Now,
let's calculate according to the algorithm in "How is it calculated?":

1. (1 + 3 + 5 + 7 + 9) * 7 = 175
2. (2 + 4 + 6 + 8) = 20
3. (175 - 20) % 10 = 5 (x = 5) (1234567895y)
4. (1 + 2 + 3 + 4 + 5 + 6 +7 + 8 + 9 + 5) % 10 = 0 (y = 0)

**TRNID : 12345678950**

#### **Example 2:**

Let a random TRNID be (11 digits): **192837465xy**

The root of the number is the first 9 digits: **192837465** which is enough
for us.

```
. . . . .
192837465xy
 : : : :
```

On '.' those in single digits, below ':' ones in double digits numbers! Now,
let's calculate according to the algorithm in "How is it calculated?":

1. (1 + 2 + 3 + 4 + 5) * 7 = 105
2. (9 + 8 + 7 + 6) = 30
3. (105 - 30) % 10 = 5 (x = 5) (1928374655y)
4. (1 + 9 + 2 + 8 + 3 + 7 + 4 + 6 + 5 + 5) % 10 = 0 (y = 0)

**TRNID : 19283746550**

**Attention! The 10th digit can be a negative number depending on the state of
the numbers. So I always got absolute value for the 10th digit. Perhaps
because of this negative 10th digit, system cannot distribute the entire
possible TRNID pool of ~900 million (999999999 - 100000001 = 899999999)
numbers.**

### **What about family members?**

1. **Seniors**: Add 29999 to the first 9 digits of your ID number to find the
   first senior in the same family, derive the last 2 digits from the 9-digit
   number with the algorithm above. The TRNID of the senior person next to you
   in the registry is ready. You can go up the lineage by applying this
   process to the newly created number as much as you want.

2. **Juniors**: Subtract 29999 from the first 9 digits of your ID number to
   find the first junior in the same family, derive the last 2 digits from the
   9-digit number with the algorithm above. The TRNID of the junior person
   next to you in the registry is ready. You can go down the lineage by
   applying this process to the newly created number as much as you want.

Was it a summary, it was a novel, but in short, like this!
