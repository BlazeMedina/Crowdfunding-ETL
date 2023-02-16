-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, backers_count FROM campaign WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT(cf_id) FROM backers WHERE cf_id = '65';


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT 
  contacts.first_name, 
  contacts.last_name, 
  contacts.email,
  campaign.goal - campaign.pledged AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts, campaign
WHERE campaign.outcome = 'live' AND campaign.contact_id = contacts.contact_id
ORDER BY "Remaining Goal Amount" DESC
;


-- Check the table
select * from email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT 
  b.email,
  b.first_name,
  b.last_name,
  b.cf_id,
  cam.company_name,
  cam.description,
  cam.end_date,
  cam.goal - cam.pledged AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers AS b, campaign AS cam
WHERE cam.cf_id = b.cf_id 
  AND cam.outcome = 'live'
ORDER BY b.last_name ASC, b.first_name ASC
;

  


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;

