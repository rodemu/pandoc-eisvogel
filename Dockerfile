FROM pandoc/latex:edge

# Eisvogel latex-template
RUN tlmgr install \
    adjustbox \
    babel-german \
    background \
    bidi \
    collectbox \
    csquotes \
    everypage \
    filehook \
    footmisc \
    footnotebackref \
    framed \
    fvextra \
    letltxmacro \
    ly1 \
    mdframed \
    mweights \
    needspace \
    pagecolor \
    sourcecodepro \
    sourcesanspro \ 
    titling \
    ucharcat \
    ulem unicode-math \
    upquote \
    xecjk \
    xurl \
    zref \
    koma-script

# Japanese
RUN tlmgr install \
    babel-japanese \
    luatexja \
    haranoaji

# Eisvogel
ARG EISVOGEL_VER="2.4.0"
RUN mkdir -p /opt/pandoc/templates && \
    wget -O - https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v${EISVOGEL_VER}/Eisvogel-${EISVOGEL_VER}.tar.gz | \
    tar zxvf - -C /opt/pandoc/templates

# PlantUML
RUN apk add --no-cache \
    graphviz \
    openjdk11 \
    python3 \
    py3-pip \
    ttf-droid \
    ttf-droid-nonlatin

ARG PLANTUML_VER="1.2023.9"
RUN wget https://github.com/plantuml/plantuml/releases/download/v${PLANTUML_VER}/plantuml-${PLANTUML_VER}.jar -O /opt/plantuml.jar

RUN pip3 install --upgrade pip
RUN pip3 install pandoc-plantuml-filter

ENV PLANTUML_BIN="java -jar /opt/plantuml.jar"

ENTRYPOINT [ "/usr/local/bin/pandoc" ]