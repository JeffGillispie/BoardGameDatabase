select
      Games.GameID
    , Games.Name
    , Games.Description
    , Games.MSRP
    , Games.MinimumPlayers
    , Games.MaximumPlayers
    , Games.RecommendedAge
    , Categories.Name as Category
    , Games.AvgGameLengthMin
    , Games.Image
from Games
left join Categories on Games.CategoryID = Categories.CategoryID
where Games.GameID = {0}
