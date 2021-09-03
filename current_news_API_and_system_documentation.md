### TREND USING CURRENT NEWS API ::::
we want to build a TREND system like to see how people talk about specific subject in the last week for example...
like how many news talk about "sports" subject in the last WEEK...



# How many times to fetch
Our system will fetch data from Curent News API twice a day - every 12 hours - at 04:00 am and 04:00 pm
used *periodic tasks with sidekiq cron* 
reference:
* https://www.driftingruby.com/episodes/periodic-tasks-with-sidekiq-cron
* https://www.youtube.com/watch?v=7IBVg7myy7k

# pagination
* kaminari gem
* https://github.com/kaminari/kaminari



# API
we have three situations for the receiving current_news:

* *first: sometimes API do not provide any category for the receiving current_news like follow
{"id":"a81c2a36-4dd5-4f7d-8170-8eebbbb7b60d","title":"Cooperative Synthetic Inertia Control for Wind Farms Considering Frequency Regulation Capability","description":"To fully utilize the frequency regulation (FR) capability of wind turbines (WTs) and to avoid a secondary frequency drop caused by the rotor speed recovery, this paper firstly proposes an FR capability evaluation method for wind farms based on the principle of equal rotational kinetic energy of WTs,...","url":"https:\/\/www.frontiersin.org\/articles\/10.3389\/fenrg.2021.738857","author":"Hongqing Liu","image":"https:\/\/inteng-storage.s3.amazonaws.com\/img\/iea\/4N61QY4K6J\/sizes\/shark-virgin-birth_md.jpg","language":"en",

"category":[],

"published":"2021-08-30 00:00:00 +0000"},

++ in this case we give that current_news the "None" category name so the current news record will be like 
"id":"a81c2a36-4dd5-4f7d-8170-8eebbbb7b60d",
"title":"Cooperative Synthetic Inertia Control for Wind Farms Considering Frequency Regulation Capability",
"description":"To fully utilize the frequency regulation (FR) capability of wind turbines (WTs) and to avoid a secondary frequency drop caused by the rotor speed recovery, this paper firstly proposes an FR capability evaluation method for wind farms based on the principle of equal rotational kinetic energy of WTs,...",
"url":"https:\/\/www.frontiersin.org\/articles\/10.3389\/fenrg.2021.738857",
"author":"Hongqing Liu",
"image":"https:\/\/inteng-storage.s3.amazonaws.com\/img\/iea\/4N61QY4K6J\/sizes\/shark-virgin-birth_md.jpg",
"language":"en",

"category_id": will get the category id from category table where the category name is "None",

"published":"2021-08-30 00:00:00 +0000"


* *second: it send category like an array and that category name is ALREADY IN Category table:
{"id":"a81c2a36-4dd5-4f7d-8170-8eebbbb7b60d","title":"Cooperative Synthetic Inertia Control for Wind Farms Considering Frequency Regulation Capability","description":"To fully utilize the frequency regulation (FR) capability of wind turbines (WTs) and to avoid a secondary frequency drop caused by the rotor speed recovery, this paper firstly proposes an FR capability evaluation method for wind farms based on the principle of equal rotational kinetic energy of WTs,...","url":"https:\/\/www.frontiersin.org\/articles\/10.3389\/fenrg.2021.738857","author":"Hongqing Liu","image":"https:\/\/inteng-storage.s3.amazonaws.com\/img\/iea\/4N61QY4K6J\/sizes\/shark-virgin-birth_md.jpg","language":"en",

"category":["academia"],

"published":"2021-08-30 00:00:00 +0000"},

++ in this case we just get the first category so the current news record will be like 
"id":"a81c2a36-4dd5-4f7d-8170-8eebbbb7b60d",
"title":"Cooperative Synthetic Inertia Control for Wind Farms Considering Frequency Regulation Capability",
"description":"To fully utilize the frequency regulation (FR) capability of wind turbines (WTs) and to avoid a secondary frequency drop caused by the rotor speed recovery, this paper firstly proposes an FR capability evaluation method for wind farms based on the principle of equal rotational kinetic energy of WTs,...",
"url":"https:\/\/www.frontiersin.org\/articles\/10.3389\/fenrg.2021.738857",
"author":"Hongqing Liu",
"image":"https:\/\/inteng-storage.s3.amazonaws.com\/img\/iea\/4N61QY4K6J\/sizes\/shark-virgin-birth_md.jpg",
"language":"en",

