# netcat-httpresponder
a docker container that will throw empty response codes based on environment variables

##Minimal Node.js Docker Images

Versions v0.0.1
built on [Alpine Linux](https://alpinelinux.org/).


##Examples

For throwing 410 response code with the default "Gone" Message.

    $ docker run --name netcat -d -e RESPONSE_CODE=410 -e RESPONSE_MESSAGE="Gone" -p 8080:8080 netcat-httpresponder

Throwing a 500 error response.

	$ docker run --name netcat -d -e RESPONSE_CODE=500 -e RESPONSE_MESSAGE="Internal Server Error" -p 8080:8080 netcat-httpresponder
	
Returning a empty response

	$ docker run --name netcat -d -e RESPONSE_CODE=204 -e RESPONSE_MESSAGE="No Content" -p 8080:8080 netcat-httpresponder
	
Please refer to a list of response codes.  https://en.wikipedia.org/wiki/List_of_HTTP_status_codes


##Todo
This image currently does not support `301` or `302` response codes as that requires an extra header in the response.  I plan to add that at a later date.