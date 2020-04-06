FROM quay.io/kubernetes-ingress-controller/custom-error-pages-amd64:0.4

ARG CUSTOM_ERROR_PAGE_4XX="https://raw.githubusercontent.com/SocialGouv/maintenance/master/index.html"
ARG CUSTOM_ERROR_PAGE_5XX="https://raw.githubusercontent.com/SocialGouv/maintenance/master/index.html"

RUN wget ${CUSTOM_ERROR_PAGE_4XX} -O ./www/4xx.html \
  && wget ${CUSTOM_ERROR_PAGE_4XX} -O ./www/404.html \
  && wget ${CUSTOM_ERROR_PAGE_5XX} -O ./www/500.html \
  && wget ${CUSTOM_ERROR_PAGE_5XX} -O ./www/5xx.html

CMD ["/custom-error-pages"]
