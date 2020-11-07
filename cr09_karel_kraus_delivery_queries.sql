-- How many items were sent between 2020-08-01 and 2020-09-30
SELECT COUNT (item_id) FROM item INNER JOIN location on item_id=fk_item WHERE deposite_date BETWEEN '2020-08-01' AND '2020-09-30'

-- How many items were sent from Wien
SELECT COUNT(item_id) FROM item INNER JOIN location on item_id=fk_item INNER JOIN address ON address_id=fk_address WHERE city='Wien'

-- How many items were sent by person with called Balbin
SELECT COUNT(item_id) FROM item INNER JOIN person ON fk_sender=person_id WHERE last_name='Balbin'

-- What type of items were received by person called Stewart
SELECT type_id FROM type INNER JOIN item ON type_id=fk_type INNER JOIN person ON fk_receiver=person_id WHERE last_name='Stewart'

-- Show person who did not receive anything
SELECT first_name, last_name FROM person WHERE person_id NOT IN(SELECT DISTINCT fk_receiver FROM item)

-- When were items delivered to person called Göthe
SELECT delivery_date FROM status INNER JOIN location ON fk_deposite_date=deposite_date INNER JOIN item ON fk_item=item_id INNER JOIN person ON fk_receiver=person_id WHERE last_name='Göthe'