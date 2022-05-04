% configRNA
% número de bits da parte fracionária
bp = 10;
% bit do sinal + parte inteira + parte fracionária
nb = 1+3+bp;

% Delay multiplier block in output layer
delayMul = 0;
% Delay multiplier block in hidden layer
delayMuly = 0;
% Delay multiplier block in input layer
delayMulx = 0;

% Delay ROM block
delayROMSig = 1;

%RNA BNE e BNE_EC configuration
n = 4; %Inputs
m = 4; %Neurons in hidden layer;
p = 1; %Neurons in output layer
mu = 0.008; %Learning
alpha = 0; %Adaptation
equalizerDelay = 0;


limSim = 80; %Step in simulink

M1 = rand(p,m+1)+1i*rand(p,m+1);
M2 = rand(p,m+1)+1i*rand(p,m+1);
M3 = rand(m,n+1)+1i*rand(m,n+1);


buffer = 50;

ts = 1;



