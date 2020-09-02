#standardSQL
#color_fonts
SELECT
 client,
 format,
 COUNT(DISTINCT page) AS pages_color,
 total_page,
 ROUND(COUNT(DISTINCT page) * 100 / total_page, 2) AS pct_color
FROM
 `httparchive.almanac.requests`
JOIN
 (SELECT _TABLE_SUFFIX AS client, COUNT(0) AS total_page FROM `httparchive.summary_pages.2020_08_01_*` GROUP BY _TABLE_SUFFIX)
USING
 (client),
# Color fonts have any of sbix, cbdt, svg or colr tables.
 UNNEST(REGEXP_EXTRACT_ALL(JSON_EXTRACT(payload, '$._font_details.table_sizes'), '(?i)(sbix|cbdt|svg|colr)')) AS format
WHERE
 type = 'font'
GROUP BY
client,
 total_page,
 format
ORDER BY
 total_page DESC