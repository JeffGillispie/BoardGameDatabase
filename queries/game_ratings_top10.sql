select
	r.GameID
	, g.Name as Game
	, ((sum(r.Rating) * 1.0) / (count(r.Rating) * 1.0)) as AverageRating
	, count(r.rating) as Reviews
from Reviews r
inner join Games g on r.GameID = g.GameID
group by r.GameID
order by AverageRating desc, Reviews desc
limit 10
