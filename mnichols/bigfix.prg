procedure bigfix
begin

for each charts via (sales.num = 037901)
  begin
  insert into charts using (337901 for sales.num)
  delete from charts via key
  end

for each cids where sales.num = 037901
  begin
  alter cids using (337901 for sales.num)
  end

for each isp via (act.code = "A", sales.num = 037901)
  begin
  insert into isp using (337901 for sales.num, 3445 for branch.num)
  delete from isp via key
  end

for each pcts.mthds via (sales.num = 037901)
  begin
  insert into pcts.mthds using (337901 for sales.num)
  delete from pcts.mthds via key
  end

for each performance via (sales.num = 037901)
  begin
  insert into performance using (337901 for sales.num)
  delete from performance via key
  end

for each quotas via (sales.num = 037901)
  begin
  insert into quotas using (337901 for sales.num)
  delete from quotas via key
  end

for each rev.before.additions via (sales.num = 037901)
  begin
  insert into rev.before.additions using (337901 for sales.num)
  delete from rev.before.additions via key
  end

for each revenue.detail where sales.num = 037901
  begin
  insert into revenue.detail using (337901 for sales.num)
  delete from revenue.detail via key
  end

for each routing where sales.num = 037901
  begin
  insert into routing using (337901 for sales.num)
  delete from routing via key
  end

for each srev.by.cust where sales.num = 037901
  begin
  alter srev.by.cust using (337901 for sales.num)
  end

for each srev.by.sales.num via (sales.num = 037901)
  begin
  insert into srev.by.sales.num using (337901 for sales.num)
  delete from srev.by.sales.num via key
  end

end
    