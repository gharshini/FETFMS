grp=[bs(1).GA,bs(2).GA(1:size(bs(2).cor,2)),bs(3).GA(1:size(bs(3).cor,2)),bs(4).GA(1:size(bs(4).cor,2)),bs(5).GA(1:size(bs(5).cor,2)),bs(6).GA(1:size(bs(6).cor,2)),bs(7).GA(1:size(bs(7).cor,2)),bs(8).GA(1:size(bs(8).cor,2)),bs(9).GA(1:size(bs(9).cor,2)),bs(10).GA(1:size(bs(10).cor,2)),bs(11).GA(1:size(bs(11).cor,2)),bs(12).GA(1:size(bs(12).cor,2)),bs(13).GA(1:size(bs(13).cor,2)),bs(14).GA(1:size(bs(14).cor,2)),bs(15).GA(1:size(bs(15).cor,2)),bs(16).GA(1:size(bs(16).cor,2)),bs(17).GA(1:size(bs(17).cor,2)),bs(18).GA(1:size(bs(18).cor,2)),bs(19).GA(1:size(bs(19).cor,2))];
x=[bs(1).cor, bs(2).cor,bs(3).cor, bs(4).cor, bs(5).cor, bs(6).cor, bs(7).cor, bs(8).cor, bs(9).cor, bs(10).cor, bs(11).cor, bs(12).cor, bs(13).cor, bs(14).cor, bs(15).cor, bs(16).cor, bs(17).cor, bs(18).cor, bs(19).cor];
x1=[bs(1).cor_curved, bs(2).cor_curved,bs(3).cor_curved, bs(4).cor_curved, bs(5).cor_curved, bs(6).cor_curved, bs(7).cor_curved, bs(8).cor_curved, bs(9).cor_curved, bs(10).cor_curved, bs(11).cor_curved, bs(12).cor_curved, bs(13).cor_curved, bs(14).cor_curved, bs(15).cor_curved, bs(16).cor_curved, bs(17).cor_curved, bs(18).cor_curved, bs(19).cor_curved];
x2=[bs(1).left_P2P, bs(2).left_P2P,bs(3).left_P2P, bs(4).left_P2P, bs(5).left_P2P, bs(6).left_P2P, bs(7).left_P2P, bs(8).left_P2P, bs(9).left_P2P, bs(10).left_P2P, bs(11).left_P2P, bs(12).left_P2P, bs(13).left_P2P, bs(14).left_P2P, bs(15).left_P2P, bs(16).left_P2P, bs(17).left_P2P, bs(18).left_P2P, bs(19).left_P2P];
x3=[bs(1).left_avg_speed, bs(2).left_avg_speed,bs(3).left_avg_speed, bs(4).left_avg_speed, bs(5).left_avg_speed, bs(6).left_avg_speed, bs(7).left_avg_speed, bs(8).left_avg_speed, bs(9).left_avg_speed, bs(10).left_avg_speed, bs(11).left_avg_speed, bs(12).left_avg_speed, bs(13).left_avg_speed, bs(14).left_avg_speed, bs(15).left_avg_speed, bs(16).left_avg_speed, bs(17).left_avg_speed, bs(18).left_avg_speed, bs(19).left_avg_speed];
x4=[bs(1).left_avg_accel, bs(2).left_avg_accel,bs(3).left_avg_accel, bs(4).left_avg_accel, bs(5).left_avg_accel, bs(6).left_avg_accel, bs(7).left_avg_accel, bs(8).left_avg_accel, bs(9).left_avg_accel, bs(10).left_avg_accel, bs(11).left_avg_accel, bs(12).left_avg_accel, bs(13).left_avg_accel, bs(14).left_avg_accel, bs(15).left_avg_accel, bs(16).left_avg_accel, bs(17).left_avg_accel, bs(18).left_avg_accel, bs(19).left_avg_accel];
x5=[bs(1).left_avg_jerk, bs(2).left_avg_jerk, bs(3).left_avg_jerk,bs(4).left_avg_jerk, bs(5).left_avg_jerk, bs(6).left_avg_jerk, bs(7).left_avg_jerk, bs(8).left_avg_jerk, bs(9).left_avg_jerk, bs(10).left_avg_jerk, bs(11).left_avg_jerk, bs(12).left_avg_jerk, bs(13).left_avg_jerk, bs(14).left_avg_jerk, bs(15).left_avg_jerk, bs(16).left_avg_jerk, bs(17).left_avg_jerk, bs(18).left_avg_jerk, bs(19).left_avg_jerk];
x6=[bs(1).right_P2P, bs(2).right_P2P, bs(3).right_P2P,bs(4).right_P2P, bs(5).right_P2P, bs(6).right_P2P, bs(7).right_P2P, bs(8).right_P2P, bs(9).right_P2P, bs(10).right_P2P, bs(11).right_P2P, bs(12).right_P2P, bs(13).right_P2P, bs(14).right_P2P, bs(15).right_P2P, bs(16).right_P2P, bs(17).right_P2P, bs(18).right_P2P, bs(19).right_P2P];
x7=[bs(1).right_avg_speed, bs(2).right_avg_speed, bs(3).right_avg_speed,bs(4).right_avg_speed, bs(5).right_avg_speed, bs(6).right_avg_speed, bs(7).right_avg_speed, bs(8).right_avg_speed, bs(9).right_avg_speed, bs(10).right_avg_speed, bs(11).right_avg_speed, bs(12).right_avg_speed, bs(13).right_avg_speed, bs(14).right_avg_speed, bs(15).right_avg_speed, bs(16).right_avg_speed, bs(17).right_avg_speed, bs(18).right_avg_speed, bs(19).right_avg_speed];
x8=[bs(1).right_avg_accel, bs(2).right_avg_accel, bs(3).right_avg_accel,bs(4).right_avg_accel, bs(5).right_avg_accel, bs(6).right_avg_accel, bs(7).right_avg_accel, bs(8).right_avg_accel, bs(9).right_avg_accel, bs(10).right_avg_accel, bs(11).right_avg_accel, bs(12).right_avg_accel, bs(13).right_avg_accel, bs(14).right_avg_accel, bs(15).right_avg_accel, bs(16).right_avg_accel, bs(17).right_avg_accel, bs(18).right_avg_accel, bs(19).right_avg_accel];
x9=[bs(1).right_avg_jerk, bs(2).right_avg_jerk,bs(3).right_avg_jerk, bs(4).right_avg_jerk, bs(5).right_avg_jerk, bs(6).right_avg_jerk, bs(7).right_avg_jerk, bs(8).right_avg_jerk, bs(9).right_avg_jerk, bs(10).right_avg_jerk, bs(11).right_avg_jerk, bs(12).right_avg_jerk, bs(13).right_avg_jerk, bs(14).right_avg_jerk, bs(15).right_avg_jerk, bs(16).right_avg_jerk, bs(17).right_avg_jerk, bs(18).right_avg_jerk, bs(19).right_avg_jerk];
for i=1:m
    as(i).GA=as(i).GA(as(i).GA~=0);
    as(i).cor=as(i).cor(as(i).cor~=0);
    as(i).cor_curved=as(i).cor_curved(as(i).cor_curved~=0);
    as(i).left_P2P=as(i).left_P2P(as(i).left_P2P~=0);
    as(i).left_avg_speed=as(i).left_avg_speed(as(i).left_avg_speed~=0);
    as(i).left_avg_accel=as(i).left_avg_accel(as(i).left_avg_accel~=0);
    as(i).left_avg_jerk=as(i).left_avg_jerk(as(i).left_avg_jerk~=0);
    as(i).right_P2P=as(i).right_P2P(as(i).right_P2P~=0);
    as(i).right_avg_speed=as(i).right_avg_speed(as(i).right_avg_speed~=0);
    as(i).right_avg_accel=as(i).right_avg_accel(as(i).right_avg_accel~=0);
    as(i).right_avg_jerk=as(i).right_avg_jerk(as(i).right_avg_jerk~=0);    
