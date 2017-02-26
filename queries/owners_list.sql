select
	GroupID as OwnerID
	, 2 as OwnerType
	, Name
from Groups
where CreatedBy = {0}
union
select
	UserID as OwnerID
	, 1 as OwnerTypes
	, FirstName || ' ' || LastName as Name
from Users
where UserID = {0}
order by OwnerType, OwnerID
