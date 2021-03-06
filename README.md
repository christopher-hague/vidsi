This repo contains the relational database structure to support the Vidsi application requirements as well as a mini Rails application that can create, update, delete and select data from each of the tables. Table relations have been established through the models in the Rails API. Feel free to create subcribers, subscriptions, invoices, etc. via the rails console to make your own queries.
* Migrate pending migration files with `rake db:migrate`
* Start rails server with `rails s`
* Enter rails console with `rails c`

#### Data Modeling

###### Vidsi ERD
![vidsi_erd](https://user-images.githubusercontent.com/22860105/31319513-2175686e-ac2a-11e7-9d0e-10e592b46978.png)

###### Vidsi Schema
![vidsi_schema](https://user-images.githubusercontent.com/22860105/31321328-1480bf8a-ac4a-11e7-96b2-086b744da12f.png)


###### Generate Vidsi Schema
The Vidsi schema can be generated with the following:

```
CREATE TABLE subscribers(
  id INTEGER PRIMARY KEY,
  name TEXT,
  available_stream_time INTEGER
);

CREATE TABLE content_providers(
  id INTEGER PRIMARY KEY,
  name TEXT,
  concurrent_stream_limit INTEGER
);

CREATE TABLE subscription_tiers(
  id INTEGER PRIMARY KEY,
  monthly_streaming_limit INTEGER,
  price INTEGER,
  name TEXT
);

CREATE TABLE invoices(
  id INTEGER PRIMARY KEY,
  balance INTEGER,
  due_date DATE,
  subscriber_id INTEGER
);

CREATE TABLE credit_cards(
  id INTEGER PRIMARY KEY,
  card_number TEXT,
  subscriber_id INTEGER
);

CREATE TABLE videos(
  id INTEGER PRIMARY KEY,
  title TEXT,
  length INTEGER,
  content_provider_id INTEGER
);

CREATE TABLE streams(
  id INTEGER PRIMARY KEY,
  date DATE,
  subscriber_id INTEGER,
  video_id INTEGER
);

CREATE TABLE subscriptions(
  id INTEGER PRIMARY KEY,
  payment_method TEXT,
  start_date DATE,
  subscription_tier_id INTEGER
);

CREATE TABLE subscribers_subscriptions(
  id INTEGER PRIMARY KEY,
  subscriber_id INTEGER,
  subscription_id INTEGER
);
```

#### SQL Query
When passing a subscriber.id to the `AND` statement, the following SQL query will return the names of the 20 most watched videos from January 2017 for that subscriber, as well as the number of times each Video was streamed:

```
SELECT videos.title AS video_title, COUNT(*) AS streams
FROM subscribers
INNER JOIN streams ON streams.subscriber_id = subscribers.id
INNER JOIN videos ON videos.id = streams.video_id
WHERE streams.date = "January 2017"
AND subscribers.id = -- insert subscriber.id
GROUP BY videos.title
ORDER BY streams DESC LIMIT 20;
```

* Altering the `WHERE streams.date = ` statement enables the query to search for videos from any date

#### Algorithm(Ruby)
The relationship between each table has been established via the models. Given that an Invoice belongs to a Subscriber and a Subscriber can have many Invoices, we can find each Subscriber with an overdue balance by filtering each Invoice that has a `balance` greater than 0 AND has a `due_date` that falls before today's date.

Find all overdue Invoices:
* Invoices are initialized with a `due_date`, which will be determined by the `start_date` of the Subscription. For example, a Subscriber with a Subscription whose `start_date` is March 1st could expect to have an Invoice with a `due_date` of April 1st. Filtering the Invoices whose `balance` is greater than 0 and have a `due_date` that falls prior to today's date will return a list of Invoices that are overdue:

`overdue_invoices = Invoice.all.select { |invoice| invoice.balance > 0 && invoice.due_date < Time.zone.now }`

Find all Subscribers with an overdue balance:
* Once we have the list of overdue Invoices, we can associate a Subscriber to the overdue Invoice using the `subscriber_id` foreign key on each Invoice:

`overdue_subscribers = overdue_invoices.map { |invoice| Subscriber.find(invoice.subscriber_id) }.uniq`

