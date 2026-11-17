-- Barber Reda DZ — données de départ (une seule fois). Horaires = fiche Google Maps (nov. 2026) : 11:00–21:00, fermé le vendredi.
-- Barbiers, prestations et prix : EXEMPLES à confirmer avec le salon (to_confirm = true).
insert into barberreda.hours (dow, closed, open_min, close_min) values
 (0,false,660,1260),(1,false,660,1260),(2,false,660,1260),(3,false,660,1260),
 (4,false,660,1260),(5,true,660,1260),(6,false,660,1260)
on conflict (dow) do nothing;
insert into barberreda.barbers (name, bio, sort)
select * from (values ('Reda','Prénom affiché à confirmer',1),('Barbier 2','Prénom à confirmer',2)) v where not exists (select 1 from barberreda.barbers);
insert into barberreda.services (name, description, price_da, duration_min, to_confirm, sort)
select * from (values
 ('Coupe homme','Coupe tondeuse ou ciseaux, finitions et coiffage.',500,30,true,1),
 ('Barbe','Taille, contours et finitions.',300,20,true,2),
 ('Coupe + barbe','Coupe complète avec taille de barbe.',700,45,true,3),
 ('Coupe enfant','Pour les moins de 12 ans.',400,25,true,4),
 ('Soin / brushing','Shampoing, soin et mise en forme.',600,30,true,5)
) v where not exists (select 1 from barberreda.services);
