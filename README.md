# Custom Selenium docker containers

Modified version of selenium docker containers which will:

* echo selenium queue details regularly to console so that service like AWS could read them and make scalability decisions
* selenium node containers will go into DRAINING mode before shutting down, so that shutdown is graceful