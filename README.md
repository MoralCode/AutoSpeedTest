# AutoSpeedTest 

This is a series of docker configs that serves a similar purpose to [this](https://github.com/henrywhitaker3/Speedtest-Tracker) other docker-based speedtest script that was part of an answer to a [featured superuser question](https://superuser.com/questions/1713989/test-internet-speed-over-a-period-of-time). Unfortunately, when I tried the demo on firefox it seemed as though the graphs [werent working correctly](https://github.com/henrywhitaker3/Speedtest-Tracker/issues/934). The large number of files in that repo also seemed potentially excessive for what it was (logging and graphing some data), so I decided to make my own.


Currently this is still a work in progress

## Usage

run `docker build -t autospeedtest .` in the repo root to build the dockerfile. This sets up a cronjob to write the results of a speedtest to a CSV file in the `/data` folder every hour.

to run the container interactively, use the command: `docker run -it --volume <path_to_somewhere>:/data --network host autospeedtest`

the `--volume <path_to_somewhere>:/data` allows you to store and persist the generated CSV file somewhere.

`--network host` is important to avoid bottlenecks

