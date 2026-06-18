#PIPELINE UFFICIALE NVIDIA


tar xvf parabricks_sample.tar.gz

 docker run \
      --low-memory
      --gpus all \
      --rm \
      --volume $(pwd):/workdir \
      --volume $(pwd):/outputdir \
    nvcr.io/nvidia/clara/clara-parabricks:4.7.0-1 \
    pbrun fq2bam \
      --ref /workdir/parabricks_sample/Ref/Homo_sapiens_assembly38.fasta \
      --in-fq /workdir/parabricks_sample/Data/sample_1.fq.gz /workdir/parabricks_sample/Data/sample_2.fq.gz \
      --out-bam /outputdir/fq2bam_output.bam

#HAPLOTYPE CALLER

docker run \
      --low-memory
      --gpus all \
      --rm \
      --volume $(pwd):/workdir \
      --volume $(pwd):/outputdir \
    nvcr.io/nvidia/clara/clara-parabricks:4.7.0-1 \
    pbrun haplotypecaller \
      --ref /workdir/parabricks_sample/Ref/Homo_sapiens_assembly38.fasta \
      --in-bam /workdir/fq2bam_output.bam \
      --out-variants /outputdir/variants.vcf
