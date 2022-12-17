double G = 6.6743 * pow(10, -11); //  m^3 kg^−1 s^−2

int KmToPx(float km) {
  return round(km / scale);
}
int KmToPx(double km) {
  return round((float)km / scale);
}
int PxToKm(float px) {
  return round(px * scale);
}


double dabs(double n) {
  if (n > 0) return n;
  else return - n;
}


// Je sais plus d'ou
double powD(double base, int exp) {
  if (exp == 0)
    return 1;
  double temp = powD(base, exp / 2);
  if (exp % 2 == 0)
    return temp * temp;
  else {
    if (exp > 0)
      return base * temp * temp;
    else
      return(temp * temp) / base; //negative exponent computation
  }
}


// https://gist.github.com/souserge/46ae077da08ae1ef7ffb52a5655c467b
public class PVectorD {

  public double x;


  public double y;


  public double z;

  /** Array so that this can be temporarily used in an array context */
  transient protected double[] array;



  public PVectorD() {
  }



  public PVectorD(double x, double y, double z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }


  public PVectorD(double x, double y) {
    this.x = x;
    this.y = y;
  }


  /**
   *( begin auto-generated from PVectorDD_set.xml )
   *
   *Sets the x, y, and z component of the vector using two or three separate
   *variables, the data from a PVectorDD, or the values from a double array.
   *
   *( end auto-generated )
   *
   *@webref PVectorDD:method
   *@param x the x component of the vector
   *@param y the y component of the vector
   *@param z the z component of the vector
   *@brief Set the components of the vector
   */
  public PVectorD set(double x, double y, double z) {
    this.x = x;
    this.y = y;
    this.z = z;
    return this;
  }


  /**
   *@param x the x component of the vector
   *@param y the y component of the vector
   */
  public PVectorD set(double x, double y) {
    this.x = x;
    this.y = y;
    this.z = 0;
    return this;
  }


  /**
   *@param v any variable of type PVectorDD
   */
  public PVectorD set(PVectorD v) {
    x = v.x;
    y = v.y;
    z = v.z;
    return this;
  }


  /**
   *Set the x, y (and maybe z) coordinates using a double[] array as the source.
   *@param source array to copy from
   */
  public PVectorD set(double[] source) {
    if (source.length >= 2) {
      x = source[0];
      y = source[1];
    }
    if (source.length >= 3) {
      z = source[2];
    } else {
      z = 0;
    }
    return this;
  }


  /**
   *( begin auto-generated from PVectorD_copy.xml )
   *
   *Gets a copy of the vector, returns a PVectorD object.
   *
   *( end auto-generated )
   *
   *@webref PVectorD:method
   *@usage web_application
   *@brief Get a copy of the vector
   */
  public PVectorD copy() {
    return new PVectorD(x, y, z);
  }


  @Deprecated
    public PVectorD get() {
    return copy();
  }


  /**
   *@param target
   */
  public double[] get(double[] target) {
    if (target == null) {
      return new double[] {x, y, z };
    }
    if (target.length >= 2) {
      target[0] = x;
      target[1] = y;
    }
    if (target.length >= 3) {
      target[2] = z;
    }
    return target;
  }


  /**
   *( begin auto - generated fromPVectorD_mag.xml)
   *
   *Calculates the magnitude(length) of the vector and returns the result
   *as a double(this is simply theequation <em>sqrt(x * x + y * y + z * z)</ em>.)
   *
   *( end auto - generated)
   *
   *@webref PVectorD : method
   *@usage web_application
   *@brief Calculate the magnitude of the vector
   *@return magnitude(length) of the vector
   *@see PVectorD#magSq()
   */
  public double mag() {
    return(double) Math.sqrt(x * x + y * y + z * z);
  }


  /**
   *( begin auto - generated from PVectorD_mag.xml)
   *
   *Calculates the squared magnitude of the vector and returns the result
   *as a double(this is simply theequation <em>(x * x + y * y + z * z)</ em>.)
   *Faster if the real length is not required in the
   *case of comparing vectors, etc.
   *
   *( end auto - generated)
   *
   *@webref PVectorD : method
   *@usage web_application
   *@brief Calculate the magnitude of the vector, squared
   *@return squared magnitude of the vector
   *@see PVectorD#mag()
   */
  public double magSq() {
    return(x * x + y * y + z * z);
  }


