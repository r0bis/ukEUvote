EU Referendum: Scraping UK government petition count
----------------------------------------------------

This is a quick way to keep track of how fast new requests are coming in for the petition for the 2nd referendum on EU membership. Here I am not so much concerned with the obvious political aspects but with how to track and document the amount of votes for the petition and the speed with which they come in.

In fact I was quite sure the number of votes will stop around several hundred thousand - once the threshold is reached. But it did not happen.

The link to the page is here `Petition to the UK Government for the 2nd EU referendum <https://petition.parliament.uk/petitions/131215>`_

Tasks
~~~~~

* get the total number of undersigned people and time when the number was gathered
* plot the timeline
* provide the dataset to general public

This is the very beginning of this small project. I am running the data collection script every 5 minutes. I am updating the graph by running the graph script manually. I am pushing results to github a couple of times a day.

Most importantly - I do not interfere with the numbers I collect. For that reason everyone with basic R understanding (like me) can reproduce this data collection and graphing exercise. Hence everyone could replicate the same results as I have. 

Todo to improve
~~~~~~~~~~~~~~~~

* to track speed/rate at which the signatures are coming in
* to do hourly average number of signatures measurements
* to improve mechanism of sharing this with the public

Please feel free to improve this project or to suggest new features.

Best wishes,

Rob