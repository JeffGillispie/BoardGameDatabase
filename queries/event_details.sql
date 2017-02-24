select
	  e.EventID
	, e.Name
	, e.Date
	, l.Name as Location
	, l.Address
	, l.City
	, l.State
	, l.Zip
	, e.Description
from Events e
left join Locations l on e.LocationID = l.LocationID
where e.EventID = {0}
