insert into users (id, username, created_at, updated_at, email, encrypted_password, analyst_number, first_name, last_name, last_name2, area_id)
select dieidprod.analysts.id, dieidprod.users.username,sysdate, sysdate,dieidprod.users.email,(select encrypted_password from users where username like 'administrator'),
dieidprod.analysts.analyst, dieidprod.analysts.first_name,dieidprod.analysts.last_name1,dieidprod.analysts.last_name2,dieidprod.analysts.area_id
from dieidprod.users, dieidprod.analysts
where users.analyst_id = analysts.id
and username not like 'mmendozam'
and analysts.department like 'DIEID';

insert into users (id, username, created_at, updated_at, email, encrypted_password, analyst_number, first_name, last_name, last_name2, area_id)
select dieidprod.analysts.id, dieidprod.users.username,sysdate, sysdate,dieidprod.users.email,(select encrypted_password from users where username like 'administrator'),
dieidprod.analysts.analyst, dieidprod.analysts.first_name,dieidprod.analysts.last_name1,dieidprod.analysts.last_name2,dieidprod.analysts.area_id
from dieidprod.users, dieidprod.analysts
where users.analyst_id = analysts.id
and email like 'mendozamm24@yahoo.com.mx';

insert into events (id, priority, event_date, description, address,suburb,
observations,source, area,crime_id,township_id,locality_id, place_id, user_id,
status_id, latitude,longitude, created_at, updated_at, tramo_carretero)
select id,priority_id,event_date,description,address,suburb,
observations,source,
(select description from dieidprod.areas where dieidprod.areas.id = dieidprod.events.area_id)
,crime_id,township_id,locality_id, place_id, analyst_id,
status_id,latitude,longitude,created_at,updated_at,tramo_carretero
from dieidprod.events;

update events set user_id = 13 where user_id = 10020;

insert into people (id, ci, first_name, last_name, last_name2, alias,birth_date,
originative, genre, record, profession, observations, status_id, registered_from,
created_at, updated_at, event_id)
select people.id, ci, first_name,  last_name1, last_name2, alias, birth_date,
originative, genre, record, profession, observations, status_id, registered_from,
people.created_at, people.updated_at, event_id
from dieidprod.people, dieidprod.event_people where people.id = event_people.person_id ;

commit;