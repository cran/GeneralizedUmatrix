\name{GeneralizedUmatrix-package}
\alias{GeneralizedUmatrix-package}
\docType{package}
\title{
GeneralizedUmatrix
}
\description{
 Projections from a high dimensional data space onto a two dimensional plane are used to detect structures, such as clusters, in multivariate data. The generalized Umatrix is able to visualize errors of these two-dimensioal scatter plots by using a 3D topographic map.
}
\details{
\tabular{ll}{
Package: \tab GeneralizedUmatrix\cr
Type: \tab Package\cr
Version: \tab 0.9.7\cr
Date: \tab 2018-01-23\cr
License: \tab CC BY-NC-SA 4.0\cr
}

For further details regarding the generalized Umatrix see [Thrun, 2018], chapter 4-5.

If you want to verifiy your clustering result externally, you can use \code{Heatmap} or \code{SilhouettePlot} of the CRAN package \code{DataVisualizations}.

}
\author{
Michal Thrun

Maintainer: Michael Thrun <mthrun@informatik.uni-marburg.de>
}
\references{
[Thrun, 2018]  Thrun, M. C.: Projection Based Clustering through Self-Organization and Swarm Intelligence, doctoral dissertation 2017, Springer, Heidelberg, ISBN: 978-3-658-20539-3, \url{https://doi.org/10.1007/978-3-658-20540-9}, 2018. 

[Ultsch/Thrun, 2017]  Ultsch, A., & Thrun, M. C.: Credible Visualizations for Planar Projections, in Cottrell, M. (Ed.), 12th International Workshop on Self-Organizing Maps and Learning Vector Quantization, Clustering and Data Visualization (WSOM), IEEE Xplore, France, 2017.
}
\examples{
data("Lsun3D")
Data=Lsun3D$Data
Cls=Lsun3D$Cls
InputDistances=as.matrix(dist(Data))
res=cmdscale(d=InputDistances, k = 2, eig = TRUE, add = FALSE, x.ret = FALSE)
ProjectedPoints=as.matrix(res$points)
#see also ProjectionBasedClustering package for other common projection methods
#see DatabionicSwarm for projection method without parameters or objective function
# ProjectedPoints=DatabionicSwarm::Pswarm(Data)$ProjectedPoints
\donttest{
resUmatrix=GeneralizedUmatrix(Data,ProjectedPoints)
plotTopographicMap(resUmatrix$Umatrix,resUmatrix$Bestmatches,Cls)
}
##Interactive Island Generation 
## from a tiled Umatrix (toroidal assumption)
\dontrun{
	Imx = ProjectionBasedClustering::interactiveGeneralizedUmatrixIsland(resUmatrix$Umatrix,
	resUmatrix$Bestmatches)
	plotTopographicMap(resUmatrix$Umatrix,

	resUmatrix$Bestmatches, Imx = Imx)
}
#External Verification
\dontrun{

 DataVisualizations::Heatmap(Data,Cls)
 #if spherical cluster strcuture
 DataVisualizations::SilhouettePlot(Data,Cls)
}

}
\keyword{GeneralizedUmatrix}
\keyword{U-matrix}
\keyword{Umatrix}
\keyword{U-Matrix}
\keyword{Visualization}
\keyword{DimensionalityReduction}