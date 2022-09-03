# 324. Preventing Instagram Self-follows with triggers 
SOURCE ig_clone_data.sql;

DELIMITER $$

# Preventing self floow before following themself
CREATE TRIGGER example_cannot_follow_self
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
          IF NEW.follower_id = NEW.followee_id
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot follow yourself, silly';
          END IF;
     END;
$$

DELIMITER ;

# 325 Unfollow triggers. triggers after user unfollows
DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW # trigger after user unfollows
BEGIN
    # INSERT INTO unfollows(follower_id, followee_id)
    # VALUES(OLD.follower_id, old.followee_id);
    
    # Or

    INSERT INTO unfollows
    SET follower_id = OLD.follower_id, # refer to the old 
        followee_id = OLD.followee_id;
	END;
$$

DELIMITER ;

# 326. Managing triggers 
# SHOW TRIGGERS;    # Show list of triggers 
# DROP TRIGGER <trigger_name>; # to delete trigger
# trigger can be stealth bug (hard to identify and debug)
# be conscieentious when using triggers

