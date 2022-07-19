-- Soru 1: film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

SELECT COUNT(title) FROM film
WHERE length >
(
  SELECT AVG(length)FROM filM
)

-- Soru 2: film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

SELECT COUNT(title) FROM film
WHERE rental_rate = 
(
  SELECT MAX(rental_rate) FROM film
)

-- Soru 3: film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.

SELECT title FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film) AND replacement_cost = (SELECT MIN(replacement_cost) FROM film)

-- Soru 4: payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

SELECT DISTINCT(customer_id), (SELECT SUM(amount) FROM payment) FROM payment
ORDER BY customer_id

SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC
