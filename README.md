# SoalShiftSISOP20_modul1_D13

# Anggota Kelompok
* Herri Purba                     05111840000056
* Nugroho Dimas Ardiyanto         05111840000075

# Soal 1
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum
untuk membuat laporan berdasarkan data yang ada pada file “ Sample-Superstore.tsv” .
Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
sedikit
b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
sedikit berdasarkan hasil poin a
c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
sedikit berdasarkan 2 negara bagian (state) hasil poin b
Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan
laporan tersebut.
# Penyelesaian
a ) Menampilkan region yang memiliki keuntungan paling sedikit
> awk -F"\t" 'NR > 1 {sen[$13] += $21}
END { for (i in sen) print i,sen[i] }' /home/dimas/Downloads/Sample-Superstore.tsv | sort -n | head -1
* -F"\t" Field Separator memakai tab
* NR > 1 membaca dari baris kedua
* sen[$13] += $21 menjumlahkan setiap bagian dari profit yang ada pada region
* for (i in sen) print i,sen[i] digunakan sebagai perulangan untuk mencetak ada berapa region 
* | sort -n | head -1 merupakan fungsi sorting dan head -1  untuk menampilkan list paling atas

b ) Menampilkan 2 state yang memiliki keuntungan paling sedikit pada region hasil dari poin a
> awk -F"\t" 'NR > 1 {if ($13 == "Central") sen[$11] += $21}
END { for (i in sen) print sen[i],i }' /home/dimas/Downloads/Sample-Superstore.tsv | sort -n | head -2
* if ($13 == "Central") karena region yang memiliki profit paling sedikit merupakan Central, maka pencarian state dipersempit hanya pada region Central
* sort -n | head -2 menampilkan 2 list teratas

c ) Menampilkan 10 produk yang memiliki keuntungan paling sedikit dari 2 state pada region Central
> awk -F"\t" 'NR > 1 {if ($11 == "Texas" || $11 == "Illinois" ) sen[$17] += $21}
END { for (i in sen) print sen[i],i }' /home/dimas/Downloads/Sample-Superstore.tsv | sort -n | head -10
* $11 == "Texas" || $11 == "Illinois" merupakan dua state dengan keuntungan paling sedikit dan disini menggunakan operator OR (||) karena menampilkan gabungan item dari dua state tersebut
* sort -n | head -10 menampilkan 10 item pertama

# Soal 2
Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan
data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka
meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide.
Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide
tersebut cepat diselesaikan. Idenya adalah kalian (a) membuat sebuah script bash yang
dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
besar, huruf kecil, dan angka. (b) Password acak tersebut disimpan pada file berekstensi
.txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.
(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di
enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal:
password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt
dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan
file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula
seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28,
maka akan menjadi huruf b.) dan (d) jangan lupa untuk membuat dekripsinya supaya
nama file bisa kembali.

# Penyelesaian
a ) Membuat sebuah script bash yang
dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
besar, huruf kecil, dan angka.
> cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1
* /dev/urandom Melakukan pengacakan string
* tr -dc 'a-zA-Z0-9' Metode Caesar Cipher yaitu dengan menggunakan perintah "tr" untuk membatasi string yang akan di acak nanti atau dengan kata lain yang ada hanya yang dibatasi saja
* fold -w 28 Menentukan panjang sting yang di acak
* head -n 1 Menentukan banyak dari string yang di acak dengan panjang 28 tadi

b ) Password acak tersebut disimpan pada file berekstensi
.txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.
> cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1 > $judul.txt
*  " > $judul.txt" Hasil dari string yang di acak di masukkan ke dalam file yang berekstensi .txt

c ) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di
enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam
>besar=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
kecil=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" )
jam=`date +"%H"`
judul=`echo $1 | tr [A-Za-z] ["${besar[$jam]}"-ZA-"${besar[$jam-1]}""${kecil[$jam]}"-za-"${kecil[$jam-1]}"] | tr -d [:digit:] | cut -d '.' -f1`
* Pertama saya inialisasi huruf besar dan huruf kecil karena saya mengunakan sistem array
* jam=`date +"%H"` Mencari jam berapa saat membuat password
* ${besar[$jam]} Menentukan batas awal huruf besar sesuai jam pembuatan file password
* ${besar[$jam-1]} Menentukan batas akhir huruf besar sesuai jam pembuatan file password
* ${kecil[$jam]} Menentukan batas awal huruf kecil sesuai jam pembuatan file password
* ${kecil[$jam-1]} Menentukan batas akhir huruf kecil sesuai jam pembuatan file password
* tr [A-Za-z] ["${besar[$jam]}"-ZA-"${besar[$jam-1]}""${kecil[$jam]}"-za-"${kecil[$jam-1]}"] Memberi batasan mengubah setiap huruf yang diberikan dan memberi acuan huruf yang di ganti sesuai jam, seperti mis A akan di ubah ke huruf besar yang ditentukan oleh perintah ${besar[$jam]} sesuai jam pembuatan file password
* tr -d [:digit:] Membatasi jika ada angka yang di masukkan maka tidak akan diikutkan dalam pembuatan file password
* cut -d '.' -f1 Memotong atau membatasi ekskusi jika ditemukan titik untuk mis: file yang dimasukkan bernama test.txt maka yang akan di eksekusi adalah test aj karena menemukan tanda '.'

d ) jangan lupa untuk membuat dekripsinya supaya
nama file bisa kembali.
>besar=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
kecil=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" )
jam=`date +"%H"`
judul=`echo $1 | tr ["${besar[$jam]}"-ZA-"${besar[$jam-1]}""${kecil[$jam]}"-za-"${kecil[$jam-1]}"] [A-Za-z] | tr -d [:digit:] | cut -d '.' -f1`
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1 > $judul.txt
* Hampir sama dengan yang c ,tapi perbedaannya dalah Batas awal dan ke huruf dengan batas awalnya A di balik sperti berikut
> tr ["${besar[$jam]}"-ZA-"${besar[$jam-1]}""${kecil[$jam]}"-za-"${kecil[$jam-1]}"] [A-Za-z] 
