### This repo contains the relational database structure to support the Vidsi application requirements.

#### Vidsi ERD
![vidsi_erd](https://user-images.githubusercontent.com/22860105/31319513-2175686e-ac2a-11e7-9d0e-10e592b46978.png)

#### Vidsi Schema
![vidsi_schema](https://user-images.githubusercontent.com/22860105/31319514-23358cf6-ac2a-11e7-955a-608d5accd4c2.png)


#### Generate Vidsi Schema
The Vidsi schema can be generated with the following:

```CREATE TABLE Subscribers(

  &nbsp;&nbsp; subscriber_id INT NOT NULL,
  
  &nbsp;&nbsp; name VARCHAR(30) NOT NULL,
  
  &nbsp;&nbsp; available_stream_mins INT NOT NULL,
  
  &nbsp;&nbsp; PRIMARY KEY (subscriber_id)
  
);

CREATE TABLE Content_Providers(

  &nbsp;&nbsp; content_provider_id INT NOT NULL,
  
  &nbsp;&nbsp; name VARCHAR(30) NOT NULL,
  
  &nbsp;&nbsp; concurrent_stream_limit INT NOT NULL,
  
  &nbsp;&nbsp; PRIMARY KEY (content_provider_id)
  
);

CREATE TABLE Subscription_Tiers(

  &nbsp;&nbsp; subscription_tier_id INT NOT NULL,
  
  &nbsp;&nbsp; monthly_streaming_mins INT NOT NULL,
  
  &nbsp;&nbsp; price INT NOT NULL,
  
  &nbsp;&nbsp; name VARCHAR(30) NOT NULL,
  
  &nbsp;&nbsp; PRIMARY KEY (subscription_tier_id)
  
);

CREATE TABLE Invoices(

  &nbsp;&nbsp; invoice_id INT NOT NULL,
  
  &nbsp;&nbsp; balance INT NOT NULL,
  
  &nbsp;&nbsp; due_date DATE NOT NULL,
  
  &nbsp;&nbsp; subscriber_id INT NOT NULL,
  
  &nbsp;&nbsp; PRIMARY KEY (invoice_id),
  
  &nbsp;&nbsp; FOREIGN KEY (subscriber_id) REFERENCES Subscribers(subscriber_id)
  
);

CREATE TABLE Credit_Cards(

  &nbsp;&nbsp; credit_card_id INT NOT NULL,
  
  &nbsp;&nbsp; card_number INT NOT NULL,
  
  &nbsp;&nbsp; subscriber_id INT NOT NULL,
  
  &nbsp;&nbsp; PRIMARY KEY (credit_card_id),
  
  &nbsp;&nbsp; FOREIGN KEY (subscriber_id) REFERENCES Subscribers(subscriber_id)
  
);

CREATE TABLE Videos(

  &nbsp;&nbsp; video_id INT NOT NULL,
  
  &nbsp;&nbsp; title VARCHAR(30) NOT NULL,
  
  &nbsp;&nbsp; minutes INT NOT NULL,
  
  &nbsp;&nbsp; content_provider_id INT NOT NULL,
  
  &nbsp;&nbsp; PRIMARY KEY (video_id),
  
  &nbsp;&nbsp; FOREIGN KEY (content_provider_id) REFERENCES Content_Providers(content_provider_id)
  
);

CREATE TABLE Streams(

  &nbsp;&nbsp; stream_id INT NOT NULL,
  
  &nbsp;&nbsp; date DATE NOT NULL,
  
  &nbsp;&nbsp; subscriber_id INT NOT NULL,
  
  &nbsp;&nbsp; video_id INT NOT NULL,
  
  &nbsp;&nbsp; PRIMARY KEY (stream_id),
  
  &nbsp;&nbsp; FOREIGN KEY (subscriber_id) REFERENCES Subscribers(subscriber_id),
  
  &nbsp;&nbsp; FOREIGN KEY (video_id) REFERENCES Videos(video_id)
  
);

CREATE TABLE Subscriptions(

  &nbsp;&nbsp; subscription_id INT NOT NULL,
  
  &nbsp;&nbsp; payment_method VARCHAR(30) NOT NULL,
  
  &nbsp;&nbsp; start_date DATE NOT NULL,
  
  &nbsp;&nbsp; subscription_tier_id INT NOT NULL,
  
  &nbsp;&nbsp; PRIMARY KEY (subscription_id),
  
  &nbsp;&nbsp; FOREIGN KEY (subscription_tier_id) REFERENCES Subscription_Tiers(subscription_tier_id)
  
);

CREATE TABLE Subscriber_Subscriptions(

  &nbsp;&nbsp; subscriber_subscription_id INT NOT NULL,
  
  &nbsp;&nbsp; subscriber_id INT NOT NULL,
  
  &nbsp;&nbsp; subscription_id INT NOT NULL,
  
  &nbsp;&nbsp; PRIMARY KEY (subscriber_subscription_id),
  
  &nbsp;&nbsp; FOREIGN KEY (subscriber_id) REFERENCES Subscribers(subscriber_id),
  
  &nbsp;&nbsp; FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
  
);```

