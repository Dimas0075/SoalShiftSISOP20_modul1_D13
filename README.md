# SoalShiftSISOP20_modul1_D13

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
