\name{XYcoords2LinesColumns}
\alias{XYcoords2LinesColumns}
\title{XYcoords2LinesColumns(X,Y) Converts points given as x(i),y(i) coordinates
to integer coordinates Columns(i),Lines(i)}
\arguments{
\item{X}{[1:n] first coordinate: x(i), y(i) is the i-th point on a plane}
\item{Y}{[1:n] second coordinate: x(i), y(i) is the i-th point on a plane}
\item{minNeurons}{minimal size of the corresponding grid i.e
max(Lines)*max(Columns)>=MinGridSize , default MinGridSize = 4096 defined by the
numer of neurons}
\item{MaxDifferentPoints}{TRUE: the discretization error is minimal FALSE:
number of Lines and Columns is minimal}
\item{PlotIt}{Plots the result}
\item{na.rm}{if non finite values should be disregarded in the computation then set to TRUE}

}
\value{GridConvertedPoints[1:Columns,1:Lines,2]  IntegerPositions on a grid
corresponding to x,y}
\description{
XYcoords2LinesColumns(X,Y) Converts points given as x(i),y(i) coordinates to
integer coordinates Columns(i),Lines(i)
}
\details{
Non finite values are not filtered out even if na.rm=TRUE, only ignored. Details are written down in [Thrun, 2018, p. 47].
}

\author{
Michael Thrun}
\examples{
data("Chainlink")
Data=Chainlink$Data
InputDistances=as.matrix(dist(Data))
res=cmdscale(d=InputDistances, k = 2, eig = TRUE, add = FALSE, x.ret = FALSE)
ProjectedPoints=as.matrix(res$points)
GridConvertedPoints=XYcoords2LinesColumns(ProjectedPoints[,1],ProjectedPoints[,2],PlotIt=FALSE)
}
\references{
[Thrun, 2018]  Thrun, M. C.: Projection Based Clustering through Self-Organization and Swarm Intelligence, doctoral dissertation 2017, Springer, Heidelberg, ISBN: 978-3-658-20539-3, \doi{10.1007/978-3-658-20540-9}, 2018. 
}