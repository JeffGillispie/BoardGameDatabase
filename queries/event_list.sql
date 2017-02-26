select
	  e.EventID
	, e.Name
	, e.Date
	, l.Name as Location
from Events e
left join Locations l on e.LocationID = l.LocationID
order by e.Name
