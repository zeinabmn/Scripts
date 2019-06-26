import os
try: paraview.simple
except: from paraview.simple import *
paraview.simple._DisableFirstRenderCameraReset()
direc="./paint_IPA_FM300_SA300_SA240_n50_d250_angle0_HV0_v180_avgAirData_kepsStandard_vy0p5vx0p5/HorizontalPainting/results"
if not os.path.exists(direc):
  os.makedirs(direc)

#
IPAFluid = FindSource("IPAFluid000500.vtu")

SetActiveSource(IPAFluid)

# Create the first P-O-L, set the extremes of the line and then commit to render
PlotOverLine2 = PlotOverLine( Source="High Resolution Line Source" )
DataRepresentation7 = Show()

#tangential direction
idx = 1
for Z in [0.198, 0.19, 0.15, 0.1, 0.05, 0.035, 0.02]:
    PlotOverLine2.Source.Point1 = [-1.0, 0.0, Z]
    PlotOverLine2.Source.Point2 = [1.0, 0.0, Z]

    Render()    
    source = PlotOverLine2
    PlotOverLine2.Source.Resolution = 1000
    name = direc+"/tang" + str(idx) + ".csv" 
    writer = CreateWriter(name, source)
    idx += 1

    writer.FieldAssociation = "Points" # or "Cells"
    writer.UpdatePipeline()
    del writer



#del PlotOverLine2
#del IPAFluid
#del DataRepresentation7

#radial direction

idx = 1
for Z in [0.198, 0.19, 0.15, 0.1, 0.05, 0.035, 0.02]:
    PlotOverLine2.Source.Point1 = [0.0, -1.0, Z]
    PlotOverLine2.Source.Point2 = [0.0, 1.0, Z]

    Render()    
    source = PlotOverLine2
    PlotOverLine2.Source.Resolution = 1000

    name = direc+"/rad" + str(idx) + ".csv" 
    writer = CreateWriter(name, source)
    idx += 1

    writer.FieldAssociation = "Points" # or "Cells"
    writer.UpdatePipeline()
    del writer



#del PlotOverLine2
#del IPAFluid
#del DataRepresentation7

#xy0 


PlotOverLine2.Source.Point1 = [0.0, 0.0, 0.2]
PlotOverLine2.Source.Point2 = [0.0, 0.0, 0.0]

Render()    
source = PlotOverLine2
PlotOverLine2.Source.Resolution = 1000

name = direc+"/xy0.csv" 
writer = CreateWriter(name, source)
    
writer.FieldAssociation = "Points" # or "Cells"
writer.UpdatePipeline()
del writer



del PlotOverLine2
del IPAFluid
del DataRepresentation7
