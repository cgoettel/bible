FROM texlive/texlive:latest

COPY fonts/*.ttf /usr/share/fonts/truetype/
RUN fc-cache -fv
