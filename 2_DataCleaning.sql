
with getSongsData_2001to2023 as(
	select track_name, artist_s_name, artist_count, released_year, released_month, released_day,
	in_spotify_playlists, in_spotify_charts, streams,
	in_apple_playlists, in_apple_charts,
	in_deezer_playlists, in_deezer_charts,
	in_shazam_charts,
	ROW_NUMBER() OVER(partition by track_name, artist_s_name order by released_year) as RNO
	from dbo.Popular_Spotify_Songs
	where released_year >= 2001
),
removeDuplicates__replaceNullValues_0 as (
	select track_name, artist_s_name, artist_count, released_year, released_month, released_day,
		in_spotify_playlists, in_spotify_charts, streams,
		in_apple_playlists, in_apple_charts,
		in_deezer_playlists, in_deezer_charts,
		isnull(in_shazam_charts,0) in_shazam_charts
	from getSongsData_2001to2023
	where RNO=1
)
select *
into dbo.Popular_Songs_Cleaned_Data
from removeDuplicates__replaceNullValues_0

--drop table Popular_Songs_Cleaned_Data

