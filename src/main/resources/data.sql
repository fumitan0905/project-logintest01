INSERT INTO roles(id, name) VALUES(1, 'ROLE_PERFORMANCE');
INSERT INTO roles(id, name) VALUES(2, 'ROLE_HEALTH');
INSERT INTO roles(id, name) VALUES(3, 'ROLE_MANAGER');
INSERT INTO roles(id, name) VALUES(4, 'ROLE_MESSAGE');
INSERT INTO roles(id, name) VALUES(5, 'ROLE_GUEST');

-- password = "coach"
INSERT INTO login_user(id, name, email, password) VALUES(1, 'コーチ_上野イチロー', 'coach@example.com', crypt('coach',gen_salt('bf', 10)));
-- password = "health"
INSERT INTO login_user(id, name, email, password) VALUES(2, '栄養士_浅野マナブ', 'health@example.com', crypt('health',gen_salt('bf', 10)));
-- password = "manager"
INSERT INTO login_user(id, name, email, password) VALUES(3, 'マネージャー_杉野イズミ', 'manager@example.com', crypt('manager',gen_salt('bf', 10)));
-- password = "message"
INSERT INTO login_user(id, name, email, password) VALUES(4, '連絡係_前野アサヒ', 'contact@example.com', crypt('contact',gen_salt('bf', 10)));
-- password = "common"
INSERT INTO login_user(id, name, email, password) VALUES(5, '公開閲覧', 'common@example.com', crypt('common',gen_salt('bf', 10)));


INSERT INTO user_role(user_id, role_id) VALUES(1, 1);
INSERT INTO user_role(user_id, role_id) VALUES(1, 2);
INSERT INTO user_role(user_id, role_id) VALUES(1, 3);
INSERT INTO user_role(user_id, role_id) VALUES(1, 4);
INSERT INTO user_role(user_id, role_id) VALUES(1, 5);


INSERT INTO user_role(user_id, role_id) VALUES(2, 2);
INSERT INTO user_role(user_id, role_id) VALUES(2, 3);
INSERT INTO user_role(user_id, role_id) VALUES(2, 4);
INSERT INTO user_role(user_id, role_id) VALUES(2, 5);


INSERT INTO user_role(user_id, role_id) VALUES(3, 3);
INSERT INTO user_role(user_id, role_id) VALUES(3, 4);
INSERT INTO user_role(user_id, role_id) VALUES(3, 5);

INSERT INTO user_role(user_id, role_id) VALUES(4, 4);
INSERT INTO user_role(user_id, role_id) VALUES(4, 5);

INSERT INTO user_role(user_id, role_id) VALUES(5, 5);

--選手データテーブル
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('1','川島英二','185','75','28','GK','大阪','15');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('2','楢崎正剛','190','86','34','GK','愛媛','12');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('3','小笠原満男','176','72','33','DF','神奈川','12');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('4','秋田豊','180','73','25','DF','北海道','11');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('5','石川直宏','173','66','24','DF','京都','14');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('6','長谷部誠','173','65','19','DF','東京','9');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('7','中田浩二','170','62','29','DF','神奈川','17');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('9','内田篤人','179','73','24','MF','大阪','15');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('10','遠藤保仁','173','70','22','MF','新潟','16');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('12','中田英寿','178','72','27','MF','埼玉','14');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('15','小野信二','169','63','31','MF','埼玉','8');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('17','本田啓介','181','80','20','MF','和歌山','10');
INSERT INTO players(player_Id,name,height,weight,age,position,birthplace,body_fat_per) VALUES('18','前田遼一','182','79','19','FW','福岡','12');

--成績データテーブル
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('0','1','2','5','1','1','30','1');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('0','0','3','4','0','0','4','2');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('2','1','5','4','2','0','34','3');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('1','0','0','6','0','1','34','4');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('0','3','6','7','1','0','34','5');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('1','1','4','8','2','0','31','6');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('2','0','4','8','0','0','32','7');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('2','3','8','11','1','2','27','8');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('2','5','1','10','2','0','33','9');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('5','8','4','4','2','0','34','10');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('3','3','0','8','6','0','17','11');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('9','2','2','13','1','0','20','12');
INSERT INTO performance(goals,asists,foul,fouled,yellowcard,redcard,games, player_id) VALUES('15','3','2','7','2','1','34','13');


