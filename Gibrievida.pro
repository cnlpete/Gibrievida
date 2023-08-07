TEMPLATE = subdirs

OTHER_FILES += \
    rpm/harbour-gibrievida.spec

DISTFILES += \
    rpm/harbour-gibrievida.yaml \
    rpm/harbour-gibrievida.changes

SUBDIRS += \
    sailfishos

OTHER_FILES += \
    .github/workflows/main.yml
