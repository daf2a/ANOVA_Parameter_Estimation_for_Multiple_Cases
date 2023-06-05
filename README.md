# Laporan Praktikum Probabilitas dan Statistika

## Pendahuluan

Laporan praktikum ini disusun sebagai tugas dari mata kuliah Probabilitas dan Statistika kelas C. Praktikum ini membahas tentang Estimasi Parameter, Uji Hipotesis, ANOVA dan penggunaan distribusi tersebut dalam beberapa contoh kasus.

Nama Praktikan : Muhammad Daffa Ashdaqfillah\
NRP Praktikan : 5025211015
<br /> <br />

## **Modul II Estimasi Parameter, Uji Hipotesis, dan ANOVA**

### 1. Pengaruh Aktivitas A terhadap Kadar Saturasi Oksigen pada Manusia

Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas. <br />

![1z](/img/1z.png)

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

a. Carilah Standar deviasi dari data selisih pasangan pengamatan tabel

- Masukkan semua data pada tabel ke dalam RStudio

  ```r
  resp <- c(1,2,3,4,5,6,7,8,9)
  x <- c(78,75,67,77,70,72,78,70,77)
  y <- c(100,95,70,90,90,90,89,100,100)
  ```

- Lalu hitung selisih dari kedua data

  ```r
  dt <- data.frame(resp,x,y)
  diff <- dt[,3]-dt[,2]

  ```

- Hitung standar deviasi dari selisih data

  ```r
  std1 <- sd(diff)
  std1
  ```

Screenshoot : <br />
![1a](/img/1a.png)

Penjelasan : Dari hasil perhitungan diatas, didapatkan standar deviasi dari data selisih pasangan pengamatan tabel adalah 7.838651
<br />

b. Carilah nilai t (p-value)

- Untuk mencari nilai t, kita dapat menggunakan fungsi t.test() pada RStudio

  ```r
  t.test(before, after, alternative = "greater", var.equal = FALSE)
  ```

Screenshoot : <br />
![1b](/img/1b.png)

Penjelasan : Dari hasil perhitungan diatas, didapatkan nilai t sebesar 5.2055 dan p-value sebesar 0.0001473
<br />

c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴”.

- Untuk melihat Hasil komparasi antara dua varians, kita dapat menggunakan fungsi var.test() pada RStudio

  ```r
  var.test(y, x)
  t.test(y, x, var.equal = TRUE)

  ```

  Screenshoot : <br />
  ![1c](/img/1c.png)

- Untuk melihat Hasil komparasi antara nilai t dan nilai kritis, serta p-value dan tingkat signifikansi, kita dapat menggunakan fungsi t.test() pada RStudio

  ```r
  t.test(y, x, var.equal = TRUE)

  ```

  Screenshoot : <br />
  ![1c2](/img/1c2.png)

Penjelasan : Terlihat dari hasil output yang dihasilkan nilai dari percobaan di atas adalah nilai mean pada `t.test(y, x, var.equal = TRUE)` sama dengan yang ada di poin 1b, sehingga tidak memiliki pengaruh yang signnifikan dalam statistika.
<br />

### 2. Uji Klaim Rata-rata Jarak Tempuh Mobil

Diketahui bahwa mobil dikemudikan rata-rata lebih dari 25.000 kilometer per 
tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak 
diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak 
menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3.000 kilometer

a. Apakah Anda setuju dengan klaim tersebut? Jelaskan. <br />
Setuju, karena nilai mean yang didapatkan lebih kecil dari nilai mean yang diklaim  <br />

b. Buatlah kesimpulan berdasarkan p-value yang dihasilkan!
- Untuk mencari niali p-value, kita dapat menggunakan fungsi zsum.test() pada RStudio

    ```r
    zsum.test(mean.x = 23500, sigma.x = 3000, n.x = 100,
            alternative = "greater", mu = 25000,
            conf.level = 0.95)
    ```

Screenshoot : <br />
![2b](/img/2a.png)

Penjelasan : Karena nilai p-value lebih besar dari 0.05, maka kita dapat menyimpulkan bahwa klaim tersebut benar. dan kita dapat menolak H0. Selain itu, karena dalam output tertulis bahwa `true mean is greater than 25000
95 percent confidence interval:  23006.54 NA` maka kita dapat menyimpulkan bahwa nilai mean yang didapatkan lebih kecil dari nilai mean yang diklaim, sehingga klaim tersebut benar.
<br />

### 3. Analisis Perbedaan Rata-rata Saham antara Kota Bandung dan Bali

Diketahui perusahaan memiliki seorang data analyst yang ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya
didapatkanlah data berikut dari perusahaan saham tersebut.