-- 健康管理テーブル
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('1','06:00','22:00','22','15','30','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('2','07:00','21:00','2','7','25','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('3','04:30','22:00','7','16','29','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('4','08:30','24:00','2','33','21','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('5','09:00','21:00','8','11','26','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('6','10:30','20:00','1','16','9','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('7','11:00','22:00','13','2','11','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('8','05:00','21:00','2','1','7','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('9','07:30','02:00','3','34','22','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('10','08:00','00:00','4','16','30','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('11','09:30','20:00','7','9','10','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('12','02:00','21:00','29','5','17','2023-07-01');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('13','07:30','20:00','15','3','18','2023-07-01');

INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('1','07:00','20:00','22','15','30','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('2','09:00','22:00','2','7','25','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('3','07:00','20:00','7','16','29','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('4','12:00','22:00','2','33','21','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('5','08:50','23:00','8','11','26','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('6','11:30','24:00','1','16','9','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('7','07:20','22:00','13','2','11','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('8','07:00','00:00','2','1','7','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('9','07:30','22:00','3','34','22','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('10','07:30','22:00','4','16','30','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('11','07:30','00:00','7','9','10','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('12','07:30','22:00','29','5','17','2023-06-30');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('13','07:30','00:00','15','3','18','2023-06-30');

INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('1','07:30','00:00','22','15','30','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('2','05:30','23:00','2','7','25','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('3','07:00','22:00','7','16','29','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('4','07:00','00:00','2','33','21','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('5','07:00','22:00','8','11','26','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('6','12:00','22:00','1','16','9','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('7','13:30','00:00','13','2','11','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('8','08:30','21:00','2','1','7','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('9','09:00','22:00','3','34','22','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('10','11:30','03:00','4','16','30','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('11','11:30','02:00','7','9','10','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('12','11:30','21:00','29','5','17','2023-06-29');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('13','07:30','18:00','15','3','18','2023-06-29');

INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('1','07:0','20:00','22','15','30','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('2','07:30','20:00','2','7','25','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('3','10:30','22:00','7','16','29','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('4','07:00','24:00','2','33','21','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('5','12:30','23:00','8','11','26','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('6','07:00','22:00','1','16','9','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('7','12:30','23:00','13','2','11','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('8','07:00','24:00','2','1','7','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('9','12:30','23:00','3','34','22','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('10','07:30','22:00','4','16','30','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('11','07:30','21:00','7','9','10','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('12','07:30','22:00','29','5','17','2023-06-28');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('13','07:30','22:00','15','3','18','2023-06-28');

INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('1','6:30','20:00','22','15','30','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('2','9:30','22:00','2','7','25','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('3','09:00','20:00','7','16','29','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('4','07:00','22:00','2','33','21','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('5','08:00','22:00','8','11','26','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('6','07:30','23:00','1','16','9','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('7','06:00','24:00','13','2','11','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('8','07:30','22:00','2','1','7','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('9','07:0','20:00','3','34','22','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('10','07:30','21:00','4','16','30','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('11','07:30','22:00','7','9','10','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('12','07:30','19:00','29','5','17','2023-06-27');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('13','07:30','22:00','15','3','18','2023-06-27');

INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('1','13:30','20:00','22','15','30','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('2','07:30','22:00','2','7','25','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('3','09:00','20:00','7','16','29','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('4','07:30','22:00','2','33','21','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('5','10:00','23:00','8','11','26','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('6','07:30','23:00','1','16','9','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('7','07:00','24:00','13','2','11','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('8','12:00','24:00','2','1','7','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('9','07:00','22:00','3','34','22','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('10','07:00','22:00','4','16','30','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('11','07:00','24:00','7','9','10','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('12','07:00','24:00','29','5','17','2023-06-26');
INSERT INTO health(player_health_id,wakeup_time,bedtime_time,breakfast_id,lunch_id,dinner_id,eat_date) VALUES('13','06:30','22:00','15','3','18','2023-06-26');

-- 料理テーブル
INSERT INTO cook(dish_name,dish_calories) VALUES('刺身定食','517');
INSERT INTO cook(dish_name,dish_calories) VALUES('刺身定食,カツ丼','1407');
INSERT INTO cook(dish_name,dish_calories) VALUES('刺身定食,牛丼','1337');
INSERT INTO cook(dish_name,dish_calories) VALUES('刺身定食,ミートソーススパゲティ','1167');
INSERT INTO cook(dish_name,dish_calories) VALUES('刺身定食,ハンバーガー','787');
INSERT INTO cook(dish_name,dish_calories) VALUES('刺身定食,醤油ラーメン','1007');
INSERT INTO cook(dish_name,dish_calories) VALUES('刺身定食,ざるそば','797');
INSERT INTO cook(dish_name,dish_calories) VALUES('刺身定食,オムライス','1357');
INSERT INTO cook(dish_name,dish_calories) VALUES('麻婆豆腐定食','690');
INSERT INTO cook(dish_name,dish_calories) VALUES('麻婆豆腐定食,カツ丼','1580');
INSERT INTO cook(dish_name,dish_calories) VALUES('麻婆豆腐定食,牛丼','1510');
INSERT INTO cook(dish_name,dish_calories) VALUES('麻婆豆腐定食,ミートソーススパゲティ','1340');
INSERT INTO cook(dish_name,dish_calories) VALUES('麻婆豆腐定食,ハンバーガー','960');
INSERT INTO cook(dish_name,dish_calories) VALUES('麻婆豆腐定食,醤油ラーメン','1180');
INSERT INTO cook(dish_name,dish_calories) VALUES('麻婆豆腐定食,ざるそば','970');
INSERT INTO cook(dish_name,dish_calories) VALUES('麻婆豆腐定食,オムライス','1530');
INSERT INTO cook(dish_name,dish_calories) VALUES('サバの味噌煮定食','780');
INSERT INTO cook(dish_name,dish_calories) VALUES('サバの味噌煮定食,カツ丼','1670');
INSERT INTO cook(dish_name,dish_calories) VALUES('サバの味噌煮定食,牛丼','1600');
INSERT INTO cook(dish_name,dish_calories) VALUES('サバの味噌煮定食,ミートソーススパゲティ','1430');
INSERT INTO cook(dish_name,dish_calories) VALUES('サバの味噌煮定食,ハンバーガー','1050');
INSERT INTO cook(dish_name,dish_calories) VALUES('サバの味噌煮定食,醤油ラーメン','1270');
INSERT INTO cook(dish_name,dish_calories) VALUES('サバの味噌煮定食,ざるそば','1060');
INSERT INTO cook(dish_name,dish_calories) VALUES('サバの味噌煮定食,オムライス','1620');
INSERT INTO cook(dish_name,dish_calories) VALUES('生姜焼き定食','820');
INSERT INTO cook(dish_name,dish_calories) VALUES('生姜焼き定食,カツ丼','1710');
INSERT INTO cook(dish_name,dish_calories) VALUES('生姜焼き定食,牛丼','1640');
INSERT INTO cook(dish_name,dish_calories) VALUES('生姜焼き定食,ミートソーススパゲティ','1470');
INSERT INTO cook(dish_name,dish_calories) VALUES('生姜焼き定食,ハンバーガー','1090');
INSERT INTO cook(dish_name,dish_calories) VALUES('生姜焼き定食,醤油ラーメン','1310');
INSERT INTO cook(dish_name,dish_calories) VALUES('生姜焼き定食,ざるそば','1110');
INSERT INTO cook(dish_name,dish_calories) VALUES('生姜焼き定食,オムライス','1660');
INSERT INTO cook(dish_name,dish_calories) VALUES('カツ丼','890');
INSERT INTO cook(dish_name,dish_calories) VALUES('牛丼','820');
INSERT INTO cook(dish_name,dish_calories) VALUES('ミートソーススパゲティ','650');
INSERT INTO cook(dish_name,dish_calories) VALUES('ハンバーガー','270');
INSERT INTO cook(dish_name,dish_calories) VALUES('醤油ラーメン','490');
INSERT INTO cook(dish_name,dish_calories) VALUES('ざるそば','280');
INSERT INTO cook(dish_name,dish_calories) VALUES('オムライス','840');