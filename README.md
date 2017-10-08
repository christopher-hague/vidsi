Case Overview & Requirements
“Vidsi” is a new video streaming service you are building for a startup company.
	•	Subscribers sign up for free and receive 2 hours of free streaming
	•	For paid subscribers, streaming limits are based on plan tier
	•	There are currently 3 tiered subscription plans - but they may change in the future
	•	There’s a catalog of videos to stream that are licensed from different content providers
	•	Subscribers stream videos and we need to store information about what’s being streamed
	•	We need to generate monthly invoices for subscribers that can be paid by credit card on file or by check
	•	For subscribers charged by credit card we need to store payment information (you can assume security and PCI compliance don’t exist - you can store credit card numbers to charge)
	•	Licenses with content providers only allow for a certain number of concurrent subscribers to watch a given video
Data Modeling
Given the above requirements please create a data model in the form of a complete physical entity relationship diagram (ERD). Your diagram should be comprehensive and sufficient for creating a relational database schema that will support the applications’ requirements.

SQL Query
Based on your datamodel please compose a SQL query that would return the 20 most watched videos by user on the platform for January 2017.

Algorithm
Write a function that, given a list of invoices and subscribers, would find subscribers who haven’t paid their invoices and need to be sent a cancellation notice.
You can use pseudo code or any programming language of your choice to write this!
