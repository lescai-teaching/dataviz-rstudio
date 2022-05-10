FROM ghcr.io/lescai-teaching/dataviz-rstudio-amd64:1.0.0

RUN Rscript -e "BiocManager::install(c(\
    'cowplot', \
    'ggstatsplot', \
    'gganimate', \
    'gghighlight', \
    'MetBrewer', \
    'ggrepel'\
    ))"