  /**
   *( begin auto - generated from PVectorD_add.xml)
   *
   *Adds x, y, and z components to a vector, adds one vector to another, or
   *adds two independent vectors together.The version of the method that
   *adds two vectors together is a static method and returns a PVectorD, the
   *others have no return value -- they actdirectly on the vector.See the
   *examples for more context.
   *
   *( end auto - generated)
   *
   *@webref PVectorD : method
   *@usage web_application
   *@param v the vector to be added
   *@brief Adds x, y, and z components to a vector, one vector to another, or two independent vectors
   */
  public PVectorD add(PVectorD v) {
    x += v.x;
    y += v.y;
    z += v.z;
    return this;
  }


  /**
   *@param x x component of the vector
   *@param y y component of the vector
   */
  public PVectorD add(double x, double y) {
    this.x += x;
    this.y += y;
    return this;
  }


  /**
   *@param z z component of the vector
   */
  public PVectorD add(double x, double y, double z) {
    this.x += x;
    this.y += y;
    this.z += z;
    return this;
  }


  /**
   *( begin auto - generated from PVectorD_sub.xml)
   *
   *Subtracts x, y, and z components from a vector,subtracts one vector
   *from another, or subtracts two independent vectors.The version of the
   *method that subtracts two vectors is a static method and returns a
   *PVectorD, the others have no return value -- they act directly on the
   *vector.See the examples for more context.
   *
   *( end auto - generated)
   *
   *@webref PVectorD : method
   *@usage web_application
   *@param v any variable of type PVectorD
   *@brief Subtract x, y, and z components from a vector, one vector from another, or two independent vectors
   */
  public PVectorD sub(PVectorD v) {
    x -= v.x;
    y -= v.y;
    z -= v.z;
    return this;
  }


  /**
   *@param x the x component of the vector
   *@param y the y component of the vector
   */
  public PVectorD sub(double x, double y) {
    this.x -= x;
    this.y -= y;
    return this;
  }


  /**
   *@param z the z component of the vector
   */
  public PVectorD sub(double x, double y, double z) {
    this.x -= x;
    this.y -= y;
    this.z -= z;
    return this;
  }



  /**
   *( begin auto - generated from PVectorD_mult.xml)
   *
   *Multiplies a vector by a scalar or multiplies one vector byanother.
   *
   *( end auto - generated)
   *
   *@webref PVectorD : method
   *@usage web_application
   *@brief Multiply a vector by a scalar
   *@param n the number to multiply with the vector
   */
  public PVectorD mult(double n) {
    x *=  n;
    y *=  n;
    z *=  n;
    return this;
  }


  /**
   *( begin auto - generated from PVectorD_div.xml)
   *
   *Divides a vector by a scalar or divides one vector by another.
   *
   *( end auto-generated)
   *
   *@webref PVectorD : method
   *@usage web_application
   *@brief Divide a vector by a scalar
   *@param n the number by which to divide the vector
   */
  public PVectorD div(double n) {
    x /=  n;
    y /=  n;
    z /=  n;
    return this;
  }


  /**
   *( begin auto - generated from PVectorD_dist.xml)
   *
   *Calculates the Euclidean distance between two points(considering a
   *point as a vector object).
   *
   *( end auto-generated)
   *
   *@webref PVectorD : method
   *@usage web_application
   *@param v the x, y, and z coordinates of a PVectorD
   *@brief Calculate the distance between two points
   */
  public double dist(PVectorD v) {
    double dx = x - v.x;
    double dy = y - v.y;
    double dz = z - v.z;
    return(double) Math.sqrt(dx * dx + dy * dy + dz * dz);
  }


  /**
   *( begin auto-generated from PVectorD_dot.xml)
   *
   *Calculates the dot product of two vectors.
   *
   *( end auto-generated)
   *
   *@webref PVectorD : method
   *@usage web_application
   *@param v any variable of type PVectorD
   *@return the dot product
   *@brief Calculate the dot product of two vectors
   */
  public double dot(PVectorD v) {
    return x * v.x + y * v.y + z * v.z;
  }


  /**
   *@param x x component of the vector
   *@param y y component of the vector
   *@param z z component of the vector
   */
  public double dot(double x, double y, double z) {
    return this.x * x + this.y * y + this.z * z;
  }


  /**
   *( begin auto-generated from PVectorD_cross.xml)
   *
   *Calculates and returns a vector composed of the cross product between
   *two vectors.
   *
   *( end auto-generated)
   *
   *@webref PVectorD : method
   *@param v the vector to calculate the cross product
   *@brief Calculate and return the cross product
   */
  public PVectorD cross(PVectorD v) {
    return cross(v, null);
  }


