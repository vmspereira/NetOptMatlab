% Example of weights configuration optimization for the minimization of congestion (Fortz ant Thurop Phi congestion measure) on DEFT enabled networks 


clear;
close all;

% adjacency matrix 
A=[0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 ;
0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 0 1 0 ;
0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 1 0 0 1 0 0 1 0 0 1 0 0 0 0 0 ;
0 0 1 0 1 0 0 1 0 0 1 0 1 1 0 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 ;
0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 ;
0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 ;
0 1 0 0 0 0 1 1 1 1 0 0 0 0 0 0 1 0 0 0 0 0 1 0 1 1 1 0 1 1 ;
0 1 0 1 1 0 0 0 0 0 1 0 0 0 1 1 0 0 0 0 1 0 1 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 ;
0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 ;
0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 1 0 0 ;
0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 ;
0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 ;
];

% capacity matrix 
C=[0.0 2329.627575984019 0.0 10010.970495078116 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
2329.627575984019 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 2140.532910649117 0.0 0.0 0.0 8870.437143565587 8955.260598787096 0.0 7353.291421916889 10632.558496535781 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 6219.529185755309 8620.840671290458 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
10010.970495078116 0.0 0.0 0.0 0.0 1400.3275690049813 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 10616.920919808661 0.0 0.0 0.0 0.0 0.0 0.0 10343.052272928315 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 3190.9962216539025 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1257.4594658755946 0.0 0.0 0.0 5343.130345246692 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 1400.3275690049813 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 7438.719407539451 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 8846.94994078825 0.0 0.0 0.0 8312.350029763784 0.0 8085.657968842795 0.0 0.0 0.0 0.0 0.0 1207.72099590322 0.0 0.0 0.0 0.0 7708.982715512105 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 4741.441385673896 9163.795548646209 0.0 0.0 0.0 9693.126008017955 0.0 4178.701513754696 0.0 0.0 7720.146247784489 0.0 0.0 10297.299616851118 0.0 0.0 7171.137126661261 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 6219.529185755309 0.0 3190.9962216539025 0.0 0.0 4741.441385673896 0.0 0.0 9358.677655300617 0.0 10005.885686752063 9396.617004850088 0.0 2759.506465461309 0.0 4730.550014958861 0.0 8549.927658635555 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 8620.840671290458 0.0 0.0 0.0 0.0 9163.795548646209 0.0 0.0 0.0 0.0 8906.044662712222 0.0 0.0 3812.70161104778 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 2779.7523314514065 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 9358.677655300617 0.0 0.0 0.0 0.0 0.0 0.0 0.0 6894.8481170934965 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 2140.532910649117 0.0 0.0 0.0 0.0 8846.94994078825 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 10005.885686752063 8906.044662712222 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 9693.126008017955 9396.617004850088 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 9705.341620530258 0.0 0.0 0.0 0.0 0.0 5993.75119081819 0.0 0.0 6828.525179222871 0.0 0.0 0.0 0.0 ;
0.0 8870.437143565587 0.0 0.0 0.0 0.0 8312.350029763784 4178.701513754696 2759.506465461309 3812.70161104778 0.0 0.0 0.0 0.0 0.0 0.0 9753.06593201016 0.0 0.0 0.0 0.0 0.0 7985.115728094532 0.0 10977.003148102433 10535.289572613614 8345.210128056435 0.0 7220.883910945858 3503.113664269887 ;
0.0 8955.260598787096 0.0 10616.920919808661 1257.4594658755946 0.0 0.0 0.0 0.0 0.0 6894.8481170934965 0.0 0.0 0.0 9705.341620530258 9753.06593201016 0.0 0.0 0.0 0.0 8617.489172913443 0.0 7841.994649738487 5708.234371037585 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 8085.657968842795 0.0 4730.550014958861 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 7353.291421916889 0.0 0.0 0.0 0.0 0.0 7720.146247784489 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 10632.558496535781 0.0 0.0 0.0 0.0 0.0 0.0 8549.927658635555 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 5377.621062082999 0.0 0.0 ;
0.0 0.0 0.0 0.0 5343.130345246692 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 8617.489172913443 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 10297.299616851118 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 6163.810472952047 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 7438.719407539451 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 5993.75119081819 7985.115728094532 7841.994649738487 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 9729.390460840801 ;
0.0 0.0 0.0 10343.052272928315 0.0 0.0 1207.72099590322 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 5708.234371037585 0.0 0.0 0.0 0.0 6163.810472952047 0.0 0.0 0.0 0.0 0.0 7168.05802195801 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 7171.137126661261 0.0 0.0 0.0 0.0 0.0 0.0 0.0 10977.003148102433 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 6828.525179222871 10535.289572613614 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 2779.7523314514065 0.0 0.0 0.0 0.0 0.0 8345.210128056435 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 5377.621062082999 0.0 0.0 0.0 7168.05802195801 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 7708.982715512105 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 7220.883910945858 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 3503.113664269887 0.0 0.0 0.0 0.0 0.0 0.0 9729.390460840801 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;
];

