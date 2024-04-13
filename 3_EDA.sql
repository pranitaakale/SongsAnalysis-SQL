
select *
from dbo.Popular_Songs_Cleaned_Data

----------===================================PART-1(Top Tracks and Artists)=====================================----------

--What are the top tracks based on the number of streams?
select top 10 track_name
from dbo.Popular_Songs_Cleaned_Data
order by streams desc

--What are the top tracks based on the number of streams(2021-2023)?
select top 10 track_name
from dbo.Popular_Songs_Cleaned_Data
where released_year >= 2021
order by streams desc

--What are the top tracks based on the number of streams(2023)?
select top 10 track_name
from dbo.Popular_Songs_Cleaned_Data
where released_year = 2023
order by streams desc

----What are the top 10 tracks based on the spotify rank (2021-2023)?
--select top 10 track_name, in_spotify_charts as Spotify_Rank
--from dbo.Popular_Songs_Cleaned_Data
--where in_spotify_charts<>0 and released_year >= 2021
--order by in_spotify_charts 

----What are the top 10 tracks based on the spotify rank (2023)?
--select top 10 track_name, in_spotify_charts as Spotify_Rank
--from dbo.Popular_Songs_Cleaned_Data
--where in_spotify_charts<>0 and released_year = 2023
--order by in_spotify_charts 


--What artist has the highest total number of streams across all their tracks?
select top 10 artist_s_name, sum(streams) TotalStreams
from dbo.Popular_Songs_Cleaned_Data
group by artist_s_name
order by TotalStreams desc

--Artist with most tracks released
select top 10 artist_s_name, count(*) No_of_tracks
from dbo.Popular_Songs_Cleaned_Data
group by artist_s_name
order by count(*) desc



----------===================================PART-2(Year-wise Distributions)=====================================----------

--How many songs were released by artists in each of the years 2021, 2022, and 2023?
select released_year, count(track_name) SongsReleased
from dbo.Popular_Songs_Cleaned_Data
where released_year >= 2021
group by released_year


--Which artists released the most songs in each of the years 2021, 2022, and 2023?
;with year_wise_track_release as (
	select released_year, artist_s_name, count(*) as SongsRelased_Year
	from dbo.Popular_Songs_Cleaned_Data
	where released_year >= 2021
	group by released_year, artist_s_name
),
order_tracks as (
	select *, DENSE_RANK() OVER(partition by released_year order by SongsRelased_Year desc) as dr
	from year_wise_track_release
)
select released_year, artist_s_name, SongsRelased_Year
from order_tracks
where dr=1



--Are there any artists who consistently release a high number of songs across multiple years?
;with year_wise_track_release as (
	select released_year, artist_s_name, count(*) as SongsRelased_Year
	from dbo.Popular_Songs_Cleaned_Data
	where released_year >= 2021
	group by released_year, artist_s_name
),
order_tracks as (
	select *, DENSE_RANK() OVER(partition by released_year order by SongsRelased_Year desc) as dr
	from year_wise_track_release
), 
--get top 3 artists who released the most songs in each of the years
--group by artists and get the count
--get artists with count=3, for 3yrs (i.e. from 2021-2023) of time period 
get_top_3_artists as (
	select artist_s_name, count(*) as tot_release_yr
	from order_tracks
	where dr <= 3
	group by artist_s_name
	having count(*)=3
)
select *
from get_top_3_artists




----------===================================PART-3(Top Tracks' performance across Platforms)=====================================----------

--What is the average rank of the top 10 most streamed tracks across all available charts?
select top 10 track_name






select *
from dbo.Popular_Songs_Cleaned_Data


