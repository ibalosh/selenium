# Custom docker file for selenium hub which adds to base image a cron job to push custom metric to AWS
FROM selenium/node-chrome:4.1.0-20211209
COPY launch.sh /opt/bin/launch.sh
CMD ["/opt/bin/launch.sh"]