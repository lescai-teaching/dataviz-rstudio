FROM rocker/verse:4.1.2

RUN Rscript -e "install.packages('BiocManager', repos = 'https://cloud.r-project.org')"

RUN Rscript -e "BiocManager::install(c(\
    'tidyverse', \
    'knitr', \
    'plotly', \
    'streamgraph', \
    'esquisse', \
    'circlize'\
    ))"
