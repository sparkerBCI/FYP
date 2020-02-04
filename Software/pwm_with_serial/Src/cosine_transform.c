# include <math.h>
# include <stdlib.h>
# include <stdio.h>
# include <time.h>

# include "cosine_transform.h"

/******************************************************************************/

double *r8vec_uniform_01_new ( int n, int *seed )

/******************************************************************************/
/*
  Purpose:

    R8VEC_UNIFORM_01_NEW returns a unit pseudorandom R8VEC.

  Discussion:

    This routine implements the recursion

      seed = 16807 * seed mod ( 2^31 - 1 )
      unif = seed / ( 2^31 - 1 )

    The integer arithmetic never requires more than 32 bits,
    including a sign bit.

  Licensing:

    This code is distributed under the GNU LGPL license.

  Modified:

    19 August 2004

  Author:

    John Burkardt

  Reference:

    Paul Bratley, Bennett Fox, Linus Schrage,
    A Guide to Simulation,
    Second Edition,
    Springer, 1987,
    ISBN: 0387964673,
    LC: QA76.9.C65.B73.

    Bennett Fox,
    Algorithm 647:
    Implementation and Relative Efficiency of Quasirandom
    Sequence Generators,
    ACM Transactions on Mathematical Software,
    Volume 12, Number 4, December 1986, pages 362-376.

    Pierre L'Ecuyer,
    Random Number Generation,
    in Handbook of Simulation,
    edited by Jerry Banks,
    Wiley, 1998,
    ISBN: 0471134031,
    LC: T57.62.H37.

    Peter Lewis, Allen Goodman, James Miller,
    A Pseudo-Random Number Generator for the System/360,
    IBM Systems Journal,
    Volume 8, Number 2, 1969, pages 136-143.

  Parameters:

    Input, int N, the number of entries in the vector.

    Input/output, int *SEED, a seed for the random number generator.

    Output, double R8VEC_UNIFORM_01_NEW[N], the vector of pseudorandom values.
*/
{
  int i;
  int i4_huge = 2147483647;
  int k;
  double *r;

  if ( *seed == 0 )
  {
    fprintf ( stderr, "\n" );
    fprintf ( stderr, "R8VEC_UNIFORM_01_NEW - Fatal error!\n" );
    fprintf ( stderr, "  Input value of SEED = 0.\n" );
    exit ( 1 );
  }

  r = ( double * ) malloc ( n * sizeof ( double ) );

  for ( i = 0; i < n; i++ )
  {
    k = *seed / 127773;

    *seed = 16807 * ( *seed - k * 127773 ) - k * 2836;

    if ( *seed < 0 )
    {
      *seed = *seed + i4_huge;
    }

    r[i] = ( double ) ( *seed ) * 4.656612875E-10;
  }

  return r;
}
/******************************************************************************/

double *cosine_transform_data ( int n, double d[] )

/******************************************************************************/
/*
  Purpose:

    COSINE_TRANSFORM_DATA does a cosine transform on a vector of data.

  Licensing:

    This code is distributed under the GNU LGPL license.

  Modified:

    26 August 2015

  Author:

    John Burkardt

  Parameters:

    Input, integer N, the number of data points.

    Input, double D[N], the vector of data.

    Output, double COSINE_TRANSFORM_DATA[N], the transform coefficients.
*/
{
  double angle;
  double *c;
  int i;
  int j;
  const double r8_pi = 3.141592653589793;

  c = ( double * ) malloc ( n * sizeof ( double ) );

  for ( i = 0; i < n; i++ )
  {
    c[i] = 0.0;
    for ( j = 0; j < n; j++ )
    {
      angle = r8_pi * ( double ) ( i * ( 2 * j + 1 ) ) / ( double ) ( 2 * n );
      c[i] = c[i] + cos ( angle ) * d[j];
    }
    c[i] = c[i] * sqrt ( 2.0 / ( double ) ( n ) );
  }
  return c;
}
/******************************************************************************/

double *cosine_transform_inverse ( int n, double c[] )

/******************************************************************************/
/*
  Purpose:

    COSINE_TRANSFORM_INVERSE does an inverse cosine transform.

  Licensing:

    This code is distributed under the GNU LGPL license.

  Modified:

    27 August 2015

  Author:

    John Burkardt

  Parameters:

    Input, integer N, the number of data points.

    Input, double C[N], the vector of transform coefficients

    Output, double COSINE_TRANSFORM_INVERSE[N], the original data.
*/
{
  double angle;
  double *d;
  int i;
  int j;
  double r8_pi = 3.141592653589793;

  d = ( double * ) malloc ( n * sizeof ( double ) );

  for ( i = 0; i < n; i++ )
  {
    d[i] = c[0] / 2.0;
    for ( j = 1; j < n; j++ )
    {
      angle = r8_pi * ( double ) ( ( 2 * i + 1 ) * j ) / ( double ) ( 2 * n );
      d[i] = d[i] + cos ( angle ) * c[j];
    }
    d[i] = d[i] * sqrt ( 2.0 / ( double ) ( n ) );
  }
  return d;
}
/******************************************************************************/

void timestamp ( )

/******************************************************************************/
/*
  Purpose:

    TIMESTAMP prints the current YMDHMS date as a time stamp.

  Example:

    31 May 2001 09:45:54 AM

  Licensing:

    This code is distributed under the GNU LGPL license.

  Modified:

    24 September 2003

  Author:

    John Burkardt

  Parameters:

    None
*/
{
# define TIME_SIZE 40

  static char time_buffer[TIME_SIZE];
  const struct tm *tm;
  time_t now;

  now = time ( NULL );
  tm = localtime ( &now );

  strftime ( time_buffer, TIME_SIZE, "%d %B %Y %I:%M:%S %p", tm );

  fprintf ( stdout, "%s\n", time_buffer );

  return;
# undef TIME_SIZE
}
