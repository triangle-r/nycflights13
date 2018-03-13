non_flights_files = airlines airports planes weather

non_flights_rda = $(addprefix data/, $(addsuffix .rda, $(non_flights_files)))

data_rda := data/flights.rda $(non_flights_rda)

all:$(non_flights_rda) data/flights.rda

$(non_flights_rda):data/flights.rda

data/%.rda:data-raw/%.R
	Rscript -e "source('$<')"
