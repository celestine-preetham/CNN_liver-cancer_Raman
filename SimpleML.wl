(*Wolfram Mathematica code to reproduce the results in Lawrence, C. P. (2023). Simple machine learning methods work surprisingly well for Ramanomics. Journal of Raman Spectroscopy. *)

url="https://raw.githubusercontent.com/thidoiSanren/CNN_liver-cancer_Raman/main/demo%20data/demo%20data_Raman%20liver_";

trainDat = N@Import[url<>"train.txt","Table"];
valDat = N@Import[url<>"validate.txt","Table"];
testDat=N@Import[url<>"test.txt","Table"];

trainingset = Table[t〚2 ;; 890〛-> t〚1〛, {t, trainDat}];
testset = Table[t〚2 ;; 890〛-> t〚1〛, {t, testDat}];
valset = Table[t〚2 ;; 890〛-> t〚1〛, {t, valDat}];

c = Classify[trainingset, Method -> "LogisticRegression", ValidationSet -> valset]
ClassifierMeasurements[c, testset]

c = Classify[trainingset, ValidationSet -> valset, PerformanceGoal -> "Quality", Method -> "RandomForest"]
ClassifierMeasurements[c, testset]
