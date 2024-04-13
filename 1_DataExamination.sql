--Overview 
select top 1000 *
from dbo.Popular_Spotify_Songs

-- Total Rows: 953
select count(*)
from dbo.Popular_Spotify_Songs

-- Total Columns: 24
select count(Column_NAME)
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Popular_Spotify_Songs'

-- Get Column Names
select COLUMN_NAME, DATA_TYPE
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Popular_Spotify_Songs'

-- Review Track Names
select track_name, count(*) as count_track
from dbo.Popular_Spotify_Songs
group by track_name
order by count_track desc

select distinct track_name
from dbo.Popular_Spotify_Songs
order by 1

--select distinct track_name
--from dbo.Popular_Spotify_Songs
--where track_name like '%%'

-- Check Artist
select artist_s_name, count(*)
from dbo.Popular_Spotify_Songs
where artist_count=1
group by artist_s_name
order by count(*) desc

select artist_s_name, count(*)
from dbo.Popular_Spotify_Songs
where artist_count=2
group by artist_s_name
order by count(*) desc

--Track + Artist
select distinct track_name, artist_s_name
from dbo.Popular_Spotify_Songs


select track_name, artist_s_name, count(*)
from dbo.Popular_Spotify_Songs
group by track_name, artist_s_name
having count(*) >1


-- Released Date
select released_year, count(*)
from dbo.Popular_Spotify_Songs
group by released_year
order by count(*) desc


select count(*)
from dbo.Popular_Spotify_Songs
where released_year between 2001 and 2020

select count(*)
from dbo.Popular_Spotify_Songs
where released_year < 2001


select released_month, count(*)
from dbo.Popular_Spotify_Songs
group by released_month
order by count(*) desc


--NULL Values
select *
	from dbo.Popular_Spotify_Songs
	where in_spotify_playlists is null or 
		in_spotify_charts is null or
		streams is null or 
		in_apple_playlists is null or   
		in_apple_charts is null or 
		in_deezer_playlists is null or  
		in_deezer_charts is null or 
		in_shazam_charts is null or
		released_year is null or
		released_month is null or
		released_day is null