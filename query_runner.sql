CREATE DEFINER=`root`@`localhost` FUNCTION `query_runner`() RETURNS varchar(64) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
RETURN concat("Queried by Keith Skinner on ", now());
END