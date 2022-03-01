# Custom docker file for selenium hub which adds to base image a cron job to push custom metric to AWS
FROM selenium/hub:4.1.0-20211209

# aws metrics cron job and commands
# add cron job startup configuration to supervisor
WORKDIR /aws_metrics
COPY ./scripts/aws/ /aws_metrics/
COPY ./scripts/aws/cron.conf /etc/supervisor/conf.d/cron.conf

# install needed packages
RUN sudo apt-get update -y \
    && sudo apt-get install cron

# cron job that will execute script and post it's console result to main console output
# add 2 jobs with 30 second delay, so that you have cron jobs running every 30 seconds.
RUN (crontab -l ; echo "* * * * * sh /aws_metrics/selenium_availability.sh > /proc/1/fd/1 2>&1") | crontab -
RUN (crontab -l ; echo "* * * * * sleep 30 && sh /aws_metrics/selenium_availability.sh > /proc/1/fd/1 2>&1\n") | crontab -
RUN sudo chmod +x /aws_metrics/selenium_availability.sh