  /**
   *@param v any variable of type PVectorD
   *@param target PVectorD to store the result
   */
  public PVectorD cross(PVectorD v, PVectorD target) {
    double crossX = y * v.z - v.y * z;
    double crossY = z * v.x - v.z * x;
    double crossZ = x * v.y - v.x * y;

    if (target == null) {
      target = new PVectorD(crossX, crossY, crossZ);
    } else {
      target.set(crossX, crossY, crossZ);
    }
    return target;
  }

  /**
   *( begin auto-generated from PVectorD_normalize.xml)
   *
   *Normalize the vector to length 1(make it a unit vector).
   *
   *( end auto-generated)
   *
   *@webref PVectorD:method
   *@usage web_application
   *@brief Normalize the vector to a length of 1
   */
  public PVectorD normalize() {
    double m = mag();
    if (m != 0 && m != 1) {
      div(m);
    }
    return this;
  }


  /**
   *@param target Set to null to create a new vector
   *@return a new vector(if target was null), or target
   */
  public PVectorD normalize(PVectorD target) {
    if (target == null) {
      target = new PVectorD();
    }
    double m = mag();
    if (m > 0) {
      target.set(x / m, y / m, z / m);
    } else {
      target.set(x, y, z);
    }
    return target;
  }


  /**
   *( begin auto-generated from PVectorD_limit.xml)
   *
   *Limit the magnitude of this vector to the value used for the < b > max </  b > parameter.
   *
   *( end auto-generated )
   *
   *@webref PVectorD:method
   *@usage web_application
   *@param max the maximum magnitude for the vector
   *@brief Limit the magnitude of the vector
   */
  public PVectorD limit(double max) {
    if (magSq() > max * max) {
      normalize();
      mult(max);
    }
    return this;
  }


  /**
   *( begin auto-generated from PVectorD_setMag.xml)
   *
   *Set the magnitude of this vector to the value used for the < b > len </  b > parameter.
   *
   *( end auto-generated )
   *
   *@webref PVectorD:method
   *@usage web_application
   *@param len the new length for this vector
   *@brief Set the magnitude of the vector
   */
  public PVectorD setMag(double len) {
    normalize();
    mult(len);
    return this;
  }


  /**
   *Sets the magnitude of this vector, storing the result in another vector.
   *@param target Set to null to create a new vector
   *@param len the new length for the new vector
   *@return a new vector (if target was null), or target
   */
  public PVectorD setMag(PVectorD target, double len) {
    target = normalize(target);
    target.mult(len);
    return target;
  }


  /**
   *( begin auto-generated from PVectorD_setMag.xml)
   *
   *Calculate the angle of rotation for this vector(only 2D vectors)
   *
   *( end auto-generated )
   *
   *@webref PVectorD:method
   *@usage web_application
   *@return the angle of rotation
   *@brief Calculate the angle of rotation for this vector
   */
  public double heading() {
    double angle = (double) Math.atan2(y, x);
    return angle;
  }


  @Deprecated
    public double heading2D() {
    return heading();
  }


  /**
   *( begin auto-generated from PVectorD_rotate.xml)
   *
   *Rotate the vector by an angle(only 2D vectors), magnitude remains the same
   *
   *( end auto-generated )
   *
   *@webref PVectorD:method
   *@usage web_application
   *@brief Rotate the vector by an angle(2D only)
   *@param theta the angle of rotation
   */
  public PVectorD rotate(double theta) {
    double temp = x;
    // Might need to check for rounding errors like with angleBetween function?
    x = x * Math.cos(theta) - y * Math.sin(theta);
    y = temp * Math.sin(theta) + y * Math.cos(theta);
    return this;
  }


  @Override
    public String toString() {
    return "[ " + x + ", " + y + ", " + z + " ]";
  }


  /**
   *( begin auto-generated from PVectorD_array.xml)
   *
   *Return a representation of this vector as a double array.This is only
   *for temporary use. If used in any other fashion, the contents should be
   *copied by using the <b>PVectorD.get()</ b> method to copy into your own array.
   *
   *( end auto-generated )
   *
   *@webref PVectorD:method
   *@usage: web_application
   *@brief Return a representation of the vector as a double array
   */
  public double[] array() {
    if (array == null) {
      array = new double[3];
    }
    array[0] = x;
    array[1] = y;
    array[2] = z;
    return array;
  }


  @Override
    public boolean equals(Object obj) {
    if (!(obj instanceof PVectorD)) {
      return false;
    }
    final PVectorD p = (PVectorD) obj;
    return x == p.x && y == p.y && z == p.z;
  }


  @Override
    public int hashCode() {
    int result = 1;
    result = 31 * result + Double.hashCode(x);
    result = 31 * result + Double.hashCode(y);
    result = 31 * result + Double.hashCode(z);
    return result;
  }
}
