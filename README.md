This repo contains the relational database structure to support the Vidsi application requirements.

The Vidsi ERD can be seen here:
#### Vidsi ERD
![vidsi_erd](https://user-images.githubusercontent.com/22860105/31319513-2175686e-ac2a-11e7-9d0e-10e592b46978.png)

The Vidsi schema can be seen here:
#### Vidsi Schema
![vidsi_schema](https://user-images.githubusercontent.com/22860105/31319514-23358cf6-ac2a-11e7-955a-608d5accd4c2.png)

The Vidsi schema can be generated with the following: 

#### Generate Vidsi Schema
CREATE TABLE Subscribers
(

    subscriber_id INT NOT NULL,
  
    name VARCHAR(30) NOT NULL,
  
    available_stream_mins INT NOT NULL,
  
    PRIMARY KEY (subscriber_id)
  
);

CREATE TABLE Content_Providers
(
  content_provider_id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  concurrent_stream_limit INT NOT NULL,
  PRIMARY KEY (content_provider_id)
);

CREATE TABLE Subscription_Tiers
(
  subscription_tier_id INT NOT NULL,
  monthly_streaming_mins INT NOT NULL,
  price INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  PRIMARY KEY (subscription_tier_id)
);

CREATE TABLE Invoices
(
  invoice_id INT NOT NULL,
  balance INT NOT NULL,
  due_date DATE NOT NULL,
  subscriber_id INT NOT NULL,
  PRIMARY KEY (invoice_id),
  FOREIGN KEY (subscriber_id) REFERENCES Subscribers(subscriber_id)
);

CREATE TABLE Credit_Cards
(
  credit_card_id INT NOT NULL,
  card_number INT NOT NULL,
  subscriber_id INT NOT NULL,
  PRIMARY KEY (credit_card_id),
  FOREIGN KEY (subscriber_id) REFERENCES Subscribers(subscriber_id)
);

CREATE TABLE Videos
(
  video_id INT NOT NULL,
  title VARCHAR(30) NOT NULL,
  minutes INT NOT NULL,
  content_provider_id INT NOT NULL,
  PRIMARY KEY (video_id),
  FOREIGN KEY (content_provider_id) REFERENCES Content_Providers(content_provider_id)
);

CREATE TABLE Streams
(
  stream_id INT NOT NULL,
  date DATE NOT NULL,
  subscriber_id INT NOT NULL,
  video_id INT NOT NULL,
  PRIMARY KEY (stream_id),
  FOREIGN KEY (subscriber_id) REFERENCES Subscribers(subscriber_id),
  FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Subscriptions
(
  subscription_id INT NOT NULL,
  payment_method VARCHAR(30) NOT NULL,
  start_date DATE NOT NULL,
  subscription_tier_id INT NOT NULL,
  PRIMARY KEY (subscription_id),
  FOREIGN KEY (subscription_tier_id) REFERENCES Subscription_Tiers(subscription_tier_id)
);

CREATE TABLE Subscriber_Subscriptions
(
  subscriber_subscription_id INT NOT NULL,
  subscriber_id INT NOT NULL,
  subscription_id INT NOT NULL,
  PRIMARY KEY (subscriber_subscription_id),
  FOREIGN KEY (subscriber_id) REFERENCES Subscribers(subscriber_id),
  FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

