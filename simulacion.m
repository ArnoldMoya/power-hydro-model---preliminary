clear all
close all
clc
data=xlsread('data.xlsx');
t=0:1:size(data,1)-1; t=t';
SP1=180;
SP2=180;
SP3=180;

P1=data(:,1);
f1=data(:,2)/60;
P_i_u1=SP1;%P1(1);

P2=data(:,3);
f2=data(:,4)/60;
P_i_u2=P2(1);

P3=data(:,5);
f3=data(:,6)/60;
P_i_u3=P3(1);

DS= xlsread('DS_resultado_080221_02_41_15.xlsx');
DS_t=DS(:,1);
DS_P1=DS(:,2);
DS_P2=DS(:,3);
DS_P3=DS(:,4);
%h=data(:,3)/30;
%q=data(:,4)/77;
%yr=data(:,5)/100;
%% PID
kp=3.0;
tx=0.8;
bp=0.05;
td=0;
t3=0.01;
%% POC
kp_poc=0.4;
tn_poc=5;
%% Condiciones iniciales
% Unidad 1
SP=SP1;
%SP=P_i_u1;

condiciones=sim('condiciones_iniciales_model','ReturnWorkspaceOutputs','on');
poc_i_u1=condiciones.poc_i;
y_i_u1=condiciones.y_i;
q_i_u1=condiciones.q_i;

% Unidad 2
SP=SP2;
condiciones=sim('condiciones_iniciales_model','ReturnWorkspaceOutputs','on');
poc_i_u2=condiciones.poc_i;
y_i_u2=condiciones.y_i;
q_i_u2=condiciones.q_i;

% Unidad 2
SP=SP3;
condiciones=sim('condiciones_iniciales_model','ReturnWorkspaceOutputs','on');
poc_i_u3=condiciones.poc_i;
y_i_u3=condiciones.y_i;
q_i_u3=condiciones.q_i;

qt_i=q_i_u1 + q_i_u2 + q_i_u3;
%plot(condiciones.P_sim.data(2:end));

%% Evento
evento=sim('CDA','ReturnWorkspaceOutputs','on');
P1_sim=evento.P1_sim.data;
P1_reivax=evento.P1_reivax.data;
% subplot(2,1,1)
% plot(P1_sim)
% axis([1 300 170 190])
% subplot(2,1,2)
% plot(P)
% axis([1 300 170 190])

%% R2
%corr=corrcoef(P1,P1_sim);
%R2=(corr(1,2))^2


