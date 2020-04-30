----
Info from Saga-people:

Since more users are using this software, each user must have their individual
copy of this file. So follow the guide, copy the file


/cluster/software/BUSCO/3.0.2-intel-2018b-Python-2.7.15/config/
config.ini.default


to config.ini in your HOME directory and add your own BUSCO settings. There
should be no need to specify any of the 'path' settings in the file since all
necessary packages (AUGUSTUS, HMMER, ...) are loaded when loading the BUSCO
module. Then specify


export BUSCO_CONFIG_FILE="/...path_to.../filename.ini"
-----

Example command to run BUSCO:

`run_BUSCO.py -i
   highest_expressed_isoform_kraken_nuclear_chloroplast_mitochondria_oneline_simple_header.fasta
   -o busco_chlor -l chlorophyta`
