package MinPhyslib
  model O2
    Physiolibrary.Chemical.Components.Substance veins(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{-64, -24}, {-44, -4}})));
    Physiolibrary.Chemical.Components.Substance arteries(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{54, -24}, {74, -4}})));
    Physiolibrary.Chemical.Components.SolutePump tissuesFlow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {8, -56})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage tissues(concentration = 1) annotation(Placement(transformation(extent = {{-2, -94}, {18, -74}})));
    Physiolibrary.Chemical.Components.Stream tissuesStream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {30, -36})));
    Physiolibrary.Chemical.Components.Stream lungsOutstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {36, 26})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst bloodFlow(k = 9.1666666666667e-05) annotation(Placement(transformation(extent = {{-96, 34}, {-52, 54}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst tissuesFlowRateConst(k = 0.0003) annotation(Placement(transformation(extent = {{-22, -10}, {22, 10}}, rotation = 180, origin = {66, -56})));
    Physiolibrary.Chemical.Components.SolutePump lungsOutflow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {6, 62})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage alveolSpace(concentration = 1, useConcentrationInput = false) annotation(Placement(transformation(extent = {{-78, 68}, {-50, 96}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst LungsFlowRateConst(k = 0.0007) annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {62, 68})));
    Physiolibrary.Types.Constants.VolumeConst volume(k = 0.0035) annotation(Placement(transformation(extent = {{-90, -14}, {-72, 0}})));
    Physiolibrary.Types.Constants.VolumeConst volume1(k = 0.0015) annotation(Placement(transformation(extent = {{26, -16}, {44, -2}})));
  equation
    connect(arteries.q_out, tissuesStream.q_in) annotation(Line(points = {{64, -14}, {64, -46}, {30, -46}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(tissuesStream.q_out, tissuesFlow.q_in) annotation(Line(points = {{30, -26}, {18, -26}, {18, -56}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(tissuesFlow.q_out, tissues.q_out) annotation(Line(points = {{-2, -56}, {-2, -84}, {18, -84}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_out, tissuesStream.q_out) annotation(Line(points = {{-54, -14}, {-54, -26}, {30, -26}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutstream.q_out, tissuesStream.q_in) annotation(Line(points = {{36, 16}, {64, 16}, {64, -46}, {30, -46}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(bloodFlow.y, lungsOutstream.solutionFlow) annotation(Line(points = {{-46.5, 44}, {43, 44}, {43, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(bloodFlow.y, tissuesStream.solutionFlow) annotation(Line(points = {{-46.5, 44}, {12, 44}, {12, -36}, {23, -36}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(tissuesFlowRateConst.y, tissuesFlow.soluteFlow) annotation(Line(points = {{38.5, -56}, {22, -56}, {22, -60}, {4, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsOutflow.q_out, lungsOutstream.q_in) annotation(Line(points = {{-4, 62}, {-4, 36}, {36, 36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(alveolSpace.q_out, lungsOutflow.q_in) annotation(Line(points = {{-50, 82}, {16, 82}, {16, 62}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutflow.soluteFlow, LungsFlowRateConst.y) annotation(Line(points = {{2, 58}, {20, 58}, {20, 68}, {37, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(volume.y, veins.solutionVolume) annotation(Line(points = {{-69.75, -7}, {-70, -7}, {-70, -10}, {-58, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(volume1.y, arteries.solutionVolume) annotation(Line(points = {{46.25, -9}, {51.125, -9}, {51.125, -10}, {60, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(veins.q_out, lungsOutstream.q_in) annotation(Line(points = {{-54, -14}, {-54, 36}, {36, 36}}, color = {107, 45, 134}, thickness = 1));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end O2;

  model CVS
    Physiolibrary.Hydraulic.Components.ElasticVessel arteries(ZeroPressureVolume = 0, volume_start = 0.001, Compliance = 7.5006157584566e-08) annotation(Placement(transformation(extent = {{44, -60}, {64, -40}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel veins(ZeroPressureVolume = 0, volume_start = 0.0035, Compliance = 1.3126077577299e-05) annotation(Placement(transformation(extent = {{-100, -60}, {-80, -40}})));
    Physiolibrary.Hydraulic.Components.Conductor peripheral(Conductance = 7.1430864073035e-09) annotation(Placement(transformation(extent = {{-26, -60}, {-6, -40}})));
    Physiolibrary.Hydraulic.Components.Pump rightHeart(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-72, 6}, {-52, 26}})));
    Physiolibrary.Hydraulic.Components.Pump leftHeart(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{30, 8}, {50, 28}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(ZeroPressureVolume = 0, volume_start = 0.0004, Compliance = 6.0004926067653e-07) annotation(Placement(transformation(extent = {{10, 64}, {30, 84}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(ZeroPressureVolume = 0, volume_start = 0.0001, Compliance = 5.0029107108905e-08) annotation(Placement(transformation(extent = {{-66, 64}, {-46, 84}})));
    Physiolibrary.Hydraulic.Components.Conductor pulmonary(Conductance = 6.9838233326989e-08) annotation(Placement(transformation(extent = {{-34, 64}, {-14, 84}})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRateConst(k(displayUnit = "ml/min") = 9.1666666666667e-05) annotation(Placement(transformation(extent = {{-32, 28}, {-12, 48}})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(displayUnit = "ml/min") = 9.1666666666667e-05 * 0.75) annotation(Placement(visible = true, transformation(origin = {48, 4}, extent = {{-32, 28}, {-12, 48}}, rotation = 0)));
  equation
    connect(volumeFlowRate.y, leftHeart.solutionFlow) annotation(Line(points = {{38.5, 42}, {40, 42}, {40, 26}, {40, 26}}, color = {0, 0, 127}));
    connect(veins.q_in, rightHeart.q_in) annotation(Line(points = {{-90, -50}, {-90, 16}, {-72, 16}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_in, peripheral.q_in) annotation(Line(points = {{-90, -50}, {-26, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(peripheral.q_out, arteries.q_in) annotation(Line(points = {{-6, -50}, {54, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(rightHeart.q_out, pulmonaryArteries.q_in) annotation(Line(points = {{-52, 16}, {-48, 16}, {-48, 54}, {-76, 54}, {-76, 74}, {-56, 74}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonaryArteries.q_in, pulmonary.q_in) annotation(Line(points = {{-56, 74}, {-34, 74}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonary.q_out, pulmonaryVeins.q_in) annotation(Line(points = {{-14, 74}, {20, 74}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonaryVeins.q_in, leftHeart.q_in) annotation(Line(points = {{20, 74}, {34, 74}, {34, 56}, {8, 56}, {8, 18}, {30, 18}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(leftHeart.q_out, arteries.q_in) annotation(Line(points = {{50, 18}, {54, 18}, {54, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(volumeFlowRateConst.y, rightHeart.solutionFlow) annotation(Line(points = {{-9.5, 38}, {-6, 38}, {-6, 23}, {-62, 23}}, color = {0, 0, 127}, smooth = Smooth.None));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
  end CVS;

  model O2MinimalBus
    Physiolibrary.Chemical.Components.Substance veins(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{-64, -24}, {-44, -4}})));
    Physiolibrary.Chemical.Components.Substance arteries(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{54, -24}, {74, -4}})));
    Physiolibrary.Chemical.Components.Stream lungsInstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-38, 26})));
    Physiolibrary.Chemical.Components.SolutePump tissuesFlow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {8, -56})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage tissues(concentration = 1) annotation(Placement(transformation(extent = {{-2, -94}, {18, -74}})));
    Physiolibrary.Chemical.Components.Stream tissuesStream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {30, -36})));
    Physiolibrary.Chemical.Components.Stream lungsOutstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {36, 26})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst bloodFlow(k = 9.1666666666667e-05) annotation(Placement(transformation(extent = {{-96, 34}, {-52, 54}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst tissuesFlowRateConst(k = 0.00045) annotation(Placement(transformation(extent = {{-22, -10}, {22, 10}}, rotation = 180, origin = {66, -56})));
    Physiolibrary.Chemical.Components.SolutePump lungsOutflow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {6, 62})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage alveolSpace(concentration = 1) annotation(Placement(transformation(extent = {{-78, 68}, {-50, 96}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst LungsFlowRateConst(k = 0.0007) annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {50, 72})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage lungsIn(concentration = 1) annotation(Placement(transformation(extent = {{-24, 16}, {-4, 36}})));
    Physiolibrary.Types.BusConnector busConnector annotation(Placement(transformation(extent = {{-92, -90}, {-52, -50}})));
  equation
    connect(arteries.q_out, tissuesStream.q_in) annotation(Line(points = {{64, -14}, {64, -46}, {30, -46}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(tissuesStream.q_out, tissuesFlow.q_in) annotation(Line(points = {{30, -26}, {18, -26}, {18, -56}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(tissuesFlow.q_out, tissues.q_out) annotation(Line(points = {{-2, -56}, {-2, -84}, {18, -84}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_out, tissuesStream.q_out) annotation(Line(points = {{-54, -14}, {-54, -26}, {30, -26}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_out, lungsInstream.q_in) annotation(Line(points = {{-54, -14}, {-54, 36}, {-38, 36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutstream.q_out, tissuesStream.q_in) annotation(Line(points = {{36, 16}, {64, 16}, {64, -46}, {30, -46}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(bloodFlow.y, lungsInstream.solutionFlow) annotation(Line(points = {{-46.5, 44}, {-31, 44}, {-31, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(bloodFlow.y, lungsOutstream.solutionFlow) annotation(Line(points = {{-46.5, 44}, {43, 44}, {43, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(bloodFlow.y, tissuesStream.solutionFlow) annotation(Line(points = {{-46.5, 44}, {12, 44}, {12, -36}, {23, -36}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(tissuesFlowRateConst.y, tissuesFlow.soluteFlow) annotation(Line(points = {{38.5, -56}, {22, -56}, {22, -60}, {4, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsOutflow.q_out, lungsOutstream.q_in) annotation(Line(points = {{-4, 62}, {-4, 36}, {36, 36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(alveolSpace.q_out, lungsOutflow.q_in) annotation(Line(points = {{-50, 82}, {16, 82}, {16, 62}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutflow.soluteFlow, LungsFlowRateConst.y) annotation(Line(points = {{2, 58}, {20, 58}, {20, 72}, {25, 72}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsInstream.q_out, lungsIn.q_out) annotation(Line(points = {{-38, 16}, {-16.2, 16}, {-16.2, 26}, {-4, 26}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.solutionVolume, busConnector.veinsVolume) annotation(Line(points = {{-58, -10}, {-68, -10}, {-68, -70}, {-72, -70}}, color = {0, 0, 127}, smooth = Smooth.None), Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
    connect(arteries.solutionVolume, busConnector.arterialVolume) annotation(Line(points = {{60, -10}, {-6, -10}, {-6, -70}, {-72, -70}}, color = {0, 0, 127}, smooth = Smooth.None), Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end O2MinimalBus;

  model CVSMinimalBus
    Physiolibrary.Hydraulic.Components.ElasticVessel arteries(ZeroPressureVolume = 0, volume_start = 0.001, Compliance = 7.5006157584566e-08) annotation(Placement(transformation(extent = {{44, -60}, {64, -40}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel veins(ZeroPressureVolume = 0, volume_start = 0.0035, Compliance = 1.3126077577299e-05) annotation(Placement(transformation(extent = {{-100, -60}, {-80, -40}})));
    Physiolibrary.Hydraulic.Components.Conductor peripheral(Conductance = 7.1430864073035e-09) annotation(Placement(transformation(extent = {{-26, -60}, {-6, -40}})));
    Physiolibrary.Hydraulic.Components.Pump rightHeart(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-72, 6}, {-52, 26}})));
    Physiolibrary.Hydraulic.Components.Pump leftHeart(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{30, 8}, {50, 28}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(ZeroPressureVolume = 0, volume_start = 0.0004, Compliance = 6.0004926067653e-07) annotation(Placement(transformation(extent = {{10, 64}, {30, 84}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(ZeroPressureVolume = 0, volume_start = 0.0001, Compliance = 5.0029107108905e-08) annotation(Placement(transformation(extent = {{-66, 64}, {-46, 84}})));
    Physiolibrary.Hydraulic.Components.Conductor pulmonary(Conductance = 6.9838233326989e-08) annotation(Placement(transformation(extent = {{-34, 64}, {-14, 84}})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRateConst(k(displayUnit = "ml/min") = 9.1666666666667e-05) annotation(Placement(transformation(extent = {{-32, 28}, {-12, 48}})));
    Physiolibrary.Types.BusConnector busConnector annotation(Placement(transformation(extent = {{-52, -32}, {-12, 8}})));
  equation
    connect(veins.q_in, rightHeart.q_in) annotation(Line(points = {{-90, -50}, {-90, 16}, {-72, 16}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_in, peripheral.q_in) annotation(Line(points = {{-90, -50}, {-26, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(peripheral.q_out, arteries.q_in) annotation(Line(points = {{-6, -50}, {54, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(rightHeart.q_out, pulmonaryArteries.q_in) annotation(Line(points = {{-52, 16}, {-48, 16}, {-48, 54}, {-76, 54}, {-76, 74}, {-56, 74}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonaryArteries.q_in, pulmonary.q_in) annotation(Line(points = {{-56, 74}, {-34, 74}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonary.q_out, pulmonaryVeins.q_in) annotation(Line(points = {{-14, 74}, {20, 74}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonaryVeins.q_in, leftHeart.q_in) annotation(Line(points = {{20, 74}, {34, 74}, {34, 56}, {8, 56}, {8, 18}, {30, 18}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(leftHeart.q_out, arteries.q_in) annotation(Line(points = {{50, 18}, {54, 18}, {54, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(volumeFlowRateConst.y, leftHeart.solutionFlow) annotation(Line(points = {{-9.5, 38}, {12, 38}, {12, 25}, {40, 25}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(volumeFlowRateConst.y, rightHeart.solutionFlow) annotation(Line(points = {{-9.5, 38}, {-6, 38}, {-6, 23}, {-62, 23}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(busConnector.veinsVolume, veins.volume) annotation(Line(points = {{-32, -12}, {-60, -12}, {-60, -60}, {-84, -60}}, color = {255, 204, 51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}));
    connect(busConnector.arterialVolume, arteries.volume) annotation(Line(points = {{-32, -12}, {12, -12}, {12, -60}, {60, -60}}, color = {255, 204, 51}, thickness = 0.5, smooth = Smooth.None), Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end CVSMinimalBus;

  model system
    O2MinimalBus o2MinimalBus annotation(Placement(transformation(extent = {{-28, 32}, {20, 68}})));
    CVSMinimalBus cVSMinimalBus annotation(Placement(transformation(extent = {{40, 28}, {88, 64}})));
  equation
    connect(o2MinimalBus.busConnector, cVSMinimalBus.busConnector) annotation(Line(points = {{-21.28, 37.4}, {-20, 37.4}, {-20, -2}, {54, -2}, {54, 43.84}, {56.32, 43.84}}, color = {255, 204, 51}, thickness = 0.5, smooth = Smooth.None));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
  end system;

  model CVSReg
    Physiolibrary.Hydraulic.Components.ElasticVessel arteries(ZeroPressureVolume = 0, volume_start = 0.001, Compliance = 7.5006157584566e-08) annotation(Placement(transformation(extent = {{44, -60}, {64, -40}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel veins(ZeroPressureVolume = 0, volume_start = 0.0035, Compliance = 1.3126077577299e-05) annotation(Placement(transformation(extent = {{-100, -60}, {-80, -40}})));
    Physiolibrary.Hydraulic.Components.Conductor peripheral(Conductance = 7.1430864073035e-09) annotation(Placement(transformation(extent = {{-26, -60}, {-6, -40}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(ZeroPressureVolume = 0, volume_start = 0.0004, Compliance = 6.0004926067653e-07) annotation(Placement(transformation(extent = {{-8, 78}, {12, 98}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(ZeroPressureVolume = 0, volume_start = 0.0001, Compliance = 5.0029107108905e-08) annotation(Placement(transformation(extent = {{-58, 78}, {-38, 98}})));
    Physiolibrary.Hydraulic.Components.Conductor pulmonary(Conductance = 6.9838233326989e-08) annotation(Placement(transformation(extent = {{-32, 78}, {-12, 98}})));
    Physiolibrary.Types.Constants.PressureConst normalSystemicVeinsPressure(k = 266.64477483) annotation(Placement(visible = true, transformation(origin = {-51, -4}, extent = {{13, -6}, {-13, 6}}, rotation = 0)));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k = 9.1666666666667e-05) annotation(Placement(visible = true, transformation(origin = {-66, 57}, extent = {{-14, -5}, {14, 5}}, rotation = 0)));
    Physiolibrary.Hydraulic.Sensors.PressureMeasure pulmPressure annotation(Placement(visible = true, transformation(origin = {-87, 42}, extent = {{-5, -6}, {5, 6}}, rotation = 0)));
    Physiolibrary.Types.Constants.PressureConst normalPulmonarzVeinsPressure(k = 666.611937075) annotation(Placement(visible = true, transformation(origin = {2, 28}, extent = {{-10, -4}, {10, 4}}, rotation = 0)));
    Physiolibrary.Hydraulic.Components.Pump leftHeart(useSolutionFlowInput = true) annotation(Placement(visible = true, transformation(extent = {{50, 6}, {70, 26}}, rotation = 0)));
    Physiolibrary.Hydraulic.Components.Pump rightHeart(useSolutionFlowInput = true) annotation(Placement(visible = true, transformation(extent = {{-46, 2}, {-26, 22}}, rotation = 0)));
    Physiolibrary.Blocks.Factors.Normalization effect1 annotation(Placement(visible = true, transformation(origin = {-36, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(visible = true, transformation(origin = {29, 49}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
    Modelica.Blocks.Math.Division division2 annotation(Placement(visible = true, transformation(origin = {32, 34}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
    Physiolibrary.Blocks.Factors.Normalization effect3 annotation(Placement(visible = true, transformation(origin = {60, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Physiolibrary.Blocks.Factors.Normalization effect2 annotation(Placement(visible = true, transformation(origin = {60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k = 9.1666666666667e-05 * 0.75) annotation(Placement(visible = true, transformation(origin = {43, 68}, extent = {{-11, -4}, {11, 4}}, rotation = 0)));
    Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {-64, 36}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
    Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure2 annotation(Placement(visible = true, transformation(origin = {-1, 44}, extent = {{-5, -6}, {5, 6}}, rotation = 0)));
  equation
    connect(normalSystemicVeinsPressure.y, division1.u2) annotation(Line(points = {{-67.25, -4}, {-78, -4}, {-78, 34}, {-70, 34}, {-70, 33.6}, {-68.8, 33.6}}, color = {0, 0, 127}));
    connect(rightHeart.solutionFlow, effect1.y) annotation(Line(points = {{-36, 19}, {-36, 19}, {-36, 28}}, color = {0, 0, 127}));
    connect(volumeFlowRate1.y, effect1.yBase) annotation(Line(points = {{-48.5, 57}, {-36, 57}, {-36, 48}, {-36, 34}}, color = {0, 0, 127}));
    connect(pulmPressure.q_in, veins.q_in) annotation(Line(points = {{-89, 38.4}, {-90, 38.4}, {-90, -50}}));
    connect(const.y, effect2.u) annotation(Line(points = {{34.5, 49}, {52, 49}, {52, 50}}, color = {0, 0, 127}));
    connect(rightHeart.q_out, pulmonaryArteries.q_in) annotation(Line(points = {{-26, 12}, {-26, 68}, {-68, 68}, {-68, 88}, {-48, 88}}, thickness = 1));
    connect(veins.q_in, rightHeart.q_in) annotation(Line(points = {{-90, -50}, {-90, 12}, {-46, 12}}, thickness = 1));
    connect(leftHeart.q_out, arteries.q_in) annotation(Line(points = {{70, 16}, {70, -16}, {54, -16}, {54, -50}}, thickness = 1));
    connect(pulmonaryVeins.q_in, leftHeart.q_in) annotation(Line(points = {{2, 88}, {28, 88}, {28, 68}, {-16, 68}, {-16, 16}, {50, 16}}, thickness = 1));
    connect(veins.q_in, peripheral.q_in) annotation(Line(points = {{-90, -50}, {-26, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(peripheral.q_out, arteries.q_in) annotation(Line(points = {{-6, -50}, {54, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonaryArteries.q_in, pulmonary.q_in) annotation(Line(points = {{-48, 88}, {-32, 88}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonary.q_out, pulmonaryVeins.q_in) annotation(Line(points = {{-12, 88}, {2, 88}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmPressure.pressure, division1.u1) annotation(Line(points = {{-84, 39.6}, {-88, 39.6}, {-88, 40}, {-76, 40}, {-76, 38.4}, {-68.8, 38.4}}, color = {0, 0, 127}));
    connect(effect1.u, division1.y) annotation(Line(points = {{-44, 32}, {-52, 32}, {-52, 36}, {-59.6, 36}}, color = {0, 0, 127}));
    connect(effect2.y, effect3.yBase) annotation(Line(points = {{60, 46}, {60, 36}}, color = {0, 0, 127}));
    connect(effect3.y, leftHeart.solutionFlow) annotation(Line(points = {{60, 30}, {60, 23}, {60, 23}}, color = {0, 0, 127}));
    connect(division2.y, effect3.u) annotation(Line(points = {{36.4, 34}, {44, 34}, {44, 34}, {52, 34}}, color = {0, 0, 127}));
    connect(volumeFlowRate.y, effect2.yBase) annotation(Line(points = {{56.75, 68}, {58, 68}, {58, 62}, {60, 62}, {60, 52}}, color = {0, 0, 127}));
    connect(pressureMeasure2.q_in, leftHeart.q_in) annotation(Line(points = {{-3, 40.4}, {-16, 40.4}, {-16, 16}, {50, 16}}, color = {0, 0, 0}, thickness = 1));
    connect(pressureMeasure2.pressure, division2.u1) annotation(Line(points = {{2, 41.6}, {24, 41.6}, {24, 34}, {24, 36.4}, {27.2, 36.4}}, color = {0, 0, 127}));
    connect(normalPulmonarzVeinsPressure.y, division2.u2) annotation(Line(points = {{14.5, 28}, {16, 28}, {16, 26}, {20, 26}, {20, 31.6}, {27.2, 31.6}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end CVSReg;

  model O2Reg
    Physiolibrary.Chemical.Components.Substance veins(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{-78, -22}, {-58, -2}})));
    Physiolibrary.Chemical.Components.Substance arteries(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{54, -24}, {74, -4}})));
    Physiolibrary.Chemical.Components.SolutePump tissuesFlow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {8, -56})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage tissues(concentration = 1) annotation(Placement(transformation(extent = {{-40, -90}, {-20, -70}})));
    Physiolibrary.Chemical.Components.Stream tissuesStream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {30, -36})));
    Physiolibrary.Chemical.Components.Stream lungsOutstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {36, 26})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst bloodFlow(k = 9.1666666666667e-05) annotation(Placement(transformation(extent = {{-114, 34}, {-70, 54}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst tissuesFlowRate(k = 0.0003) annotation(Placement(transformation(extent = {{-22, -10}, {22, 10}}, rotation = 180, origin = {70, -80})));
    Physiolibrary.Chemical.Components.SolutePump lungsOutflow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {6, 62})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage alveolSpace(concentration = 1, useConcentrationInput = false) annotation(Placement(transformation(extent = {{-78, 68}, {-50, 96}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst LungsFlowRateConst(k = 0.0007) annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {62, 68})));
    Physiolibrary.Types.Constants.VolumeConst VenVolume(k = 0.0035) annotation(Placement(transformation(extent = {{-106, -14}, {-88, 0}})));
    Physiolibrary.Types.Constants.VolumeConst ArtVolume(k = 0.0015) annotation(Placement(transformation(extent = {{26, -16}, {44, -2}})));
    Physiolibrary.Chemical.Components.Stream lungsInstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-48, 22})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage lugsln(concentration = 1, useConcentrationInput = false) annotation(Placement(transformation(extent = {{-8, 12}, {-26, 32}})));
  equation
    connect(arteries.q_out, tissuesStream.q_in) annotation(Line(points = {{64, -14}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(tissuesStream.q_out, tissuesFlow.q_in) annotation(Line(points = {{20, -36}, {8, -36}, {8, -46}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(tissuesFlow.q_out, tissues.q_out) annotation(Line(points = {{8, -66}, {8, -80}, {-20, -80}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_out, tissuesStream.q_out) annotation(Line(points = {{-68, -12}, {-68, -36}, {20, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutstream.q_out, tissuesStream.q_in) annotation(Line(points = {{46, 26}, {64, 26}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(bloodFlow.y, lungsOutstream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {36, 44}, {36, 33}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(bloodFlow.y, tissuesStream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {12, 44}, {12, -29}, {30, -29}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(tissuesFlowRate.y, tissuesFlow.soluteFlow) annotation(Line(points = {{42.5, -80}, {22, -80}, {22, -60}, {12, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsOutflow.q_out, lungsOutstream.q_in) annotation(Line(points = {{6, 52}, {6, 26}, {26, 26}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(alveolSpace.q_out, lungsOutflow.q_in) annotation(Line(points = {{-50, 82}, {6, 82}, {6, 72}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutflow.soluteFlow, LungsFlowRateConst.y) annotation(Line(points = {{10, 58}, {20, 58}, {20, 68}, {37, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(VenVolume.y, veins.solutionVolume) annotation(Line(points = {{-85.75, -7}, {-70, -7}, {-70, -8}, {-72, -8}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(ArtVolume.y, arteries.solutionVolume) annotation(Line(points = {{46.25, -9}, {51.125, -9}, {51.125, -10}, {60, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsInstream.q_in, veins.q_out) annotation(Line(points = {{-58, 22}, {-68, 22}, {-68, -12}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsInstream.q_out, lugsln.q_out) annotation(Line(points = {{-38, 22}, {-36, 22}, {-26, 22}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsInstream.solutionFlow, bloodFlow.y) annotation(Line(points = {{-48, 29}, {-48, 44}, {-64.5, 44}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end O2Reg;

  model CO2
    Physiolibrary.Chemical.Components.Substance veins(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{-78, -22}, {-58, -2}})));
    Physiolibrary.Chemical.Components.Substance arteries(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{54, -24}, {74, -4}})));
    Physiolibrary.Chemical.Components.SolutePump tissuesFlow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {8, -56})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage tissues(concentration = 1, Conc = 1) annotation(Placement(transformation(extent = {{-40, -90}, {-20, -70}})));
    Physiolibrary.Chemical.Components.Stream tissuesStream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {30, -36})));
    Physiolibrary.Chemical.Components.Stream lungsOutstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {36, 26})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst bloodFlow(k = 9.1666666666667e-05) annotation(Placement(transformation(extent = {{-114, 34}, {-70, 54}})));
    Physiolibrary.Chemical.Components.SolutePump lungsOutflow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {6, 62})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage alveolSpace(concentration = 1, useConcentrationInput = false) annotation(Placement(transformation(extent = {{-78, 68}, {-50, 96}})));
    Physiolibrary.Types.Constants.VolumeConst VenVolume(k = 0.0035) annotation(Placement(transformation(extent = {{-106, -14}, {-88, 0}})));
    Physiolibrary.Types.Constants.VolumeConst ArtVolume(k = 0.0015) annotation(Placement(transformation(extent = {{26, -16}, {44, -2}})));
    Physiolibrary.Chemical.Components.Stream lungsInstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-44, 26})));
    Physiolibrary.Types.Constants.MolarFlowRateConst LungsFlowRateConst(k = 0.0007) annotation(Placement(visible = true, transformation(origin = {52, 79}, extent = {{-10, -9}, {10, 9}}, rotation = 180)));
    Physiolibrary.Types.Constants.MolarFlowRateConst tissuesFlowRate(k = 0.0003) annotation(Placement(visible = true, transformation(origin = {56, -82}, extent = {{-8, -8}, {8, 8}}, rotation = 180)));
  equation
    connect(tissuesFlowRate.y, tissuesFlow.soluteFlow) annotation(Line(points = {{46, -82}, {22, -82}, {22, -52}, {12, -52}}, color = {0, 0, 127}));
    connect(lungsOutflow.soluteFlow, LungsFlowRateConst.y) annotation(Line(points = {{10, 66}, {20, 66}, {20, 79}, {39.5, 79}}, color = {0, 0, 127}));
    connect(arteries.q_out, tissuesStream.q_in) annotation(Line(points = {{64, -14}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_out, tissuesStream.q_out) annotation(Line(points = {{-68, -12}, {-68, -36}, {20, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutstream.q_out, tissuesStream.q_in) annotation(Line(points = {{46, 26}, {64, 26}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(bloodFlow.y, lungsOutstream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {36, 44}, {36, 33}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(bloodFlow.y, tissuesStream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {12, 44}, {12, -29}, {30, -29}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(VenVolume.y, veins.solutionVolume) annotation(Line(points = {{-85.75, -7}, {-70, -7}, {-70, -8}, {-72, -8}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(ArtVolume.y, arteries.solutionVolume) annotation(Line(points = {{46.25, -9}, {51.125, -9}, {51.125, -10}, {60, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsInstream.q_in, veins.q_out) annotation(Line(points = {{-54, 26}, {-68, 26}, {-68, -12}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsInstream.solutionFlow, bloodFlow.y) annotation(Line(points = {{-44, 33}, {-44, 44}, {-64.5, 44}}, color = {0, 0, 127}));
    connect(lungsInstream.q_out, lungsOutstream.q_in) annotation(Line(points = {{-34, 26}, {-34, 26}, {26, 26}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsOutflow.q_in, lungsOutstream.q_in) annotation(Line(points = {{6, 52}, {6, 26}, {26, 26}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsOutflow.q_out, alveolSpace.q_out) annotation(Line(points = {{6, 72}, {4, 72}, {4, 78}, {-50, 78}, {-50, 82}}, color = {107, 45, 134}, thickness = 1));
    connect(tissuesFlow.q_in, tissues.q_out) annotation(Line(points = {{8, -66}, {8, -66}, {8, -84}, {-20, -84}, {-20, -80}}, color = {107, 45, 134}, thickness = 1));
    connect(tissuesFlow.q_out, tissuesStream.q_out) annotation(Line(points = {{8, -46}, {8, -36}, {20, -36}}, color = {107, 45, 134}, thickness = 1));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end CO2;

  model CO2Reg
    Physiolibrary.Chemical.Components.Substance veins(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{-78, -22}, {-58, -2}})));
    Physiolibrary.Chemical.Components.Substance arteries(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{54, -24}, {74, -4}})));
    Physiolibrary.Chemical.Components.SolutePump tissuesFlow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {8, -56})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage tissues(concentration = 1, Conc = 1) annotation(Placement(transformation(extent = {{-40, -90}, {-20, -70}})));
    Physiolibrary.Chemical.Components.Stream tissuesStream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {30, -36})));
    Physiolibrary.Chemical.Components.Stream lungsOutstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {36, 26})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst bloodFlow(k = 9.1666666666667e-05) annotation(Placement(transformation(extent = {{-114, 34}, {-70, 54}})));
    Physiolibrary.Chemical.Components.SolutePump lungsOutflow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {6, 62})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage alveolSpace(concentration = 1, useConcentrationInput = false, Conc = 1) annotation(Placement(transformation(extent = {{-78, 68}, {-50, 96}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst LungsFlowRateConst(k = 0.0003) annotation(Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 180, origin = {85, 95})));
    Physiolibrary.Types.Constants.VolumeConst VenVolume(k = 0.0035) annotation(Placement(transformation(extent = {{-106, -14}, {-88, 0}})));
    Physiolibrary.Types.Constants.VolumeConst ArtVolume(k = 0.0015) annotation(Placement(transformation(extent = {{26, -16}, {44, -2}})));
    Physiolibrary.Chemical.Components.Stream lungsInstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-44, 26})));
    Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {58, 60}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
    Physiolibrary.Blocks.Factors.Normalization effect1 annotation(Placement(visible = true, transformation(origin = {38, 82}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Physiolibrary.Types.Constants.ConcentrationConst normalConcentration(k(displayUnit = "mmol/l") = 8.2) annotation(Placement(transformation(extent = {{88, 48}, {80, 56}})));
    Physiolibrary.Chemical.Sensors.ConcentrationMeasure concentrationMeasure annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {86, 16})));
    Modelica.Blocks.Sources.Step step1(height = 0.0005, offset = 0.0003, startTime = 500) annotation(Placement(visible = true, transformation(origin = {62, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  equation
    connect(step1.y, tissuesFlow.soluteFlow) annotation(Line(points = {{51, -66}, {22, -66}, {22, -52}, {12, -52}, {12, -52}}, color = {0, 0, 127}));
    connect(arteries.q_out, tissuesStream.q_in) annotation(Line(points = {{64, -14}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_out, tissuesStream.q_out) annotation(Line(points = {{-68, -12}, {-68, -36}, {20, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutstream.q_out, tissuesStream.q_in) annotation(Line(points = {{46, 26}, {64, 26}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(bloodFlow.y, lungsOutstream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {36, 44}, {36, 33}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(bloodFlow.y, tissuesStream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {12, 44}, {12, -29}, {30, -29}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(VenVolume.y, veins.solutionVolume) annotation(Line(points = {{-85.75, -7}, {-70, -7}, {-70, -8}, {-72, -8}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(ArtVolume.y, arteries.solutionVolume) annotation(Line(points = {{46.25, -9}, {51.125, -9}, {51.125, -10}, {60, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsInstream.q_in, veins.q_out) annotation(Line(points = {{-54, 26}, {-68, 26}, {-68, -12}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsInstream.solutionFlow, bloodFlow.y) annotation(Line(points = {{-44, 33}, {-44, 44}, {-64.5, 44}}, color = {0, 0, 127}));
    connect(lungsInstream.q_out, lungsOutstream.q_in) annotation(Line(points = {{-34, 26}, {-34, 26}, {26, 26}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsOutflow.q_in, lungsOutstream.q_in) annotation(Line(points = {{6, 52}, {6, 26}, {26, 26}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsOutflow.q_out, alveolSpace.q_out) annotation(Line(points = {{6, 72}, {4, 72}, {4, 78}, {-50, 78}, {-50, 82}}, color = {107, 45, 134}, thickness = 1));
    connect(tissuesFlow.q_in, tissues.q_out) annotation(Line(points = {{8, -66}, {8, -66}, {8, -84}, {-20, -84}, {-20, -80}}, color = {107, 45, 134}, thickness = 1));
    connect(tissuesFlow.q_out, tissuesStream.q_out) annotation(Line(points = {{8, -46}, {8, -36}, {20, -36}}, color = {107, 45, 134}, thickness = 1));
    connect(effect1.y, lungsOutflow.soluteFlow) annotation(Line(points = {{38, 78}, {38, 78}, {38, 68}, {10, 68}, {10, 66}}, color = {0, 0, 127}));
    connect(effect1.yBase, LungsFlowRateConst.y) annotation(Line(points = {{38, 84}, {40, 84}, {40, 94}, {40, 95}, {76.25, 95}}, color = {0, 0, 127}));
    connect(effect1.u, division1.y) annotation(Line(points = {{46, 82}, {46, 82}, {46, 74}, {46, 60}, {51.4, 60}}, color = {0, 0, 127}));
    connect(normalConcentration.y, division1.u2) annotation(Line(points = {{79, 52}, {65.2, 52}, {65.2, 56.4}}, color = {0, 0, 127}));
    connect(concentrationMeasure.q_in, arteries.q_out) annotation(Line(points = {{86, 16}, {86, 16}, {86, -6}, {86, -12}, {64, -12}, {64, -14}}, color = {107, 45, 134}, thickness = 1));
    connect(concentrationMeasure.concentration, division1.u1) annotation(Line(points = {{86, 24}, {88, 24}, {88, 38}, {96, 38}, {96, 63.6}, {65.2, 63.6}}, color = {0, 0, 127}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end CO2Reg;

  model CO2RegBUS
    Physiolibrary.Chemical.Components.Substance veins(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{-78, -22}, {-58, -2}})));
    Physiolibrary.Chemical.Components.Substance arteries(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{54, -24}, {74, -4}})));
    Physiolibrary.Chemical.Components.SolutePump tissuesFlow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {8, -56})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage tissues(concentration = 1) annotation(Placement(transformation(extent = {{-40, -90}, {-20, -70}})));
    Physiolibrary.Chemical.Components.Stream tissuesStream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {30, -36})));
    Physiolibrary.Chemical.Components.Stream lungsOutstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {36, 26})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst bloodFlow(k = 9.1666666666667e-05) annotation(Placement(transformation(extent = {{-114, 34}, {-70, 54}})));
    Physiolibrary.Chemical.Components.SolutePump lungsOutflow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {6, 62})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage alveolSpace(concentration = 1, useConcentrationInput = false) annotation(Placement(transformation(extent = {{-78, 68}, {-50, 96}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst LungsFlowRateConst(k = 0.0007) annotation(Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 180, origin = {85, 93})));
    Physiolibrary.Chemical.Components.Stream lungsInstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-44, 26})));
    Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {58, 60}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
    Physiolibrary.Blocks.Factors.Normalization effect1 annotation(Placement(visible = true, transformation(origin = {38, 82}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Physiolibrary.Types.Constants.ConcentrationConst normalConcentration(k(displayUnit = "mmol/l") = 8.2) annotation(Placement(transformation(extent = {{88, 48}, {80, 56}})));
    Physiolibrary.Chemical.Sensors.ConcentrationMeasure concentrationMeasure annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {86, 16})));
    Modelica.Blocks.Sources.Step step(height = 0.0005, offset = 18, startTime = 1) annotation(Placement(transformation(extent = {{56, -76}, {36, -56}})));
    Physiolibrary.Types.BusConnector busConnector annotation(Placement(transformation(extent = {{-88, -94}, {-48, -54}})));
  equation
    connect(arteries.q_out, tissuesStream.q_in) annotation(Line(points = {{64, -14}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_out, tissuesStream.q_out) annotation(Line(points = {{-68, -12}, {-68, -36}, {20, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutstream.q_out, tissuesStream.q_in) annotation(Line(points = {{46, 26}, {64, 26}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(bloodFlow.y, lungsOutstream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {36, 44}, {36, 33}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(bloodFlow.y, tissuesStream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {12, 44}, {12, -29}, {30, -29}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsInstream.q_in, veins.q_out) annotation(Line(points = {{-54, 26}, {-68, 26}, {-68, -12}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsInstream.solutionFlow, bloodFlow.y) annotation(Line(points = {{-44, 33}, {-44, 44}, {-64.5, 44}}, color = {0, 0, 127}));
    connect(lungsInstream.q_out, lungsOutstream.q_in) annotation(Line(points = {{-34, 26}, {-34, 26}, {26, 26}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsOutflow.q_in, lungsOutstream.q_in) annotation(Line(points = {{6, 52}, {6, 26}, {26, 26}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsOutflow.q_out, alveolSpace.q_out) annotation(Line(points = {{6, 72}, {4, 72}, {4, 78}, {-50, 78}, {-50, 82}}, color = {107, 45, 134}, thickness = 1));
    connect(tissuesFlow.q_in, tissues.q_out) annotation(Line(points = {{8, -66}, {8, -66}, {8, -84}, {-20, -84}, {-20, -80}}, color = {107, 45, 134}, thickness = 1));
    connect(tissuesFlow.q_out, tissuesStream.q_out) annotation(Line(points = {{8, -46}, {8, -36}, {20, -36}}, color = {107, 45, 134}, thickness = 1));
    connect(effect1.y, lungsOutflow.soluteFlow) annotation(Line(points = {{38, 78}, {38, 78}, {38, 68}, {10, 68}, {10, 66}}, color = {0, 0, 127}));
    connect(effect1.yBase, LungsFlowRateConst.y) annotation(Line(points = {{38, 84}, {40, 84}, {40, 94}, {40, 93}, {76.25, 93}}, color = {0, 0, 127}));
    connect(effect1.u, division1.y) annotation(Line(points = {{46, 82}, {46, 82}, {46, 74}, {46, 60}, {51.4, 60}}, color = {0, 0, 127}));
    connect(normalConcentration.y, division1.u2) annotation(Line(points = {{79, 52}, {65.2, 52}, {65.2, 56.4}}, color = {0, 0, 127}));
    connect(concentrationMeasure.q_in, arteries.q_out) annotation(Line(points = {{86, 16}, {86, 16}, {86, -6}, {86, -12}, {64, -12}, {64, -14}}, color = {107, 45, 134}, thickness = 1));
    connect(concentrationMeasure.concentration, division1.u1) annotation(Line(points = {{86, 24}, {88, 24}, {88, 38}, {96, 38}, {96, 63.6}, {65.2, 63.6}}, color = {0, 0, 127}));
    connect(step.y, tissuesFlow.soluteFlow) annotation(Line(points = {{35, -66}, {32, -66}, {32, -64}, {12, -64}, {12, -52}}, color = {0, 0, 127}));
    connect(veins.solutionVolume, busConnector.veinsVolume) annotation(Line(points = {{-72, -8}, {-92, -8}, {-92, -74}, {-68, -74}}, color = {0, 0, 127}), Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
    connect(arteries.solutionVolume, busConnector.arterialVolume) annotation(Line(points = {{60, -10}, {58, -10}, {58, -8}, {-40, -8}, {-40, -54}, {-56, -54}, {-56, -74}, {-68, -74}}, color = {0, 0, 127}), Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
    connect(division1.y, busConnector.bloodFlowFactor) annotation(Line(points = {{51.4, 60}, {20, 60}, {20, 32}, {-24, 32}, {-24, -46}, {-68, -46}, {-68, -74}}, color = {0, 0, 127}), Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end CO2RegBUS;

  model CVSRegBUS
    Physiolibrary.Hydraulic.Components.ElasticVessel arteries(ZeroPressureVolume = 0, volume_start = 0.001, Compliance = 7.5006157584566e-08) annotation(Placement(transformation(extent = {{44, -60}, {64, -40}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel veins(ZeroPressureVolume = 0, volume_start = 0.0035, Compliance = 1.3126077577299e-05) annotation(Placement(transformation(extent = {{-100, -60}, {-80, -40}})));
    Physiolibrary.Hydraulic.Components.Conductor peripheral(Conductance = 7.1430864073035e-09) annotation(Placement(transformation(extent = {{-26, -60}, {-6, -40}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(ZeroPressureVolume = 0, volume_start = 0.0004, Compliance = 6.0004926067653e-07) annotation(Placement(transformation(extent = {{-8, 78}, {12, 98}})));
    Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(ZeroPressureVolume = 0, volume_start = 0.0001, Compliance = 5.0029107108905e-08) annotation(Placement(transformation(extent = {{-58, 78}, {-38, 98}})));
    Physiolibrary.Hydraulic.Components.Conductor pulmonary(Conductance = 6.9838233326989e-08) annotation(Placement(transformation(extent = {{-32, 78}, {-12, 98}})));
    Physiolibrary.Types.Constants.PressureConst normalSystemicVeinsPressure(k = 266.64477483) annotation(Placement(visible = true, transformation(origin = {-51, -4}, extent = {{13, -6}, {-13, 6}}, rotation = 0)));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate1(k = 9.1666666666667e-05) annotation(Placement(visible = true, transformation(origin = {-66, 57}, extent = {{-14, -5}, {14, 5}}, rotation = 0)));
    Physiolibrary.Hydraulic.Sensors.PressureMeasure pulmPressure annotation(Placement(visible = true, transformation(origin = {-87, 42}, extent = {{-5, -6}, {5, 6}}, rotation = 0)));
    Physiolibrary.Types.Constants.PressureConst normalPulmonarzVeinsPressure(k = 666.611937075) annotation(Placement(visible = true, transformation(origin = {2, 28}, extent = {{-10, -4}, {10, 4}}, rotation = 0)));
    Physiolibrary.Hydraulic.Components.Pump leftHeart(useSolutionFlowInput = true) annotation(Placement(visible = true, transformation(extent = {{50, 6}, {70, 26}}, rotation = 0)));
    Physiolibrary.Hydraulic.Components.Pump rightHeart(useSolutionFlowInput = true) annotation(Placement(visible = true, transformation(extent = {{-46, 2}, {-26, 22}}, rotation = 0)));
    Physiolibrary.Blocks.Factors.Normalization effect1 annotation(Placement(visible = true, transformation(origin = {-36, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Division division2 annotation(Placement(visible = true, transformation(origin = {32, 34}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
    Physiolibrary.Blocks.Factors.Normalization effect3 annotation(Placement(visible = true, transformation(origin = {60, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Physiolibrary.Blocks.Factors.Normalization effect2 annotation(Placement(visible = true, transformation(origin = {60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k = 9.1666666666667e-05) annotation(Placement(visible = true, transformation(origin = {43, 68}, extent = {{-11, -4}, {11, 4}}, rotation = 0)));
    Modelica.Blocks.Math.Division division1 annotation(Placement(visible = true, transformation(origin = {-64, 36}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
    Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure2 annotation(Placement(visible = true, transformation(origin = {-1, 44}, extent = {{-5, -6}, {5, 6}}, rotation = 0)));
    Physiolibrary.Types.BusConnector busConnector annotation(Placement(transformation(extent = {{-20, -38}, {20, 2}})));
  equation
    connect(normalSystemicVeinsPressure.y, division1.u2) annotation(Line(points = {{-67.25, -4}, {-78, -4}, {-78, 34}, {-70, 34}, {-70, 33.6}, {-68.8, 33.6}}, color = {0, 0, 127}));
    connect(rightHeart.solutionFlow, effect1.y) annotation(Line(points = {{-36, 19}, {-36, 19}, {-36, 28}}, color = {0, 0, 127}));
    connect(volumeFlowRate1.y, effect1.yBase) annotation(Line(points = {{-48.5, 57}, {-36, 57}, {-36, 48}, {-36, 34}}, color = {0, 0, 127}));
    connect(pulmPressure.q_in, veins.q_in) annotation(Line(points = {{-89, 38.4}, {-90, 38.4}, {-90, -50}}));
    connect(rightHeart.q_out, pulmonaryArteries.q_in) annotation(Line(points = {{-26, 12}, {-26, 68}, {-68, 68}, {-68, 88}, {-48, 88}}, thickness = 1));
    connect(veins.q_in, rightHeart.q_in) annotation(Line(points = {{-90, -50}, {-90, 12}, {-46, 12}}, thickness = 1));
    connect(leftHeart.q_out, arteries.q_in) annotation(Line(points = {{70, 16}, {70, -16}, {54, -16}, {54, -50}}, thickness = 1));
    connect(pulmonaryVeins.q_in, leftHeart.q_in) annotation(Line(points = {{2, 88}, {28, 88}, {28, 68}, {-16, 68}, {-16, 16}, {50, 16}}, thickness = 1));
    connect(veins.q_in, peripheral.q_in) annotation(Line(points = {{-90, -50}, {-26, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(peripheral.q_out, arteries.q_in) annotation(Line(points = {{-6, -50}, {54, -50}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonaryArteries.q_in, pulmonary.q_in) annotation(Line(points = {{-48, 88}, {-32, 88}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmonary.q_out, pulmonaryVeins.q_in) annotation(Line(points = {{-12, 88}, {2, 88}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(pulmPressure.pressure, division1.u1) annotation(Line(points = {{-84, 39.6}, {-88, 39.6}, {-88, 40}, {-76, 40}, {-76, 38.4}, {-68.8, 38.4}}, color = {0, 0, 127}));
    connect(effect1.u, division1.y) annotation(Line(points = {{-44, 32}, {-52, 32}, {-52, 36}, {-59.6, 36}}, color = {0, 0, 127}));
    connect(effect2.y, effect3.yBase) annotation(Line(points = {{60, 46}, {60, 36}}, color = {0, 0, 127}));
    connect(effect3.y, leftHeart.solutionFlow) annotation(Line(points = {{60, 30}, {60, 23}, {60, 23}}, color = {0, 0, 127}));
    connect(division2.y, effect3.u) annotation(Line(points = {{36.4, 34}, {44, 34}, {44, 34}, {52, 34}}, color = {0, 0, 127}));
    connect(volumeFlowRate.y, effect2.yBase) annotation(Line(points = {{56.75, 68}, {58, 68}, {58, 62}, {60, 62}, {60, 52}}, color = {0, 0, 127}));
    connect(pressureMeasure2.q_in, leftHeart.q_in) annotation(Line(points = {{-3, 40.4}, {-16, 40.4}, {-16, 16}, {50, 16}}, color = {0, 0, 0}, thickness = 1));
    connect(pressureMeasure2.pressure, division2.u1) annotation(Line(points = {{2, 41.6}, {24, 41.6}, {24, 34}, {24, 36.4}, {27.2, 36.4}}, color = {0, 0, 127}));
    connect(normalPulmonarzVeinsPressure.y, division2.u2) annotation(Line(points = {{14.5, 28}, {16, 28}, {16, 26}, {20, 26}, {20, 31.6}, {27.2, 31.6}}, color = {0, 0, 127}));
    connect(busConnector.veinsVolume, veins.volume) annotation(Line(points = {{0, -18}, {-4, -18}, {-4, -74}, {-84, -74}, {-84, -60}}, color = {0, 0, 255}, thickness = 0.5), Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}));
    connect(arteries.volume, busConnector.arterialVolume) annotation(Line(points = {{60, -60}, {54, -60}, {54, -78}, {0, -78}, {0, -18}}, color = {0, 0, 127}), Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
    connect(busConnector.bloodFlowFactor, effect2.u) annotation(Line(points = {{0, -18}, {36, -18}, {36, 50}, {52, 50}}, color = {0, 0, 255}, thickness = 0.5), Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end CVSRegBUS;

  model O2RegBUS
    Physiolibrary.Chemical.Components.Substance veins(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{-78, -22}, {-58, -2}})));
    Physiolibrary.Chemical.Components.Substance arteries(solute_start = 0.02, useNormalizedVolume = false) annotation(Placement(transformation(extent = {{54, -24}, {74, -4}})));
    Physiolibrary.Chemical.Components.SolutePump tissuesFlow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {8, -56})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage tissues(concentration = 1) annotation(Placement(transformation(extent = {{-40, -90}, {-20, -70}})));
    Physiolibrary.Chemical.Components.Stream tissuesStream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {30, -36})));
    Physiolibrary.Chemical.Components.Stream lungsOutstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {36, 26})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst bloodFlow(k = 9.1666666666667e-05) annotation(Placement(transformation(extent = {{-114, 34}, {-70, 54}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst tissuesFlowRate(k = 0.0003) annotation(Placement(transformation(extent = {{-22, -10}, {22, 10}}, rotation = 180, origin = {70, -80})));
    Physiolibrary.Chemical.Components.SolutePump lungsOutflow(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {6, 62})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage alveolSpace(concentration = 1, useConcentrationInput = false) annotation(Placement(transformation(extent = {{-78, 68}, {-50, 96}})));
    Physiolibrary.Types.Constants.MolarFlowRateConst LungsFlowRateConst(k = 0.0007) annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {62, 68})));
    Physiolibrary.Chemical.Components.Stream lungsInstream(useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-48, 22})));
    Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage lugsln(concentration = 1, useConcentrationInput = false) annotation(Placement(transformation(extent = {{-8, 12}, {-26, 32}})));
    Physiolibrary.Types.BusConnector busConnector annotation(Placement(transformation(extent = {{-78, -88}, {-38, -48}})));
  equation
    connect(arteries.q_out, tissuesStream.q_in) annotation(Line(points = {{64, -14}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(tissuesStream.q_out, tissuesFlow.q_in) annotation(Line(points = {{20, -36}, {8, -36}, {8, -46}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(tissuesFlow.q_out, tissues.q_out) annotation(Line(points = {{8, -66}, {8, -80}, {-20, -80}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(veins.q_out, tissuesStream.q_out) annotation(Line(points = {{-68, -12}, {-68, -36}, {20, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutstream.q_out, tissuesStream.q_in) annotation(Line(points = {{46, 26}, {64, 26}, {64, -36}, {40, -36}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(bloodFlow.y, lungsOutstream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {36, 44}, {36, 33}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(bloodFlow.y, tissuesStream.solutionFlow) annotation(Line(points = {{-64.5, 44}, {12, 44}, {12, -29}, {30, -29}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(tissuesFlowRate.y, tissuesFlow.soluteFlow) annotation(Line(points = {{42.5, -80}, {22, -80}, {22, -60}, {12, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsOutflow.q_out, lungsOutstream.q_in) annotation(Line(points = {{6, 52}, {6, 26}, {26, 26}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(alveolSpace.q_out, lungsOutflow.q_in) annotation(Line(points = {{-50, 82}, {6, 82}, {6, 72}}, color = {200, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(lungsOutflow.soluteFlow, LungsFlowRateConst.y) annotation(Line(points = {{10, 58}, {20, 58}, {20, 68}, {37, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
    connect(lungsInstream.q_in, veins.q_out) annotation(Line(points = {{-58, 22}, {-68, 22}, {-68, -12}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsInstream.q_out, lugsln.q_out) annotation(Line(points = {{-38, 22}, {-36, 22}, {-26, 22}}, color = {107, 45, 134}, thickness = 1));
    connect(lungsInstream.solutionFlow, bloodFlow.y) annotation(Line(points = {{-48, 29}, {-48, 44}, {-64.5, 44}}, color = {0, 0, 127}));
    connect(busConnector.veinsVolume, veins.solutionVolume) annotation(Line(points = {{-58, -68}, {-74, -68}, {-74, -30}, {-94, -30}, {-94, -8}, {-72, -8}}, color = {0, 0, 255}, thickness = 0.5), Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}));
    connect(busConnector.arterialVolume, arteries.solutionVolume) annotation(Line(points = {{-58, -68}, {-58, -26}, {-18, -26}, {-18, -10}, {60, -10}}, color = {0, 0, 255}, thickness = 0.5), Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end O2RegBUS;

  model allSystem
    CO2RegBUS cO2RegBUS annotation(Placement(transformation(extent = {{-28, 0}, {-8, 20}})));
    CVSRegBUS cVSRegBUS annotation(Placement(transformation(extent = {{6, 50}, {26, 70}})));
    O2RegBUS o2RegBUS annotation(Placement(transformation(extent = {{-70, 52}, {-50, 72}})));
  equation
    connect(o2RegBUS.busConnector, cO2RegBUS.busConnector) annotation(Line(points = {{-65.8, 55.2}, {-65.8, 2.6}, {-24.8, 2.6}}, color = {0, 0, 255}, thickness = 0.5));
    connect(cO2RegBUS.busConnector, cVSRegBUS.busConnector) annotation(Line(points = {{-24.8, 2.6}, {16.4, 2.6}, {16.4, 58.2}}, color = {0, 0, 255}, thickness = 0.5));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false)), Diagram(coordinateSystem(preserveAspectRatio = false)));
  end allSystem;

  model testPar
    Physiolibrary.Types.BusConnector busConnector annotation(Placement(transformation(extent = {{40, -6}, {80, 34}})));
    Modelica.Blocks.Sources.Constant const(k = 1) annotation(Placement(transformation(extent = {{-58, 0}, {-38, 20}})));
  equation
    connect(const.y, busConnector.bloodFlowFactor) annotation(Line(points = {{-37, 10}, {-6, 10}, {-6, 14}, {60, 14}, {60, 14}}, color = {0, 0, 127}), Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false)), Diagram(coordinateSystem(preserveAspectRatio = false)));
  end testPar;

  model subsystemTest
    testPar testPar1 annotation(Placement(transformation(extent = {{50, 12}, {70, 32}})));
    CVSRegBUS cVSRegBUS annotation(Placement(transformation(extent = {{-54, 18}, {-34, 38}})));
  equation
    connect(cVSRegBUS.busConnector, testPar1.busConnector) annotation(Line(points = {{-43.6, 26.2}, {66, 26.2}, {66, 23.4}}, color = {0, 0, 255}, thickness = 0.5));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false)), Diagram(coordinateSystem(preserveAspectRatio = false)));
  end subsystemTest;
  annotation(uses(Physiolibrary(version = "2.3.1"), Modelica(version = "3.2.1")), version = "1", conversion(from(version = "", script = "ConvertFromMinPhyslib_.mos")));
end MinPhyslib;