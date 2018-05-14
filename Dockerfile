FROM ubuntu:16.04
MAINTAINER sminot@fredhutch.org

# Install prerequisites
RUN apt update && \
    apt-get install -y r-base python3 python3-pip bats

# Python dependencies
RUN pip3 install bucket-command-wrapper==0.3.0

# R dependencies
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile && \
    Rscript -e "install.packages('Rcpp'); source('https://bioconductor.org/biocLite.R'); biocLite('qvalue'); install.packages('glmnet')"

RUN mkdir /scratch

RUN mkdir /usr/local/virfinder
ADD data/VirFinder_1.1.tar.gz /usr/local/virfinder/
RUN R CMD INSTALL /usr/local/virfinder/VirFinder

ADD run_virfinder.Rscript /usr/local/bin/

ADD data/LiverCirrhosis_2657Contigs.fasta /usr/local/virfinder/
ADD test.bats /usr/local/virfinder/
RUN bats /usr/local/virfinder/
