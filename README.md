# SoalShiftSISOP20_modul1_B01

Soal Shift Modul 1
1. [Soal 1](#1-soal-1)
2. [Soal 2](#2-soal-2)
3. [Soal 3](#3-soal-3)


### 1. Soal 1
##### Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
##### a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit
##### b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
##### c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b
##### Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut.
##### *Gunakan Awk dan Command pendukung

File *Sample-Superstore.tsv* disimpan dalam folder `/home/sin/sisop/Modul1/SoalShift`. Pada folder yang sama, dibuat sebuah bash script bernama `soal1.sh`.
Isi dari bash script `soal1.sh` :

```sh
#!/bin/bash

echo "--------------------------------------------------------------------------------------------"
printf "Region dengan Profit terkecil adalah : "
awk -F '	' ' NR > 1 { a[$13]+=$21 } END { for ( b in a ) { print a[b], "->", b }}' Sample-Superstore.tsv | sort -rn > 1A.txt
one=`awk -F '->' '{print $2}' 1A.txt | sort -g | head -1`
echo $one
echo "--------------------------------------------------------------------------------------------"
printf " \n"

echo "--------------------------------------------------------------------------------------------"
awk -F '	' ' NR > 1 { if($13 == "Central") x[$11]+=$21 } END { for ( y in x ) { print x[y], "->", y }}' Sample-Superstore.tsv | sort -rn > 1B.txt
two=`awk -F '->' '{print $1, $2}' 1B.txt | sort -g | head -2 > 1BB.txt`
three=`awk -F ' ' '{print $2}' 1BB.txt`
printf "Dua State dengan Profit terkecil berdasarkan hasil poin A adalah : "
echo $three
echo "--------------------------------------------------------------------------------------------"
printf "\n"

echo "--------------------------------------------------------------------------------------------"
awk -F '	' ' NR > 1 { if($11 == "Illinois" || $11 == "Texas") c[$17]+=$21 } END { for ( d in c ) { print c[d], "->", d }}' Sample-Superstore.tsv | sort -rn > 1C.txt
four=`awk -F '->' '{print $1, $2}' 1C.txt | sort -g | head -10 > 1CC.txt`
printf "Sepuluh Produk dengan Profit terkecil berdasarkan hasil poin A ada di 1CC.txt\n"
echo "--------------------------------------------------------------------------------------------"


```
###### Untuk soal pertama yaitu soal a, diminta nama region dengan profit paling sedikit. Untuk memfilter data tersebut digunakan `awk` sesuai dengan kondisi yang diminta.

```sh
printf "Region dengan Profit terkecil adalah : "
awk -F '	' ' NR > 1 { a[$13]+=$21 } END { for ( b in a ) { print a[b], "->", b }}' Sample-Superstore.tsv | sort -rn > 1A.txt
one=`awk -F '->' '{print $2}' 1A.txt | sort -g | head -1`
echo $one
```
+ `awk -F '	'` berarti tab (	) digunakan sebagai field separator.

+ `' NR > 1 { a[$13]+=$21 } END { for ( b in a ) { print a[b], "->", b }}' Sample-Superstore.tsv | sort -rn > 1A.txt` berarti pencarian dilakukan dengan inputan file Sample-Superstore.tsv dan pencarian dilakukan dimulai dari baris kedua. Dibuat sebuah array *a* yang indeksnya adalah data yang ada pada kolom ke-13 dalam file tsv, yaitu field *Region*. Selanjutnya menjumlahkan data yang ada di kolom ke-21 dalam file tsv, yaitu field *Profit* dan disimpan di Array *a* pada indeks sesuai dengan data yang ada di kolom ke-13 yaitu field *Region*. Setelah itu dilakukan *looping* untuk mengoutputkan data yang telah difilter tadi dalam kondisi sudah di *sort* secara 
*reverse numeric* / *descending*. Record-record tersebut kemudian disimpan dalam file `1A.txt`.

+ one=`awk -F '->' '{print $2}' 1A.txt | sort -g | head -1` data yang ada pada file `1A.txt` difilter lagi dengan separator tiap field/ kolomnya adalah `->` dengan hanya mengambil data pada kolom kedua pada `1A.txt` yaitu region dengan profit paling sedikit yang telah di *sort* secara *generic number* lalu dimasukkan ke dalam variabel `one`.
+ `echo $one` berarti eksekusi perintah yang tersimpan di variabel `one`.

###### Soal kedua yaitu soal b, kita diminta untuk mengoutputkan 2 state yang memiliki profit paling sedikit menurut output soal `a`. `awk` kembali digunakan untuk mendapatkan output yag diinginkan.

```sh
awk -F '	' ' NR > 1 { if($13 == "Central") x[$11]+=$21 } END { for ( y in x ) { print x[y], "->", y }}' Sample-Superstore.tsv | sort -rn > 1B.txt
two=`awk -F '->' '{print $1, $2}' 1B.txt | sort -g | head -2 > 1BB.txt`
three=`awk -F ' ' '{print $2}' 1BB.txt`
printf "Dua State dengan Profit terkecil berdasarkan hasil poin A adalah : "
echo $three
```
+ `awk -F '	'` berarti tab (	) digunakan sebagai field separator.

+ `' NR > 1 { if($13 == "Central") x[$11]+=$21 } END { for ( y in x ) { print x[y], "->", y }}' Sample-Superstore.tsv | sort -rn > 1B.txt` berarti pencarian dilakukan dengan inputan file Sample-Superstore.tsv dan pencarian dilakukan dimulai dari baris kedua. Setelah itu dilakukan pengecekan pada filed ke-13 apakah merupakan `Central`. Dibuat sebuah array *x* yang indeksnya adalah data yang ada pada kolom ke-11 dalam file tsv, yaitu field *State*. Selanjutnya menjumlahkan data yang ada di kolom ke-21 dalam file tsv, yaitu field *Profit* dan disimpan di Array *x* pada indeks sesuai dengan data yang ada di kolom ke-11 yaitu field *State*. Setelah itu dilakukan *looping* untuk mengoutputkan data yang telah difilter tadi dalam kondisi sudah di *sort* secara 
*reverse numeric* / *descending*. Record-record tersebut kemudian disimpan dalam file `1B.txt`.

+ two=`awk -F '->' '{print $1, $2}' 1B.txt | sort -g | head -2 > 1BB.txt` berarti data yang ada pada file `1B.txt` difilter lagi dengan separator tiap field/ kolomnya adalah `->` dengan mengambil data pada kolom pertama dan kedua pada `1B.txt` yaitu dua `state` dengan profit paling sedikit yang telah di *sort* secara *generic number* lalu disimpan ke dalam file `1BB.txt`.
+ three=`awk -F ' ' '{print $2}' 1BB.txt` berarti data yang ada di file `1BB.txt` difilter dengan spasi( ) sebagai field separator. Data yang ditampilkan adalah data yang ada di field kedua saja

###### Soal ketiga yaitu soal c, kita diminta untuk mengoutputkan 10 produk yang memiliki profit paling sedikit menurut output soal `b`. `awk` kembali digunakan untuk mendapatkan output yag diinginkan.
```sh
awk -F '	' ' NR > 1 { if($11 == "Illinois" || $11 == "Texas") c[$17]+=$21 } END { for ( d in c ) { print c[d], "->", d }}' Sample-Superstore.tsv | sort -rn > 1C.txt
four=`awk -F '->' '{print $1, $2}' 1C.txt | sort -g | head -10 > 1CC.txt`
printf "Sepuluh Produk dengan Profit terkecil berdasarkan hasil poin A ada di 1CC.txt\n"
```
+ `awk -F '	'` berarti tab (	) digunakan sebagai field separator.
+ `' NR > 1 { if($11 == "Illinois" || $11 == "Texas") c[$17]+=$21 } END { for ( d in c ) { print c[d], "->", d }}' Sample-Superstore.tsv | sort -rn > 1C.txt` berarti pencarian dilakukan dengan inputan file Sample-Superstore.tsv dan pencarian dilakukan dimulai dari baris kedua. Setelah itu dilakukan pengecekan pada filed ke-11 apakah merupakan `Texas` atau `Illinois`. Dibuat sebuah array *c* yang indeksnya adalah data yang ada pada kolom ke-17 dalam file tsv, yaitu field *Produk*. Selanjutnya menjumlahkan data yang ada di kolom ke-21 dalam file tsv, yaitu field *Profit* dan disimpan di Array *c* pada indeks sesuai dengan data yang ada di kolom ke-17 yaitu field *Produk*. Setelah itu dilakukan *looping* untuk mengoutputkan data yang telah difilter tadi dalam kondisi sudah di *sort* secara 
*reverse numeric* / *descending*. Record-record tersebut kemudian disimpan dalam file `1C.txt`.
+ four=`awk -F '->' '{print $1, $2}' 1C.txt | sort -g | head -10 > 1CC.txt`berarti data yang ada pada file `1C.txt` difilter lagi dengan separator tiap field/ kolomnya adalah `->` dengan mengambil data pada kolom pertama dan kedua pada `1C.txt` yaitu sepuluh `Produk` dengan profit paling sedikit yang telah di *sort* secara *generic number* lalu disimpan ke dalam file `1BB.txt`.
 

### 2. Soal 2
##### Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian `(a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka.` `(b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.` `(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.) dan (d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.` HINT: enkripsi yang digunakan adalah caesar cipher. *Gunakan Bash Script

### 3. Soal 3
##### 1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. `[a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log"`. Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan`[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu` Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. `[c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak"`. Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep "Location". *Gunakan Bash, Awk dan Crontab

Bash script *soal3.sh* :

```sh
for i in {1..28}
do
    wget -o /home/sin/sisop/Modul1/SoalShift/cat/"wget1.log" "https://loremflickr.com/320/240/cat" -O /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_"$i".jpeg
    awk  '{print $0}' /home/sin/sisop/Modul1/SoalShift/cat/wget1.log >> /home/sin/sisop/Modul1/SoalShift/cat/wget.log
    grep "Location"  /home/sin/sisop/Modul1/SoalShift/cat/wget1.log >> /home/sin/sisop/Modul1/SoalShift/cat/Location.log
done

readarray -t loc < /home/sin/sisop/Modul1/SoalShift/cat/Location.log
for p in {0..27}
do
	count=$(ls -1 /home/sin/sisop/Modul1/SoalShift/cat/duplicate | wc -l)
	count1=$(ls -1 /home/sin/sisop/Modul1/SoalShift/cat/kenangan | wc -l)
	count=$(($count+1))
	count1=$(($count1+1))
	flag=$((0))
	for ((j=0; j<$p; j=j+1))
		do
		if [ $p -eq 0 ]
			then mv /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_1.jpeg /home/sin/sisop/Modul1/SoalShift/cat/kenangan/kenangan_"$count1".jpeg

		elif [ "${loc[$p]}" == "${loc[$j]}" ]
			then
			flag=$((1))
			break
		elif [ $j -eq 27 ]
			then
			flag=$((0))
		fi
	done

	if [ $flag -eq 0 ]
		then
			mv /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_"$(($p+1))".jpeg /home/sin/sisop/Modul1/SoalShift/cat/kenangan/kenangan_"$count1".jpeg
	else
		mv /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_"$(($p+1))".jpeg /home/sin/sisop/Modul1/SoalShift/cat/duplicate/duplicate_"$count".jpeg
	fi
done

awk  '{print $0}' /home/sin/sisop/Modul1/SoalShift/cat/wget.log >> /home/sin/sisop/Modul1/SoalShift/cat/wget.log.bak |
awk  '{print $0}' /home/sin/sisop/Modul1/SoalShift/cat/Location.log >> /home/sin/sisop/Modul1/SoalShift/cat/Location.log.bak

```

+ ` wget -o /home/sin/sisop/Modul1/SoalShift/cat/"wget1.log" "https://loremflickr.com/320/240/cat" -O /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_"$i".jpeg
` berarti kita mengunduh gambar yang ada di link tersebut lalu memasukkan log nya ke file `wget1.log` lalu file gambar yang kita unduh direname menjadi `pdkt_kusuma_(nomorurutsesuailoop)`.
+     `awk  '{print $0}' /home/sin/sisop/Modul1/SoalShift/cat/wget1.log >> /home/sin/sisop/Modul1/SoalShift/cat/wget.log` berarti kita *append* yang ada di dalam file `wget1.log` ke file `wget.log`.
+ `    grep "Location"  /home/sin/sisop/Modul1/SoalShift/cat/wget1.log >> /home/sin/sisop/Modul1/SoalShift/cat/Location.log` berarti kita mencari kalimat yang terdapat kata *Location* di dalamnya yang terdapat di file `wget1.log`, apabila sudah ketemu kalimat yang dimaksud akan di *append* ke file `Location.log`.
+ `readarray -t loc < /home/sin/sisop/Modul1/SoalShift/cat/Location.log` memasukkan setiap baris kalimat yang ada di `Location.log` ke *array* `loc`.
+ `count=$(ls -1 /home/sin/sisop/Modul1/SoalShift/cat/duplicate | wc -l)` menghitung banyak file yang ada di direktori `/home/sin/sisop/Modul1/SoalShift/cat/duplicate` dan menyimpannya di variabel `count`.
+ `	count1=$(ls -1 /home/sin/sisop/Modul1/SoalShift/cat/kenangan | wc -l)` menghitung banyak file yang ada di direktori `/home/sin/sisop/Modul1/SoalShift/cat/kenangan` dan menyimpannya di variabel `count1`.
+ `count=$(($count+1)) count1=$(($count1+1))` menambah 1 nilai `count` dan `count1`.
+ `flag=$((0))` set value `flag` menjadi 0.
+ ``` sh
	for ((j=0; j<$p; j=j+1))
		do
		if [ $p -eq 0 ]
			then mv /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_1.jpeg /home/sin/sisop/Modul1/SoalShift/cat/kenangan/kenangan_"$count1".jpeg

		elif [ "${loc[$p]}" == "${loc[$j]}" ]
			then
			flag=$((1))
			break
		elif [ $j -eq 27 ]
			then
			flag=$((0))
		fi
	done

	if [ $flag -eq 0 ]
		then
			mv /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_"$(($p+1))".jpeg /home/sin/sisop/Modul1/SoalShift/cat/kenangan/kenangan_"$count1".jpeg
	else
		mv /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_"$(($p+1))".jpeg /home/sin/sisop/Modul1/SoalShift/cat/duplicate/duplicate_"$count".jpeg
	fi
loop untuk mengecek apakah ada gambar yang sama yang sudah terdownload, apabila sudah ada gambar yang dimaksud maka gambar yang sedang dicek akan dipindahkan ke direktori `/duplicate` jika tidak maka akan dipindahkan ke direktori `/kenangan`.
+ `5 6-23/8 * * 0-5 bash /home/sin/sisop/Modul1/SoalShift/cat/soal3.sh` cron job untuk menjalankan `soal3.sh` secara otomatis, yaitu setiap 8 jam pada hari Minggu - Jumat dimulai pada jam 06.05.