% Traffic Matrix  
D=[0.0 126.60169369925109 108.87169051186208 39.48951817101956 6.1706994941368265 3.3313048236257172 15.73656772490604 50.81177170708556 60.0133385932295 43.22866596357501 35.30098829767653 10.602920562548872 49.19091619754957 24.03757576380942 29.984652415963158 18.69075017957047 51.75615307997962 7.143953448128403 42.63206603052427 36.86590620327045 31.070725757745215 45.31893095810268 55.88290273414681 25.00984849242752 24.35685976655975 51.61090479591106 24.27260716373995 12.597147018786735 19.63127028376131 10.150123782198754 ;
31.494861541983948 0.0 141.5111941134292 41.88555825267553 58.917158851280355 9.762982952469965 7.384440523300537 28.351756357507515 16.04086466045052 37.10118155371501 40.3755527848081 37.61922147551918 3.2462465352596106 29.38336172883911 4.59990701966642 5.814183766993325 3.312781062229951 35.902601058297336 36.56652496525558 19.73706426552398 21.405183412860502 47.23245788246237 36.328568936083016 14.632876089338279 13.92979589620523 5.1864886049010135 45.60148417573473 4.232665718916753 21.241502453721008 18.29794577169623 ;
142.18423175408495 34.536071957620806 0.0 82.71491714043398 41.8996230058621 1.1436297289342578 38.332179431377234 16.957756851746616 44.29439322423627 8.920506006949138 61.06998446600775 16.34721164986387 15.630199025229889 17.86562780913337 53.94310481645025 11.816628590240526 21.155770545441634 29.318236268835694 28.452372582871565 7.2918195823550125 27.293947942796876 67.41858643140316 15.04979712246552 16.72044994867743 2.5711062108937757 22.38628620283419 53.60913372797155 1.2056354338217192 4.79148904270591 35.650270696101146 ;
29.68516903301186 25.378946873338727 31.391637677919917 0.0 42.221424150967245 323.0877366643814 166.99223018219706 192.64520304887037 69.14985535269001 105.34626507389204 48.35263868225743 94.76556727725927 46.14737624386132 131.369968630617 0.8623743230026937 77.93439298123447 92.22366344717197 96.28523525183091 31.927420191546634 183.34927770831 32.56765858706884 23.487815267531005 73.34539627611173 55.999197220314926 167.2567422306865 178.28599651237658 125.6738466934043 39.577008044008146 8.273007994783375 49.337157103788066 ;
38.39258902495918 52.72231543685613 26.718775629195378 71.10339464691874 0.0 61.81395865652479 24.479543997178396 64.94195558394372 139.88027490990817 20.884876607302125 140.55273383690516 12.241331745289136 30.603646032827744 99.42047618795432 93.3671260115587 72.43836184732609 52.45723454203056 59.9526926830248 14.685391564031953 65.9425051075843 9.55838859669169 133.06514239216898 81.76438156244795 50.38099227233281 88.19051548559986 109.60643671505457 78.28409327376905 48.47116964142806 17.2840894035792 25.698750240236997 ;
52.09250988331337 26.83451011762752 74.51784792143097 154.46808151888553 77.31048254330442 0.0 85.0063714495817 278.28281443159415 685.1482123946319 48.55782729877057 237.58407106793527 21.53624876556325 181.7254538025889 84.05659773028101 133.5367086537686 57.23335397217445 184.7097547443346 175.29425481879238 88.64145127590069 282.9367223322998 112.06746184415509 171.66965548516777 59.595884417086204 158.61952136115661 171.96357160353057 22.743340649739643 549.0688238109758 33.250152348175675 2.8851203558352903 13.874401231747887 ;
45.97972955937436 21.004790112621688 8.812556235657517 372.65885373781475 125.36109862854275 211.60270723656004 0.0 71.05783443882072 203.80334202013645 197.410437537102 20.68203432299082 44.807159650155285 125.08129298472022 110.20656202048517 286.5925042493592 143.55296530289175 39.7747926959701 136.83285220192016 73.94804319309519 275.04751610910444 82.35967262036749 285.5544823360097 442.07325467851234 47.54137766367412 359.8570428745125 345.2279533228719 458.27575910368046 46.657611716906445 7.663739554369238 57.01569867585633 ;
5.021542302970324 40.20538415694773 57.24671523093727 81.42112729555622 86.04178076863728 259.1829584704564 34.00753740140477 0.0 83.82716605750663 47.54692036781037 399.78393567436154 159.45039706183942 344.8102884958739 255.3547041246348 214.215109300884 4.864196838627223 52.713323986087445 113.58381046170749 45.40429637081341 506.2490080388651 94.46487943767626 164.92083459060348 118.22224092161208 14.160759321054027 107.59271784655265 25.55731896385916 78.55877414678363 24.914012198213282 52.0295526446193 30.0021747707864 ;
22.86208462500563 38.97266052889325 10.512520593251358 105.34410394021677 56.366049094699704 688.8487655301542 162.57570758547286 411.5126857932968 0.0 39.094747800864724 3757.795009439389 116.44241919499544 46.13429057577737 90.76933076359362 191.5488050660343 195.55035508659626 142.24836479206164 80.510562426694 27.854858897458687 187.95018977429748 40.7139142423924 286.56630607073373 125.42120435731213 105.86547213188119 226.56222569353744 106.73601696269283 236.4234233416846 75.09183416376709 51.357706169820105 40.92920913711605 ;
27.460869345909508 11.673578037034922 40.980407855349476 23.951755637782895 5.127066244246652 44.685205202201416 0.8892397105894408 38.06350723884274 60.0284654322831 0.0 74.07770893299545 156.86787529299934 155.41146304086914 108.4572051998729 45.90620044664251 22.10781688550522 100.92910693671293 77.60666220618944 125.97038088176946 78.29342057782748 117.07667735615291 51.355826306630306 214.70019240628721 590.3910229515511 102.289735582409 89.07897617398018 146.9315312530131 113.71913177078234 21.38612136980505 61.050185554481374 ;
6.7708065579490215 37.27071930923268 32.68187535857535 179.35666706576478 104.49459283493206 18.958929170121266 236.77123401158534 110.13818617973176 3295.2785856026244 107.31870188305165 0.0 32.19886399240686 82.8366298352541 213.88995926400509 76.98924135221495 119.97913088395217 1.6402212947998447 158.16212180721678 71.00050815005932 9.080616335328227 83.65702482977464 570.9896126876811 184.67432733273037 59.32717893673625 88.82817316507156 22.308128048314202 138.71268217300263 78.65585355520284 14.35607748627367 48.72198170832107 ;
38.351869285998404 9.396980339794535 18.35974450068454 84.32222886271835 1.174552133244475 80.96512822263725 143.51702983515332 132.4004772692643 64.62813140017522 6.540576706943699 103.89574637493129 0.0 121.30928290568446 328.82066141501195 100.00425012430229 36.13283605259796 31.321973600719286 40.38476429758946 206.6379820181249 212.6721175511711 273.5184234285179 111.69741160437326 54.18470481834527 30.26753593202279 191.9146167396976 42.26214940695239 106.10010130309205 30.22851364925107 21.946438286517424 10.40691477178698 ;
41.62744327507124 19.629414563174002 33.537540634128995 44.46344128353974 6.5007165210786235 98.80971620329498 95.33317563169331 126.17767650953492 143.01102735649783 29.270959540646977 161.34383904268398 187.28034799750472 0.0 58.924827433522225 104.2567956666003 178.65471645888414 33.02713393952593 679.3101602820127 58.69291153269175 149.33907665858138 35.34540926977897 30.59744424524696 31.303158664281035 102.55902289271232 91.81509217933605 1.4118928632031218 158.8783626089207 59.23629058665537 7.7576782674900056 10.386167760380582 ;
36.51941278593408 4.029801940586978 21.20097350845156 81.99648657038338 23.633648296368104 47.553836697183584 154.4671285245819 143.3782428464899 160.68449591850185 117.90962300357161 195.32050882871954 261.68644295408234 516.8565182992014 0.0 199.78514477660735 973.4420183408446 87.74196479399362 537.813060278995 19.56996840443764 252.28374700772542 221.63070843952397 141.85884457557205 91.91504458319244 60.731730037385546 377.0933834513271 141.70769416641843 161.6809818662274 47.4772362160264 27.27062220215134 26.00115227681994 ;
13.617102513432773 37.33834140981646 1.9186298545578326 154.2103419306311 12.358608745716317 40.641478145486104 57.22818185650379 42.35894819210277 224.85898097664327 170.4527085177278 141.99811047537108 124.47517645137272 35.51575206334267 116.59590468025206 0.0 622.1894693595692 310.00754734956394 127.10962702122417 98.53910084452652 185.18059719856143 38.02333496395961 133.8321548507385 178.16311441622616 182.06323461940144 344.8284970729088 22.477390181782503 180.44578743778885 127.72566949306918 50.85027188122453 73.09551960191129 ;
8.334521475942564 36.80146909244862 60.8293886077392 12.396985636649005 1.9353214833157628 26.809689738931628 31.200725361059547 584.7936407363113 2.2996722418521083 157.75836191587294 172.6603000061885 287.9396229061799 298.5258577237955 517.6219234078549 993.3335392737944 0.0 326.7450487157573 156.6635323377268 64.47060454153785 478.0970369189045 135.95781884103437 46.79487746247771 78.99894282334257 4.189008600210087 558.1860944026181 207.78358551794022 121.97094214998997 76.0201104624561 20.48484117714243 24.783726234132175 ;
23.287809066645295 6.315743187963324 46.80797885665815 91.6484437267521 18.95101593842935 161.02122294709807 120.64582605240544 82.29273799934347 53.7661612004802 55.89144061083828 158.0876213664737 133.85303527901755 178.17255083834783 219.0490605278054 45.45484645609568 284.78727044745233 0.0 137.59058902633274 148.55278872712904 317.9692566355557 169.75468604836288 148.585002951265 264.783728031564 321.3823082485604 175.76537395910168 297.64810373760656 169.71048958222548 12.996782154789665 14.872220899721471 13.589735372471727 ;
44.966000295706905 29.873476158988634 1.650445320480038 45.364336585358366 78.47544080230992 54.39505692506841 135.22158612262453 45.075832164513116 134.7838332114429 121.62787224589579 77.15700149398666 598.6306554737147 1169.0482875159444 204.0994446841682 297.77046894047294 304.66685956846663 113.6300193910654 0.0 26.661974068774196 79.90889266706365 424.7875932808894 80.07725960294513 8.932890962826212 86.05468094813642 25.02786321678912 35.85496630500521 10.69943688212737 57.75004058792218 7.315495683504021 69.23239781692753 ;
41.062873713494845 23.09016372788873 47.85718272070335 52.968585826246574 5.407290762778885 114.67057370651018 17.13280224782935 52.258829903640596 6.32091296328109 263.2829860614521 23.97076420847109 63.27380223954526 148.28043641563107 137.45837845527413 38.97788664428624 86.43270550190505 231.21743789002733 12.98648792526274 0.0 107.14687207596536 56.14974142416885 98.36195468627753 121.14218984279367 25.48757546227016 42.58280268675871 74.35103603735011 42.061124087631335 75.00941519453535 18.205471920479503 29.686734243951314 ;
32.509419813207195 28.554682542507148 26.558082258845673 35.513629103198525 53.3368687515205 209.02712200645365 206.46738484720507 585.3238574826904 287.10084667885593 130.23833134943897 41.27754293424059 155.66588001899947 243.97950160846315 140.28840307919285 521.0231145793504 399.1418798225984 41.84580834275861 183.20065238250044 51.17661500085937 0.0 73.44587105154554 1.2983844083946727 355.4868579868987 151.2229209577446 3165.862190736047 301.00573631908287 132.42656089265324 19.688331839345164 12.043360870581733 43.9670821127681 ;
23.336863310675273 24.44515909102373 6.2565287688505515 51.583317585724956 65.2058990412095 132.77747129936395 63.555210513772124 176.19057659875259 128.67986311334792 136.1015690704986 44.91073836735812 48.707565586222934 365.84180944951896 210.59575331089928 243.4026057907894 104.20348186431104 84.1503750204305 635.9864523302207 178.7018484454612 165.78487114588927 0.0 32.88433557125828 1.9542410966940864 101.19692217539341 189.7475032692383 54.11799024656848 147.2398878821368 10.695813566861974 38.526800319727464 6.319941205788306 ;
55.480161137862936 46.316203027665104 46.99988531356785 147.80757218457677 67.7308173806116 453.1795875844132 109.76290065939479 17.104093417832576 90.703727635174 77.69208852125004 643.3915882176664 148.42732329258905 163.58468877842242 83.06239349625679 146.0940477710473 158.3411306368601 82.0652085134679 166.26237463265923 95.02771129697373 253.52128182466146 55.41918950452524 0.0 97.69341901982239 136.55519775818988 89.82238952559487 200.94574722203672 142.8864928012776 9.941711722090034 16.007515423910792 19.009972079090424 ;
18.485050468139573 44.101196268730526 60.66093729470562 85.33715438406908 67.21201896335901 223.73489040989728 414.9385629547923 114.20581091513027 110.24483426704083 374.4805730890502 2.6093687802615984 46.498331537705326 152.26892149360745 159.88756606122362 24.9936992215104 224.7824161536003 492.0448116298648 0.42145351474465115 143.4653838709471 159.012145321507 103.73338448436834 18.780062555366932 0.0 160.8461829994696 258.1937895880893 59.0408366995803 203.79414888744122 84.6018265319696 56.31941301051699 2.316523082057109 ;
56.01809329885774 12.135547618709268 47.06487998549006 51.38015836974125 1.469577184552273 148.94203673622266 46.45315219803443 98.20688269853534 79.78296027868528 14.16697386686221 16.46871991924343 54.82157982354571 89.29746938207882 6.462968088215638 118.61652924343117 179.2063601283094 14.866905094091129 6.443493657881748 68.2450697591745 207.32999337489434 32.02873698597235 124.1702614821784 58.33362179528531 0.0 83.52803160741287 261.4978781000015 149.20633264275148 2.6471490487699443 13.810572328528899 54.366368082496926 ;
46.45177713889385 20.403210784338757 12.555808410962902 173.52508660472313 100.59507080735384 22.198294173712416 115.88811312357709 3.9875274353586874 154.14518894059705 99.92327327544545 52.45348931867582 91.60587707896393 275.7959242728387 272.49686671680956 39.31632954358431 191.95944579280197 78.48141608164853 103.25617145554526 159.1610594733898 1975.1671054557198 96.21828583469099 213.64304607645582 304.9546267609944 94.43568369586202 0.0 195.8200382759925 320.9598640664227 38.150268072238916 26.59603360774225 38.305965771143235 ;
53.87895126862388 30.028476813279585 6.294700794574546 25.20914454073146 50.840135314858856 59.524695497604625 727.8455731413884 133.5795633182474 112.98877636135204 204.0424672336499 16.07017274876026 21.67187613894565 96.1252712956013 5.391031962700179 235.84176570149313 3.314444031567273 154.4545957082885 135.746045045911 37.974144700898414 199.67593765857507 72.54749483112221 189.7794389677955 1149.3959377858127 287.2804211154193 204.26477676808818 0.0 234.54372971860212 23.02225018513264 12.419488432802394 31.646797775797666 ;
33.57472498744336 50.47575316241179 8.018382036712454 103.57993623374594 73.61283154615064 409.24501061768905 165.4454103501389 378.7412833004331 211.70078208227613 149.4488203047336 231.2548464198606 122.28837267412611 92.49405117923425 123.99872567165333 256.54260459178204 35.01986017638873 108.46686838227303 123.75428561450939 82.71083686162001 413.9468068418725 143.14789783663292 472.86006854513795 330.9469100595067 25.21245157659086 312.744238704797 63.15742227228365 0.0 68.104869313729 36.48383677674738 61.67979256364528 ;
30.821899111488264 8.40718046754111 30.967926559369516 69.91615009109721 52.58204240959847 31.901781249946158 54.68044903933134 69.56355844905886 56.2112419578659 92.30480353182358 7.186366711885253 46.415132293908066 47.72902788712277 66.0746217194581 27.141446221542836 91.6610941164144 82.57109992480206 12.572235317050426 48.778450304351914 81.27224777442169 161.24650059877516 14.492181335728176 0.21732900706683045 69.47457840629677 5.953988097389729 39.144937558877345 62.91387510012386 0.0 60.96118687993791 124.92349551008206 ;
13.099918856464862 19.38425409923631 23.249021655330953 4.835941213910453 20.633500148254093 36.06364116142857 18.841332017260434 51.69655275044675 30.229238026236402 0.23205063573653076 13.611818496032525 24.389929114624742 42.97297806917853 25.742835589201952 21.275500253997393 56.35891764022837 56.50280040939953 23.272888845478857 28.254590634330643 46.231887080535955 28.965322274898323 46.508128177372875 55.38902939738242 3.3028134202924924 55.67555125773346 12.153054127061713 12.543198405082912 107.72126462934608 0.0 329.63894124557726 ;
11.213250381691179 26.848448611077668 18.832383966076435 43.55078490763704 18.464610845886984 31.8485147270627 13.352720978661502 33.92400378695512 46.41002164541851 45.75668244504216 2.2263683726389347 90.25315642230838 22.57068260937518 72.29252772862061 29.56386409911978 9.18262788852219 54.75622711941617 11.724217664943337 95.0596950174697 60.07134531750723 61.35784986638709 44.52887227900086 10.484620558052102 57.634386530484335 19.725554352329592 2.968597906990509 38.947014247995895 91.20404010199177 382.03828834518146 0.0 ;
];

% number of nodes
[n,~]=size(A);
% number of edges
m = sum(A,'all');
% default nodep values
nodep = ones(1,n);
% objective function
fun = @(x)evalWeights(x,A,C,D,nodep);
% upper and lower variables bounds weights are ranged in [1,20]
lb = ones(1,m);
ub = 20 .*ones(1,m);
% all variables are integer
IntCon = 1:m;
options = optimoptions('ga','PlotFcn', @gaplotbestf,'ConstraintTolerance',0.00001);
[w,fval] = ga(fun,m,[],[],[],[],lb,ub,[],IntCon,options);

