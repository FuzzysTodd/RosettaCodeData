CREATE TABLE TEST (
  VAL1 INT,
  VAL2 INT
);
INSERT INTO TEST (VAL1, VAL2) VALUES
  (1, 2),
  (2, 2),
  (2, 1);
SELECT
  CASE
     WHEN VAL1 < VAL2 THEN VAL1 || ' less than ' || VAL2
     WHEN VAL1 = VAL2 THEN VAL1 || ' equal to ' || VAL2
     WHEN VAL1 > VAL2 THEN VAL1 || ' greater than ' || VAL2
  END COMPARISON
FROM TEST;