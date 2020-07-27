#standardSQL
# 21_11b: Distribution of Lighthouse scores for the 'Preload key requests' audit
SELECT
    JSON_EXTRACT_SCALAR(report, "$.audits.uses-rel-preload.score") AS score,
    COUNT(0) AS freq,
    SUM(COUNT(0)) OVER () AS total,
    ROUND(COUNT(0) * 100 / SUM(COUNT(0)) OVER (), 2) AS pct
FROM
    `httparchive.almanac.summary_pages`
WHERE
  edition = "2020"
JOIN
  `httparchive.almanac.lighthouse`
USING
(url)
GROUP BY
  score
ORDER BY
  freq / total DESC