![3z](/img/3z.png)

Dari data di atas berilah keputusan serta kesimpulan yang didapatkan. Asumsikan  nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? 

a. H0 dan H1
- Perhitungan H0 = 9.74765 <br />
    ![3a1](/img/3a1.png)
- Perhitungan H1 = 9.664844 <br />
    ![3a2](/img/3a2.png)

b. Hitung sampel statistik
- untuk menghitung sampel statsitik, kita dapat menggunakan fungsi tsum.test() pada RStudio
    ```r
    tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, mean.y =2.79 , s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)

    ```
    Screenshoot : <br />
    ![3b](/img/3c.png)

Penjelasan : Dari hasil perhitungan diatas, didapatkan nilai t sebesar 1.8304 dan p-value sebesar 0.03691. 
<br />

c. Lakukan uji statistik (df =2)

- Untuk melakukan uji statistik, kita dapat menggunakan fungsi plotDist() pada RStudio

    ```r
    plotDist(dist='t', df=2, col="blue")
    ```

    Screenshoot : <br />
    ![3c](/img/3d.png)

d. Nilai kritikal

- Untuk mencari nilai kritikal, kita dapat menggunakan fungsi qchisq() pada RStudio

    ```r
    qchisq(p = 0.05, df = 2, lower.tail=FALSE)
    ```

    Screenshoot : <br />
    ![3d](/img/3e.png)

e. Keputusan <br />
- Dalam kasus ini, kita menggunakan α (tingkat signifikansi) sebesar 0.05. Jika p-value < α, maka kita dapat menolak H0 dan menerima H1. Sebaliknya, jika p-value ≥ α, maka kita gagal menolak H0.
- Dalam hal ini, p-value (0.03691) < α (0.05), sehingga kita menolak H0.

f. Kesimpulan <br />
- Terdapat perbedaan yang signifikan antara rata-rata saham Kota Bandung dan Bali.
- Rata-rata saham di salah satu kota (entah Kota Bandung atau Bali) lebih tinggi secara signifikan daripada rata-rata saham di kota lainnya.
<br />


### 4. Pengaruh Suhu dan Jenis Kaca Pelat Muka terhadap Keluaran Cahaya Tabung Osiloskop

Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk 
mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: 
https://drive.google.com/file/d/1pICtCrf61DRU86LDPQDJmcKiUMVt9ht4/view.

a. Buatlah plot sederhana untuk visualisasi data.
- Install library yang dibutuhkan
    ```r
    install.packages("multcompView")
    library(readr)
    library(ggplot2)
    library(multcompView)
    library(dplyr)
    ```

- Baca data
    ```r
    GTL <- read_csv("GTL.csv")
    head(GTL)
    ```
    Screenshoot : <br />
    ![4a1](/img/4a1.png)

- Cek struktur data
    ```r
    str(GTL)
    ```
    Screenshoot : <br />
    ![4a2](/img/4a2.png)

- Buat plot sederhana untuk visualisasi data
    ```r
    qplot(x = Temp, y = Light, geom = "point", data = GTL) +
    facet_grid(.~Glass, labeller = label_both)
    ```
    Screenshoot : <br />
    ![4a3](/img/4a3.png)

Penjelasan : Dari hasil plot diatas, dapat dilihat bahwa terdapat perbedaan keluaran cahaya tabung osiloskop pada suhu operasi 100˚C, 125˚C dan 150˚C. Selain itu, terdapat perbedaan keluaran cahaya tabung osiloskop pada jenis kaca pelat muka A, B dan C.
<br />

b. Lakukan uji ANOVA dua arah.
- Untuk melakukan uji ANOVA dua arah, kita dapat menggunakan fungsi aov() pada RStudio

    ```r
    GTL$Glass <- as.factor(GTL$Glass)
    GTL$Temp_Factor <- as.factor(GTL$Temp)
    str(GTL)

    anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
    summary(anova)
    ```

    Screenshoot : <br />
    ![4b](/img/4b.png)

Penjelasan : Dari hasil perhitungan diatas, didapatkan nilai F sebesar 198.7 dan p-value sebesar 1.25e-14.

<br />

c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi).

- Untuk menampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan, kita dapat menggunakan fungsi group_by() dan summarise() pada RStudio

    ```r
    data_summary <- group_by(GTL, Glass, Temp) %>%
    summarise(mean=mean(Light), sd=sd(Light)) %>%
    arrange(desc(mean))
    print(data_summary)
    ```

    Screenshoot : <br />
    ![4c](/img/4c.png)

Penjelasan : Dari hasil perhitungan diatas, didapatkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi).
<br />