"category_id": will get the category id from category table where the category name is "academia",

"published":"2021-08-30 00:00:00 +0000"

* *third: it send category like an array and that category name is NOT in Category table:
{"id":"a81c2a36-4dd5-4f7d-8170-8eebbbb7b60d","title":"Cooperative Synthetic Inertia Control for Wind Farms Considering Frequency Regulation Capability","description":"To fully utilize the frequency regulation (FR) capability of wind turbines (WTs) and to avoid a secondary frequency drop caused by the rotor speed recovery, this paper firstly proposes an FR capability evaluation method for wind farms based on the principle of equal rotational kinetic energy of WTs,...","url":"https:\/\/www.frontiersin.org\/articles\/10.3389\/fenrg.2021.738857","author":"Hongqing Liu","image":"https:\/\/inteng-storage.s3.amazonaws.com\/img\/iea\/4N61QY4K6J\/sizes\/shark-virgin-birth_md.jpg","language":"en",

"category":["NEW Category Name"],

"published":"2021-08-30 00:00:00 +0000"},

++ in this case we just get the NEW category and ADD it to Category table so the current news record will be like 
"id":"a81c2a36-4dd5-4f7d-8170-8eebbbb7b60d",
"title":"Cooperative Synthetic Inertia Control for Wind Farms Considering Frequency Regulation Capability",
"description":"To fully utilize the frequency regulation (FR) capability of wind turbines (WTs) and to avoid a secondary frequency drop caused by the rotor speed recovery, this paper firstly proposes an FR capability evaluation method for wind farms based on the principle of equal rotational kinetic energy of WTs,...",
"url":"https:\/\/www.frontiersin.org\/articles\/10.3389\/fenrg.2021.738857",
"author":"Hongqing Liu",
"image":""https:\/\/inteng-storage.s3.amazonaws.com\/img\/iea\/4N61QY4K6J\/sizes\/shark-virgin-birth_md.jpg"",
"language":"en",

"category_id": will get the category id from category table where the category name is "NEW Category Name",

"published":"2021-08-30 00:00:00 +0000"

# Data Base
we have three tables:
* User
* CurrentNews
* Category

ralation between CurrentNews and Category tables is one to many
every current_news belong to one category
and every category has many current_news

* *Category table has the following attributes:
    string "category_name" :: category_name 

        {"categories" :
        ["regional","technology","lifestyle","business","general","programming","science","entertainment","world","sports","finance","academia","politics","health","opinion","food","game","fashion","academic","crap","travel","culture","economy","environment","art","music","notsure","CS","education","redundant","television","commodity","movie","entrepreneur","review","auto","energy","celebrity","medical","gadgets","design","EE","security","mobile","estate","funny"]}

* *CurrentNews table has the following attributes:
    string "title"  :: news title
    string "description" :: news description
    string "url"  :: news link for more details like if the user want to check the whole think for this news
    string "author" :: news author
    string "image"  :: news image to express that news
    string "language" :: news language in which language this news is written
    datetime "published" :: news published date what is the time the news is published
    string "id_news" :: news id ex:"a81c2a36-4dd5-4f7d-8170-8eebbbb7b60d" for every news its unique id
    datetime "created_at"
    datetime "updated_at"
    integer "category_id" :: news category what is this news category ex:"regional" but we insert the category id in current_news table....
        here are the category fetch from api

        {"categories" :
        ["regional","technology","lifestyle","business","general","programming","science","entertainment","world","sports","finance","academia","politics","health","opinion","food","game","fashion","academic","crap","travel","culture","economy","environment","art","music","notsure","CS","education","redundant","television","commodity","movie","entrepreneur","review","auto","energy","celebrity","medical","gadgets","design","EE","security","mobile","estate","funny"]}

*** we will need Category table for chart task that we want to build a TREND system like to see how people talk about specific subject in the last week for example
like how many news talk about "sports" subject in the last WEEK... 


*** In our system we add a job for each save to table operation and a job for every fetch from API, (TYI - Every call to API return 30 objects -), so each time we have 31 jobs are working in background, except the job for every category.
