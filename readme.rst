EU Referendum: Tracking UK government petition on 2nd referendum signature count
--------------------------------------------------------------------------------
.. image:: https://github.com/r0bis/ukEUvote/blob/master/graphs/votes_2016_07_05-01_30.png

Latest news:
~~~~~~~~~~~~
* **Thursday afternoon** signatures still coming in at rate about 1.2 K per hour; more than 10 K signatures today. Please do not pay attention to some ``0-s in signature count in last 5 hours`` - I had to take my computer offline for some time. It has now restarted data collection and the graph remains correct - for the couple of hours I did not have data, the line is interpolated.  
* Thursday morning - activity predictably down overnight. Also: it is interesting to note as per Greg Jefferis analysis (see link below) - there is much lower than expected activity from **Scotland** and **Northern Ireland**.
* Wednesday night - about **50 K** signatures accumulated today. 
* I came across proper analysis of the petition data - definitely well worth looking at: `http://rpubs.com/jefferis/EURef2Petition <http://rpubs.com/jefferis/EURef2Petition>`_. By @gsxej - Greg Jefferis on twitter.
* **Wednesday morning:** activity starts picking up again as people wake up. It changes from a couple of hundred per hour at night to over 2.5 K per hour by 9 AM. Maybe I should add average numbers per day, or daily activity graphs to see if they are similar every day.
* Tuesday night - **4 million signatures** reached. During the daylight **average activity: 5024 signatures per hour**
* Signatures still trickling in Monday night and reached **3.9 million** at ~ 6 AM on Tuesday. 
* Activity did slow down during during the working Monday from 24 K in the morning to 11 K about 6PM. However in the evening it picked up again peaking at 31 K and trailing to 16 K before 10 PM. 
* On Sunday activity was about 60 K per hour in the morning, then averaged 45,685 over next 13 hours. On Sunday before 2 PM 77 K signatures were discarded by the Government, it would appear - that is the notch you can see in the graph. Every internet based form can expect some people might use it improperly - please see *Disclaimer* at the bottom of this page. 
* Now this repo automatically updates every 5 minutes and you can find latest `data <https://github.com/r0bis/ukEUvote/tree/master/data>`_ and half-hourly `graphs <https://github.com/r0bis/ukEUvote/tree/master/graphs>`_ in their respective directories. Graph on this page is the latest.

Are the signatures coming from Britain?
=======================================

There is a very good data crunching page updated every 10 seconds that shows how many votes come from Britain and how many from totally unexpected geographic locations `http://kosso.eu/petition/# <http://kosso.eu/petition/#/>`_. That page also shows distribution of votes according to constituencies. This is also shown in Greg Jefferis analysis `http://rpubs.com/jefferis/EURef2Petition <http://rpubs.com/jefferis/EURef2Petition>`_

One thing to note is that **constituency** data are likely extracted from postcodes submitted in the petition form and the **geographical location** - automatically from the computer address that submission is coming from. Hence it may well make sense that in terms of computer address geolocation distribution Britain is in the first place and France in the second place - many British citizens do live in France. What is really interesting is the proportion of this signature location distribution.

About this graph
~~~~~~~~~~~~~~~~
    
This is a quick way to keep track of how fast new requests are coming in for the petition for the 2nd referendum on EU membership. In this project I am not so much concerned with the obvious political aspects but with how to track and document the amount of votes for the petition and the speed with which they come in.

In fact I was quite sure the number of votes will stop around several hundred thousand - once the threshold was reached. But it did not happen.

So that everybody could check the source code of the petition page and see that data collection and display method I am employing in my R script is valid I am including the link to `Petition to the UK Government for the 2nd EU referendum <https://petition.parliament.uk/petitions/131215>`_. You can examine source code of that page alongside with the R scripts in this repository. Source code of any webpage is usually shown with ``Ctrl-U`` combination in your browser.

Tasks
~~~~~

* get the total number of undersigned people and the time when the number was collected
* plot the the signature count against timepoints
* provide the data to the general public

It is the first stage of this small project. I am automatically running the data collection script ``voteBcount.R`` every 5 minutes. I update the graph by running the script ``votegraph.R`` every 30 minutes. I will be pushing results to this github site a couple of times a day, but the graph on this front page I may update only a few times a day.

Most importantly - I do not interfere with the numbers I collect. For that reason everyone with basic R understanding (like me) can quite easily reproduce this data collection and graphing exercise. Hence everyone could replicate the results I have. 

Todo to improve:
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
        
     [1] 3704087
     [1] 63467 66725 54115 57959 72232 41902 39968 41523 39549 39391 37541 34765
    [13] 33206 29519 17603  8383  4014  2503  1854  1414   143  2419 10038 20808
    [25] 26895 21885 19850 17084  3722

    
Line starting with ``[1]`` gives total vote count, the subsequent lines again starting with ``[1]`` give **petition signature counts per hour** starting from sunday the 26th June at 9 AM.

Disclaimer
~~~~~~~~~~

**Please note** this simple analysis is *not* for debate on whether signatures are fraudulent or not. Government has enough means to cross reference the petition signatures with other databases (e.g. electoral registers) to filter out ineligible votes or duplicates; they also certainly can delete fraudulent one-time e-mail address based signatures. Apparently the latter may have happened on Sunday the 26th at about 2 PM. I do not have any other explanation for the dip in vote count.


R
