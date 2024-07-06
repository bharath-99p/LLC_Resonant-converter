V_INDC=800;
Vf=1.2;
Ron=10e-3;
Vref=500;
tsample_Controller=20e-6;
Cr =49.2e-9;%4.9200e-08*2;
m=4;
Lr=18.6e-6;%13e-6*2; 
Lm=88e-6;
Tr_ratio=(19/30);
TR=Tr_ratio;
Lm1=Lm/2;
Lm2=Lm/2;
Ls11=Lm1*1/((Tr_ratio)^2)
Ls12=Lm1*1/((Tr_ratio)^2)
Ls21=Lm2*1/((Tr_ratio)^2)
Ls22=Lm2*1/((Tr_ratio)^2)
tcharge=100e-3;
DeltaV=100;
Icc=100;
Pmax=30e3;
C_bat=Icc*tcharge/DeltaV
R_bat=50e-3;
V_intial=150;


Vout1=Vref;
Iout=100 %Pmax/Vout1;

R1=TR*TR*8/(pi*pi)*Vout1/Iout;
R2=TR*TR*8/(pi*pi)*Vout1/54;
R3=TR*TR*8/(pi*pi)*Vout1/20;

llc1= tf([Lm*Cr,0,0],[Lr*Lm*Cr/R1,Cr*(Lr+Lm),Lm/R1,1]);
%llc2= tf([Lm*Cr,0,0],[Lr*Lm*Cr/R2,Cr*(Lr+Lm),Lm/R2,1]);
%llc3= tf([Lm*Cr,0,0],[Lr*Lm*Cr/R3,Cr*(Lr+Lm),Lm/R3,1]);


%bode(llc1,'b',llc2,'r',llc3,'y',{2*pi*10e3,2*pi*10e5})
bode(llc1,'b',{2*pi*10e2,2*pi*100e4})
grid on

%mag=squeeze(mag);
%gain = interp1(wout,mag,2*pi*10e3)

%bode(llc_NL,{2*pi*10e2,2*pi*10e6})

Vinv_rms=400*4/pi*1.414
Iinv_rms=20e3/Vinv_rms


