/**
 * 
 */
package com.javapackage;

import static org.junit.Assert.*;

import org.junit.Test;

/**
 * @author chiragmakkar
 *
 */
public class JavaTest {

	
	  @Test public void testOdd() { JavaRun test = new JavaRun();
	  assertEquals("20 is a odd number", false, test.isEvenNumber(21)); }
	  
	  @Test public void testEven(){ JavaRun meo = new JavaRun();
	  assertEquals("10 is a even number", true, meo.isEvenNumber(10)); }
	 
}
