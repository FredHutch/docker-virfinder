#!/usr/bin/env bats

@test "VirFInder" {
  run_virfinder.Rscript /usr/local/virfinder/LiverCirrhosis_2657Contigs.fasta /usr/local/virfinder/LiverCirrhosis_2657Contigs.tsv
  [[ -s /usr/local/virfinder/LiverCirrhosis_2657Contigs.tsv ]]
}
