#
# GradedCategories: Graded categories
#
# Declarations
#

#! @Chapter The positively Z-graded closure of a category

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#!  The &GAP; category of cells in a positively Z-graded category
#! @Arguments object
DeclareCategory( "IsCellInPositivelyZGradedCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a positively Z-graded category
#! @Arguments object
DeclareCategory( "IsObjectInPositivelyZGradedCategory",
        IsCellInPositivelyZGradedCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a positively Z-graded category
#! @Arguments morphism
DeclareCategory( "IsMorphismInPositivelyZGradedCategory",
        IsCellInPositivelyZGradedCategory and
        IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_GRADED_CATEGORY" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The infinite list underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns a &CAP; category
DeclareAttribute( "UnderlyingInfiniteList",
        IsCellInPositivelyZGradedCategory );

#! @Description
#!  The support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "Support",
        IsObjectInPositivelyZGradedCategory );

#! @Description
#!  The list of degrees of the support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "SupportDegrees",
        IsObjectInPositivelyZGradedCategory );

#! @Description
#!  A list of integers containing the list of degrees of the support of the object <A>c</A>.
#! @Arguments object
#! @Returns a list
DeclareAttribute( "SupportHullDegrees",
        IsObjectInPositivelyZGradedCategory, "mutable" );

#! @Arguments object
#! @Returns a list
#! @Group SupporWithtDegrees
DeclareAttribute( "SupportWithDegrees",
        IsObjectInPositivelyZGradedCategory );

#! @Description
#!  The two argument version is like the first
#!  but only considers the degrees in the given list <A>L</A>.
#! @Arguments object, L
#! @Group SupporWithtDegrees
DeclareOperation( "SupporWithtDegrees",
        [ IsObjectInPositivelyZGradedCategory, IsList ] );

#! @Arguments object
#! @Returns a list
DeclareAttribute( "DecomposedSupportWithDegrees",
        IsObjectInPositivelyZGradedCategory );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the positively $Z$-graded closure of the category <A>A</A>.
#! @Arguments C
#! @Returns a &CAP; category
DeclareAttribute( "PositivelyZGradedCategory",
        IsCapCategory );

#! @Description
#!  
#! @Arguments L, C
#! @Returns a &CAP; object
#! @Group ObjectInPositivelyZGradedCategory
DeclareOperation( "ObjectInPositivelyZGradedCategory",
        [ IsZList, IsCapCategory ] );

#! @Arguments f, lower_bound, upper_bound, C
#! @Group ObjectInPositivelyZGradedCategory
DeclareOperation( "ObjectInPositivelyZGradedCategory",
        [ IsFunction, IsInt, IsAdditiveElement, IsCapCategory ] );

#! @Arguments M, degree
#! @Group ObjectInPositivelyZGradedCategory
DeclareOperation( "ObjectInPositivelyZGradedCategory",
        [ IsCapCategoryObject, IsInt ] );

#! @Arguments M
#! @Group ObjectInPositivelyZGradedCategory
DeclareAttribute( "ObjectInPositivelyZGradedCategory",
        IsSemisimpleCategoryObject );

#! @Arguments L
#! @Group ObjectInPositivelyZGradedCategory
DeclareAttribute( "ObjectInPositivelyZGradedCategory",
        IsList );

#! @Description
#!  
#! @Arguments S, L, T
#! @Returns a &CAP; morphism
#! @Group MorphismInPositivelyZGradedCategory
DeclareOperation( "MorphismInPositivelyZGradedCategory",
        [ IsObjectInPositivelyZGradedCategory, IsZList, IsObjectInPositivelyZGradedCategory ] );

#! @Arguments S, f, T
#! @Group MorphismInPositivelyZGradedCategory
DeclareOperation( "MorphismInPositivelyZGradedCategory",
        [ IsObjectInPositivelyZGradedCategory, IsFunction, IsObjectInPositivelyZGradedCategory ] );

#! @Arguments M, chi, degree, i
#! @Returns a &CAP; morphism
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedCategory, IsObject, IsInt, IsInt ] );

#! @Arguments M, chi, i
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedCategory, IsObject, IsInt ] );

#! @Arguments M, degree
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedCategory, IsInt ] );

#! @Arguments degrees, M
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsList, IsObjectInPositivelyZGradedCategory ] );

#! @Arguments S, M
#! @Group ComponentInclusionMorphism
DeclareOperation( "ComponentInclusionMorphism",
        [ IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory ] );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  The active lower bound of the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns an integer or infinity
DeclareOperation( "ActiveLowerBound",
        [ IsCellInPositivelyZGradedCategory ] );

#! @Description
#!  Set the active lower bound of the cell (=object or morphism) <A>c</A>
#!  to <A>lower_bound</A> if it is greater than the active lower bound,
#!  and return it.
#! @Arguments c, lower_bound
#! @Returns an integer or infinity
DeclareOperation( "SetActiveLowerBound",
        [ IsCellInPositivelyZGradedCategory, IsAdditiveElement ] );

#! @Description
#!  The active upper bound of the cell (=object or morphism) <A>c</A>.
#! @Arguments c
#! @Returns an integer or infinity
DeclareOperation( "ActiveUpperBound",
        [ IsCellInPositivelyZGradedCategory ] );

#! @Description
#!  Set the active upper bound of the cell (=object or morphism) <A>c</A>
#!  to <A>upper_bound</A> if it is less than the active upper bound,
#!  and return it.
#! @Arguments c, upper_bound
#! @Returns an integer or infinity
DeclareOperation( "SetActiveUpperBound",
        [ IsCellInPositivelyZGradedCategory, IsAdditiveElement ] );

#! @Description
#!  Returns the function f: n |-> [ <C>ActiveLowerBound</C>( A ) .. n - <C>ActiveLowerBound</C>( B ) ]
#!  over which to run the tensor product summation  <A>A</A>[i] $\otimes$ <A>B</A>[n - i] ($i \in f(n)$)
#!  for (<A>A</A> $\otimes$ <A>B</A>)[n].
#! @Arguments A, B
#! @Returns a function
DeclareOperation( "TensorProductIndices",
        [ IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory ] );

#! @Description
#!  Returns the function f over which to run the tensor product summation
#!  <A>A</A>[i] $\otimes$ <A>B</A>[j] $\otimes$ <A>C</A>[k] ($[i,j,k] \in f(n)$)
#!  for (<A>A</A> $\otimes$ <A>B</A> $\otimes$ <A>C</A>)[n].
#! @Arguments A, B
#! @Returns a function
DeclareOperation( "TensorProductIndices",
        [ IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory ] );

#! @Description
#!  The <A>i</A>-th object of the infinite list underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c, n
#! @Returns a &CAP; category
DeclareOperation( "[]",
        [ IsCellInPositivelyZGradedCategory, IsInt ] );

#! @Description
#!  The <A>i</A>-th object of the infinite list(s) underlying the cell resp. list  <A>c</A>.
#! @Arguments c, n
#! @Returns a &CAP; category
DeclareOperation( "CertainDegreePart",
        [ IsObject, IsInt ] );

#! @Description
#!  The <A>L</A>-th sublist of the infinite list underlying the cell (=object or morphism) <A>c</A>.
#! @Arguments c, L
#! @Returns a &CAP; category
DeclareOperation( "Sublist",
        [ IsCellInPositivelyZGradedCategory, IsList ] );