end
for i=1:m
    bs(i).GA=bs(i).GA(bs(i).GA~=0);
    bs(i).cor=bs(i).cor(bs(i).cor~=0);
    bs(i).cor_curved=bs(i).cor_curved(bs(i).cor_curved~=0);
    bs(i).left_P2P=bs(i).left_P2P(bs(i).left_P2P~=0);
    bs(i).left_avg_speed=bs(i).left_avg_speed(bs(i).left_avg_speed~=0);
    bs(i).left_avg_accel=bs(i).left_avg_accel(bs(i).left_avg_accel~=0);
    bs(i).left_avg_jerk=bs(i).left_avg_jerk(bs(i).left_avg_jerk~=0);
    bs(i).right_P2P=bs(i).right_P2P(bs(i).right_P2P~=0);
    bs(i).right_avg_speed=bs(i).right_avg_speed(bs(i).right_avg_speed~=0);
    bs(i).right_avg_accel=bs(i).right_avg_accel(bs(i).right_avg_accel~=0);
    bs(i).right_avg_jerk=bs(i).right_avg_jerk(bs(i).right_avg_jerk~=0);    
end
grp1=[as(1).GA(1:size(as(1).cor,2)),as(2).GA(1:size(as(2).cor,2)),as(3).GA(1:size(as(3).cor,2)),as(4).GA(1:size(as(4).cor,2)),as(5).GA(1:size(as(5).cor,2)),as(6).GA(1:size(as(6).cor,2)),as(7).GA(1:size(as(7).cor,2)),as(8).GA(1:size(as(8).cor,2)),as(9).GA(1:size(as(9).cor,2)),as(10).GA(1:size(as(10).cor,2)),as(11).GA(1:size(as(11).cor,2)),as(12).GA(1:size(as(12).cor,2)),as(13).GA(1:size(as(13).cor,2)),as(14).GA(1:size(as(14).cor,2)),as(15).GA(1:size(as(15).cor,2)),as(16).GA(1:size(as(16).cor,2)),as(17).GA(1:size(as(17).cor,2)),as(18).GA(1:size(as(18).cor,2)),as(19).GA(1:size(as(19).cor,2))];
grp2=[as(1).GA(1:size(as(1).left_P2P,2)),as(2).GA(1:size(as(2).left_P2P,2)),as(3).GA(1:size(as(3).left_P2P,2)),as(4).GA(1:size(as(4).left_P2P,2)),as(5).GA(1:size(as(5).left_P2P,2)),as(6).GA(1:size(as(6).left_P2P,2)),as(7).GA(1:size(as(7).left_P2P,2)),as(8).GA(1:size(as(8).left_P2P,2)),as(9).GA(1:size(as(9).left_P2P,2)),as(10).GA(1:size(as(10).left_P2P,2)),as(11).GA(1:size(as(11).left_P2P,2)),as(12).GA(1:size(as(12).left_P2P,2)),as(13).GA(1:size(as(13).left_P2P,2)),as(14).GA(1:size(as(14).left_P2P,2)),as(15).GA(1:size(as(15).left_P2P,2)),as(16).GA(1:size(as(16).left_P2P,2)),as(17).GA(1:size(as(17).left_P2P,2)),as(18).GA(1:size(as(18).left_P2P,2)),as(19).GA(1:size(as(19).left_P2P,2))];
grp3=[as(1).GA(1:size(as(1).left_avg_speed,2)),as(2).GA(1:size(as(2).left_avg_speed,2)),as(3).GA(1:size(as(3).left_avg_speed,2)),as(4).GA(1:size(as(4).left_avg_speed,2)),as(5).GA(1:size(as(5).left_avg_speed,2)),as(6).GA(1:size(as(6).left_avg_speed,2)),as(7).GA(1:size(as(7).left_avg_speed,2)),as(8).GA(1:size(as(8).left_avg_speed,2)),as(9).GA(1:size(as(9).left_avg_speed,2)),as(10).GA(1:size(as(10).left_avg_speed,2)),as(11).GA(1:size(as(11).left_avg_speed,2)),as(12).GA(1:size(as(12).left_avg_speed,2)),as(13).GA(1:size(as(13).left_avg_speed,2)),as(14).GA(1:size(as(14).left_avg_speed,2)),as(15).GA(1:size(as(15).left_avg_speed,2)),as(16).GA(1:size(as(16).left_avg_speed,2)),as(17).GA(1:size(as(17).left_avg_speed,2)),as(18).GA(1:size(as(18).left_avg_speed,2)),as(19).GA(1:size(as(19).left_avg_speed,2))];
grp4=[as(1).GA(1:size(as(1).left_avg_accel,2)),as(2).GA(1:size(as(2).left_avg_accel,2)),as(3).GA(1:size(as(3).left_avg_accel,2)),as(4).GA(1:size(as(4).left_avg_accel,2)),as(5).GA(1:size(as(5).left_avg_accel,2)),as(6).GA(1:size(as(6).left_avg_accel,2)),as(7).GA(1:size(as(7).left_avg_accel,2)),as(8).GA(1:size(as(8).left_avg_accel,2)),as(9).GA(1:size(as(9).left_avg_accel,2)),as(10).GA(1:size(as(10).left_avg_accel,2)),as(11).GA(1:size(as(11).left_avg_accel,2)),as(12).GA(1:size(as(12).left_avg_accel,2)),as(13).GA(1:size(as(13).left_avg_accel,2)),as(14).GA(1:size(as(14).left_avg_accel,2)),as(15).GA(1:size(as(15).left_avg_accel,2)),as(16).GA(1:size(as(16).left_avg_accel,2)),as(17).GA(1:size(as(17).left_avg_accel,2)),as(18).GA(1:size(as(18).left_avg_accel,2)),as(19).GA(1:size(as(19).left_avg_accel,2))];
grp5=[as(1).GA(1:size(as(1).left_avg_jerk,2)),as(2).GA(1:size(as(2).left_avg_jerk,2)),as(3).GA(1:size(as(3).left_avg_jerk,2)),as(4).GA(1:size(as(4).left_avg_jerk,2)),as(5).GA(1:size(as(5).left_avg_jerk,2)),as(6).GA(1:size(as(6).left_avg_jerk,2)),as(7).GA(1:size(as(7).left_avg_jerk,2)),as(8).GA(1:size(as(8).left_avg_jerk,2)),as(9).GA(1:size(as(9).left_avg_jerk,2)),as(10).GA(1:size(as(10).left_avg_jerk,2)),as(11).GA(1:size(as(11).left_avg_jerk,2)),as(12).GA(1:size(as(12).left_avg_jerk,2)),as(13).GA(1:size(as(13).left_avg_jerk,2)),as(14).GA(1:size(as(14).left_avg_jerk,2)),as(15).GA(1:size(as(15).left_avg_jerk,2)),as(16).GA(1:size(as(16).left_avg_jerk,2)),as(17).GA(1:size(as(17).left_avg_jerk,2)),as(18).GA(1:size(as(18).left_avg_jerk,2)),as(19).GA(1:size(as(19).left_avg_jerk,2))];
grp6=[as(1).GA(1:size(as(1).right_P2P,2)),as(2).GA(1:size(as(2).right_P2P,2)),as(3).GA(1:size(as(3).right_P2P,2)),as(4).GA(1:size(as(4).right_P2P,2)),as(5).GA(1:size(as(5).right_P2P,2)),as(6).GA(1:size(as(6).right_P2P,2)),as(7).GA(1:size(as(7).right_P2P,2)),as(8).GA(1:size(as(8).right_P2P,2)),as(9).GA(1:size(as(9).right_P2P,2)),as(10).GA(1:size(as(10).right_P2P,2)),as(11).GA(1:size(as(11).right_P2P,2)),as(12).GA(1:size(as(12).right_P2P,2)),as(13).GA(1:size(as(13).right_P2P,2)),as(14).GA(1:size(as(14).right_P2P,2)),as(15).GA(1:size(as(15).right_P2P,2)),as(16).GA(1:size(as(16).right_P2P,2)),as(17).GA(1:size(as(17).right_P2P,2)),as(18).GA(1:size(as(18).right_P2P,2)),as(19).GA(1:size(as(19).right_P2P,2))];
grp7=[as(1).GA(1:size(as(1).right_avg_speed,2)),as(2).GA(1:size(as(2).right_avg_speed,2)),as(3).GA(1:size(as(3).right_avg_speed,2)),as(4).GA(1:size(as(4).right_avg_speed,2)),as(5).GA(1:size(as(5).right_avg_speed,2)),as(6).GA(1:size(as(6).right_avg_speed,2)),as(7).GA(1:size(as(7).right_avg_speed,2)),as(8).GA(1:size(as(8).right_avg_speed,2)),as(9).GA(1:size(as(9).right_avg_speed,2)),as(10).GA(1:size(as(10).right_avg_speed,2)),as(11).GA(1:size(as(11).right_avg_speed,2)),as(12).GA(1:size(as(12).right_avg_speed,2)),as(13).GA(1:size(as(13).right_avg_speed,2)),as(14).GA(1:size(as(14).right_avg_speed,2)),as(15).GA(1:size(as(15).right_avg_speed,2)),as(16).GA(1:size(as(16).right_avg_speed,2)),as(17).GA(1:size(as(17).right_avg_speed,2)),as(18).GA(1:size(as(18).right_avg_speed,2)),as(19).GA(1:size(as(19).right_avg_speed,2))];
grp8=[as(1).GA(1:size(as(1).right_avg_accel,2)),as(2).GA(1:size(as(2).right_avg_accel,2)),as(3).GA(1:size(as(3).right_avg_accel,2)),as(4).GA(1:size(as(4).right_avg_accel,2)),as(5).GA(1:size(as(5).right_avg_accel,2)),as(6).GA(1:size(as(6).right_avg_accel,2)),as(7).GA(1:size(as(7).right_avg_accel,2)),as(8).GA(1:size(as(8).right_avg_accel,2)),as(9).GA(1:size(as(9).right_avg_accel,2)),as(10).GA(1:size(as(10).right_avg_accel,2)),as(11).GA(1:size(as(11).right_avg_accel,2)),as(12).GA(1:size(as(12).right_avg_accel,2)),as(13).GA(1:size(as(13).right_avg_accel,2)),as(14).GA(1:size(as(14).right_avg_accel,2)),as(15).GA(1:size(as(15).right_avg_accel,2)),as(16).GA(1:size(as(16).right_avg_accel,2)),as(17).GA(1:size(as(17).right_avg_accel,2)),as(18).GA(1:size(as(18).right_avg_accel,2)),as(19).GA(1:size(as(19).right_avg_accel,2))];
grp9=[as(1).GA(1:size(as(1).right_avg_jerk,2)),as(2).GA(1:size(as(2).right_avg_jerk,2)),as(3).GA(1:size(as(3).right_avg_jerk,2)),as(4).GA(1:size(as(4).right_avg_jerk,2)),as(5).GA(1:size(as(5).right_avg_jerk,2)),as(6).GA(1:size(as(6).right_avg_jerk,2)),as(7).GA(1:size(as(7).right_avg_jerk,2)),as(8).GA(1:size(as(8).right_avg_jerk,2)),as(9).GA(1:size(as(9).right_avg_jerk,2)),as(10).GA(1:size(as(10).right_avg_jerk,2)),as(11).GA(1:size(as(11).right_avg_jerk,2)),as(12).GA(1:size(as(12).right_avg_jerk,2)),as(13).GA(1:size(as(13).right_avg_jerk,2)),as(14).GA(1:size(as(14).right_avg_jerk,2)),as(15).GA(1:size(as(15).right_avg_jerk,2)),as(16).GA(1:size(as(16).right_avg_jerk,2)),as(17).GA(1:size(as(17).right_avg_jerk,2)),as(18).GA(1:size(as(18).right_avg_jerk,2)),as(19).GA(1:size(as(19).right_avg_jerk,2))];
grp10=[as(1).GA(1:size(as(1).cor_curved,2)),as(2).GA(1:size(as(2).cor_curved,2)),as(3).GA(1:size(as(3).cor_curved,2)),as(4).GA(1:size(as(4).cor_curved,2)),as(5).GA(1:size(as(5).cor_curved,2)),as(6).GA(1:size(as(6).cor_curved,2)),as(7).GA(1:size(as(7).cor_curved,2)),as(8).GA(1:size(as(8).cor_curved,2)),as(9).GA(1:size(as(9).cor_curved,2)),as(10).GA(1:size(as(10).cor_curved,2)),as(11).GA(1:size(as(11).cor_curved,2)),as(12).GA(1:size(as(12).cor_curved,2)),as(13).GA(1:size(as(13).cor_curved,2)),as(14).GA(1:size(as(14).cor_curved,2)),as(15).GA(1:size(as(15).cor_curved,2)),as(16).GA(1:size(as(16).cor_curved,2)),as(17).GA(1:size(as(17).cor_curved,2)),as(18).GA(1:size(as(18).cor_curved,2)),as(19).GA(1:size(as(19).cor_curved,2))];
y=[as(1).cor, as(2).cor, as(3).cor, as(4).cor, as(5).cor, as(6).cor, as(7).cor, as(8).cor, as(9).cor, as(10).cor,as(11).cor,as(12).cor,as(13).cor,as(14).cor,as(15).cor,as(16).cor,as(17).cor,as(18).cor,as(19).cor];
y1=[as(1).cor_curved, as(2).cor_curved,as(3).cor_curved, as(4).cor_curved, as(5).cor_curved, as(6).cor_curved, as(7).cor_curved, as(8).cor_curved, as(9).cor_curved, as(10).cor_curved,as(11).cor_curved,as(12).cor_curved,as(13).cor_curved,as(14).cor_curved,as(15).cor_curved,as(16).cor_curved,as(17).cor_curved,as(18).cor_curved,as(19).cor_curved];
y2=[as(1).left_P2P, as(2).left_P2P,as(3).left_P2P, as(4).left_P2P, as(5).left_P2P, as(6).left_P2P, as(7).left_P2P, as(8).left_P2P, as(9).left_P2P, as(10).left_P2P,as(11).left_P2P,as(12).left_P2P,as(13).left_P2P,as(14).left_P2P,as(15).left_P2P,as(16).left_P2P,as(17).left_P2P,as(18).left_P2P,as(19).left_P2P];
y3=[as(1).left_avg_speed, as(2).left_avg_speed,as(3).left_avg_speed, as(4).left_avg_speed, as(5).left_avg_speed, as(6).left_avg_speed, as(7).left_avg_speed, as(8).left_avg_speed, as(9).left_avg_speed, as(10).left_avg_speed,as(11).left_avg_speed,as(12).left_avg_speed,as(13).left_avg_speed,as(14).left_avg_speed,as(15).left_avg_speed,as(16).left_avg_speed,as(17).left_avg_speed,as(18).left_avg_speed,as(19).left_avg_speed];
y4=[as(1).left_avg_accel, as(2).left_avg_accel,as(3).left_avg_accel, as(4).left_avg_accel, as(5).left_avg_accel, as(6).left_avg_accel, as(7).left_avg_accel, as(8).left_avg_accel, as(9).left_avg_accel, as(10).left_avg_accel,as(11).left_avg_accel,as(12).left_avg_accel,as(13).left_avg_accel,as(14).left_avg_accel,as(15).left_avg_accel,as(16).left_avg_accel,as(17).left_avg_accel,as(18).left_avg_accel,as(19).left_avg_accel];
y5=[as(1).left_avg_jerk, as(2).left_avg_jerk,as(3).left_avg_jerk, as(4).left_avg_jerk, as(5).left_avg_jerk, as(6).left_avg_jerk, as(7).left_avg_jerk, as(8).left_avg_jerk, as(9).left_avg_jerk, as(10).left_avg_jerk,as(11).left_avg_jerk,as(12).left_avg_jerk,as(13).left_avg_jerk,as(14).left_avg_jerk,as(15).left_avg_jerk,as(16).left_avg_jerk,as(17).left_avg_jerk,as(18).left_avg_jerk,as(19).left_avg_jerk];
y6=[as(1).right_P2P, as(2).right_P2P, as(3).right_P2P, as(4).right_P2P, as(5).right_P2P, as(6).right_P2P, as(7).right_P2P, as(8).right_P2P, as(9).right_P2P, as(10).right_P2P,as(11).right_P2P,as(12).right_P2P,as(13).right_P2P,as(14).right_P2P,as(15).right_P2P,as(16).right_P2P,as(17).right_P2P,as(18).right_P2P,as(19).right_P2P];
y7=[as(1).right_avg_speed, as(2).right_avg_speed, as(3).right_avg_speed, as(4).right_avg_speed, as(5).right_avg_speed, as(6).right_avg_speed, as(7).right_avg_speed, as(8).right_avg_speed, as(9).right_avg_speed, as(10).right_avg_speed,as(11).right_avg_speed,as(12).right_avg_speed,as(13).right_avg_speed,as(14).right_avg_speed,as(15).right_avg_speed,as(16).right_avg_speed,as(17).right_avg_speed,as(18).right_avg_speed,as(19).right_avg_speed];
y8=[as(1).right_avg_accel, as(2).right_avg_accel, as(3).right_avg_accel, as(4).right_avg_accel, as(5).right_avg_accel, as(6).right_avg_accel, as(7).right_avg_accel, as(8).right_avg_accel, as(9).right_avg_accel, as(10).right_avg_accel,as(11).right_avg_accel,as(12).right_avg_accel,as(13).right_avg_accel,as(14).right_avg_accel,as(15).right_avg_accel,as(16).right_avg_accel,as(17).right_avg_accel,as(18).right_avg_accel,as(19).right_avg_accel];
y9=[as(1).right_avg_jerk, as(2).right_avg_jerk, as(3).right_avg_jerk, as(4).right_avg_jerk, as(5).right_avg_jerk, as(6).right_avg_jerk, as(7).right_avg_jerk, as(8).right_avg_jerk, as(9).right_avg_jerk, as(10).right_avg_jerk,as(11).right_avg_jerk,as(12).right_avg_jerk,as(13).right_avg_jerk,as(14).right_avg_jerk,as(15).right_avg_jerk,as(16).right_avg_jerk,as(17).right_avg_jerk,as(18).right_avg_jerk,as(19).right_avg_jerk];
%%
pos=get(groot,'ScreenSize');
h=figure('Position',pos);
boxplot(x,grp,'color','r')
hold on
boxplot(y,grp1,'color','b')
title('Correlation Plot Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Correlation units')
ylim([-1 1])
set(gca,'XTickLabel',GA);
% saveas(h,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\cor','jpg')
hold off

h1=figure('Position',pos);
boxplot(x1,grp,'color','r')
hold on
boxplot(y1,grp10,'color','b')
title('Correlation Plot After Normalization');
xlabel('Gestational Age (Weeks)');
ylabel('Correlation unit');
ylim([-1 1])
set(gca,'XTickLabel',GA);
% print(h1,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\cor_curved','-dpng','-r900')
hold off

h2=figure('Position',pos);
boxplot(x2,grp,'color','r')
hold on
boxplot(y2,grp2,'color','b')
title('Lefteye P2P Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 150])
set(gca,'XTickLabel',GA);
% print(h2,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Left_P2P','-dpng','-r900')
hold off

h3=figure('Position',pos);
boxplot(x3,grp,'color','r')
hold on
boxplot(y3,grp3,'color','b')
title('Lefteye Average Speed Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
set(gca,'XTickLabel',GA);
ylim([-2 3])
% print(h3,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Left_Avg_Speed','-dpng','-r900')
hold off

h4=figure('Position',pos);
boxplot(x4,grp,'color','r')
hold on
boxplot(y4,grp4,'color','b')
title('Lefteye Average Acceleration Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 100])
set(gca,'XTickLabel',GA);
% print(h4,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Left_Avg_Accel','-dpng','-r900')
hold off

h5=figure('Position',pos);
boxplot(x5,grp,'color','r')
hold on
boxplot(y5,grp5,'color','b')
title('Lefteye Average Jerk Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 4200])
set(gca,'XTickLabel',GA);
% print(h5,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Left_Avg_Jerk','-dpng','-r900')
hold off

h6=figure('Position',pos);
boxplot(x6,grp,'color','r')
hold on
boxplot(y6,grp6,'color','b')
title('Righteye P2P Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 150])
set(gca,'XTickLabel',GA);
% print(h6,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Right_P2P','-dpng','-r900')
hold off

h7=figure('Position',pos);
boxplot(x7,grp,'color','r')
hold on
boxplot(y7,grp7,'color','b')
title('Righteye Average Speed Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-1 2])
set(gca,'XTickLabel',GA);
% print(h7,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Right_Avg_Speed','-dpng','-r900')
hold off

h8= figure('Position',pos);
boxplot(x8,grp,'color','r')
hold on
boxplot(y8,grp8,'color','b')
title('Righteye Average Acceleration Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 50])
set(gca,'XTickLabel',GA);
% print(h,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Right_Avg_Accel','-dpng','-r900')
hold off

h9=figure('Position',pos);
boxplot(x9,grp,'color','r')
hold on
boxplot(y9,grp9,'color','b')
title('Righteye Average Jerk Before and After Stimuli');
xlabel('Gestational Age (Weeks)');
ylabel('Degrees')
ylim([-10 4200])
set(gca,'XTickLabel',GA);
% print(h9,'C:\Users\Jaladharstud\Documents\MATLAB\Eye_Tracking_03192015\garphs_03262015\Right_Avg_Jerk','-dpng','-r900')
hold off
