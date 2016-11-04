FROM mhart/alpine-node:latest
MAINTAINER Erik Stidham <estidham@gmail.com>

# Install bash (for wercker)
RUN apk update && apk add bash && rm -rf /var/cache/apk/*
# Install wkthml2pdf
RUN apk add --no-cache \
		    xvfb \
# Additionnal dependencies for better rendering
			ttf-freefont \
			fontconfig \
            dbus \
    && \
# Install hackmyresume
	npm install -g hackmyresume && \
	for x in $(\
		# Needed to not run out of heap space for npm search
		node --max-old-space-size=4000 \
		# Search for all themes
		/usr/bin/npm search jsonresume-theme | \
		# Strip colors and cut just the name of the package
    	sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" | cut -f1 -d' '); \
	do \
		npm install $x; \
	done && \
	rm -rf /root/.npm
