EU Referendum: Web Scraping UK government petition count
--------------------------------------------------------
.. image:: https://github.com/r0bis/ukEUvote/blob/master/graphs/votes_2016_06_27-11_49.png
    :width: 470 px
    
This is a quick way to keep track of how fast new requests are coming in for the petition for the 2nd referendum on EU membership. Here I am not so much concerned with the obvious political aspects but with how to track and document the amount of votes for the petition and the speed with which they come in.

In fact I was quite sure the number of votes will stop around several hundred thousand - once the threshold is reached. But it did not happen.

So that everybody could check the source of the petition page and see that data collection method is valid I add link to the page `Petition to the UK Government for the 2nd EU referendum <https://petition.parliament.uk/petitions/131215>`_. Source code of a webpage is usually shown with ``Ctrl-U`` combination.

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
* to improve mechanism of sharing this with people

Please feel free to improve this project or to suggest new features.

Best wishes,

Rob

**P.S.** output when you are making a graph from terminal will be like this::

    Rscript ./bin/votegraph.R 
    Loading required package: methods
    Attaching package: ‘lubridate’

    The following object is masked from ‘package:base’
        date

    Attaching package: ‘dplyr’
    The following objects are masked from ‘package:lubridate’:
        intersect, setdiff, union

    The following objects are masked from ‘package:stats’:
        filter, lag
    
    The following objects are masked from ‘package:base’:
        intersect, setdiff, setequal, union
    
    [1] 3676966
    [1]  63467 66725 54115 57959 72232 41902 39968 41523 39549 39391 37541 34765
    [13] 33206 29519 17603  8383  4014  2503  1854  1414   143  2419 10038 20808
    [25] 26895 21885 16961
    
Line starting with ``[1]`` gives total vote count, the next lines give petition signature counts per hour starting from sunday the 26th June at 9 AM.

Please note this simple analysis is *not* for debate on whether signatures are fraudulent or not. Government has enough means to cross reference the petition signatures with other databases (e.g. electoral registers) to filter out ineligible votes; it also certainly can delete fraudulent one-time e-mail address based signatures. Apparently the latter may have happened on Sunday the 26th at about 2 PM. I do not have any other explanation for the dip in vote count.

.. image:: https://github.com/r0bis/ukEUvote/blob/master/graphs/votes_2016_06_27-11_49.png


R