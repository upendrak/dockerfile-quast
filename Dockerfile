FROM ubuntu:14.04.3
MAINTAINER Upendra Devisetty <upendrakumar.devisetty@gmail.com>
LABEL "QUAST: A tool to evaluate genome assemblies"

RUN apt-get update 
RUN apt-get install -y g++ \
                       make \
                       git \
                       python \
                       python-matplotlib \
                       zlib1g-dev \
		       cmake \
                       openjdk-6-jdk \
                       curl \
                       libboost-all-dev	

# cpanm modules
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Time::HiRes

# Quast git repo
RUN git clone https://github.com/ablab/quast.git
RUN chmod +x /quast/quast.py

ENTRYPOINT ["/quast/quast.py"]

CMD ["-h"]


# Build
# docker build -t"=ubuntu/quast" dockerfile-quast
# Testing
# docker run --rm -v $(pwd):/working-dir -w /working-dir ubuntu/quast test_data/contigs_1.fasta test_data/contigs_2.fasta -R test_data/reference.fasta.gz -O test_data/operons.txt -G test_data/genes.txt -o output_directory


