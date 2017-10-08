### This repo contains the relational database structure to support the Vidsi application requirements.

#### Vidsi ERD
![vidsi_erd](https://user-images.githubusercontent.com/22860105/31319513-2175686e-ac2a-11e7-9d0e-10e592b46978.png)

#### Vidsi Schema
![vidsi_schema](https://user-images.githubusercontent.com/22860105/31319514-23358cf6-ac2a-11e7-955a-608d5accd4c2.png)


#### Generate Vidsi Schema
The Vidsi schema can be generated with the following:

```
CREATE TABLE subscribers
(
  id INTEGER PRIMARY KEY,
  name TEXT,
  available_stream_mins INTEGER
);

CREATE TABLE content_providers
(
  id INTEGER PRIMARY KEY,
  name TEXT,
  concurrent_stream_limit INTEGER
);

CREATE TABLE subscription_tiers
(
  id INTEGER PRIMARY KEY,
  monthly_streaming_mins INTEGER,
  price INTEGER,
  name TEXT
);

CREATE TABLE invoices
(
  id INTEGER PRIMARY KEY,
  balance INTEGER,
  due_date DATE,
  subscriber_id INTEGER
);

CREATE TABLE credit_cards
(
  id INTEGER PRIMARY KEY,
  card_number TEXT,
  subscriber_id INTEGER
);

CREATE TABLE videos
(
  id INTEGER PRIMARY KEY,
  title TEXT,
  minutes INTEGER,
  content_provider_id INTEGER
);

CREATE TABLE streams
(
  id INTEGER PRIMARY KEY,
  date DATE,
  subscriber_id INTEGER,
  video_id INTEGER
);

CREATE TABLE subscriptions
(
  id INTEGER PRIMARY KEY,
  payment_method TEXT,
  start_date DATE,
  subscription_tier_id INTEGER
);

CREATE TABLE Subscriber_Subscriptions
(
  id INTEGER PRIMARY KEY,
  subscriber_id INTEGER,
  subscription_id INTEGER
);
```

#### SQL Query
When passing a subscriber.id to the AND statement, the following SQL query will return the 20 most watched videos by subscriber from January 2017 for that subscriber:

```
SELECT DISTINCT subscribers.name AS subscriber, videos.title AS video_title, streams.date, COUNT(*) AS streams
FROM subscribers
INNER JOIN streams ON streams.subscriber_id = subscribers.id
INNER JOIN videos ON videos.id = streams.video_id
WHERE streams.date = "January 2017"
AND subscribers.id = -- insert subscriber.id
GROUP BY videos.title
ORDER BY streams DESC LIMIT 20;
```
