select
	  u.FirstName || ' ' || u.LastName as User
	, r.Rating
	, ifnull(r.Comments, '') as Comments
from Reviews r
inner join Users u on r.UserID = u.UserID
where r.GameID = {0}
