#!/bin/sh

while true; do
    read -p 'Is this the second phase of encryption for .bam files, AFTER .fastq?
Answer "yes" if you encrypted and uploaded .fastq files already and you want to encrypt/upload .bam.
Answer "no" to encrypt and upload other files for the first time    
' yn
    case $yn in
        [Yy]* ) cat dataset/user_folder/metadata/Samples_Information.csv | tr "," "\t" | sed 1d | cut -f1,13,14 > dataset/user_folder/metadata/Samples_Information_3cols.tsv.tmp;
                sed 's/\"//g' dataset/user_folder/metadata/Samples_Information_3cols.tsv.tmp > dataset/user_folder/metadata/Samples_Information_3cols.tsv;
                rm dataset/user_folder/metadata/Samples_Information_3cols.tsv.tmp; break;;
        [Nn]* ) cat dataset/user_folder/metadata/Samples_Information.csv | tr "," "\t" | sed 1d | cut -f1,11,12 > dataset/user_folder/metadata/Samples_Information_3cols.tsv.tmp;
                sed 's/\"//g' dataset/user_folder/metadata/Samples_Information_3cols.tsv.tmp > dataset/user_folder/metadata/Samples_Information_3cols.tsv;
                rm dataset/user_folder/metadata/Samples_Information_3cols.tsv.tmp; break;;
        * ) echo "Please, answer y|yes or n|no.";;
    esac
done
