select
      ga.GameID
    , ga.Name
    , ga.Description
    , ca.Name as Category
    , ga.MinimumPlayers
    , ga.MaximumPlayers
    , ga.RecommendedAge as Ages
    , ga.MSRP
	, count(re.ReviewID) as Reviews
	, ifnull(round(sum(re.Rating) * 1.0 / count(re.Rating) * 1.0, 1), 'Not Rated') as AvgRating
	, count(gg.GroupID) as Groups
from Games ga
left join Categories ca on ca.CategoryID = ga.CategoryID
left join Reviews re on ga.GameID = re.GameID
left join GroupGames gg on ga.GameID = gg.GameID
group by ga.GameID, ga.Name, ga.Description, Category, ga.MinimumPlayers, ga.MaximumPlayers, Ages, ga.MSRP
order by ga.Name
