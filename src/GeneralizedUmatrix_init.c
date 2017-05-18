#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .Call calls */
extern SEXP GeneralizedUmatrix_addRowWiseC(SEXP, SEXP);
extern SEXP GeneralizedUmatrix_Delta3DWeightsC(SEXP, SEXP);
extern SEXP GeneralizedUmatrix_trainstepC(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
  {"GeneralizedUmatrix_addRowWiseC",     (DL_FUNC) &GeneralizedUmatrix_addRowWiseC,     2},
  {"GeneralizedUmatrix_Delta3DWeightsC", (DL_FUNC) &GeneralizedUmatrix_Delta3DWeightsC, 2},
  {"GeneralizedUmatrix_trainstepC",      (DL_FUNC) &GeneralizedUmatrix_trainstepC,      8},
  {NULL, NULL, 0}
};

void R_init_GeneralizedUmatrix(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
