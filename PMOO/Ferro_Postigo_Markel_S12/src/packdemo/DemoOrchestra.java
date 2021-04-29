package packdemo;

import packorchestra.Orchestra;
import packmusicians.*;

public class DemoOrchestra {
	
	private static Orchestra o;
	private static Director d;
	private static Pianist p;
	private static Soprano si;
	private static Soprano sn;
	private static Tenor te;
	private static Trumpeter tr;
	private static Trumpeter tri;
	
	public static void main(String[] args) {
		o = new Orchestra("Marquestra");
		d = new Director("Dir");
		p = new Pianist("per");
		si = new Soprano("Sorpre", true);
		sn = new Soprano("Sonac", false);
		te = new Tenor("Ter");
		tr = new Trumpeter("Trump");
		tri = new Trumpeter("Tri");
		
		d.setAntiguedad(2);
		
		System.out.println(o.hire(p));
		System.out.println(o.hire(p));
		System.out.println(o.hire(si));
		System.out.println(o.hire(sn));
		System.out.println(o.hire(d));
		System.out.println(o.hire(te));
		System.out.println(o.hire(tr));
		System.out.println(o.hire(tri));
		System.out.println(o.hire(d));
		
		
		System.out.println("");
		
		System.out.println(o.act());
		
		// System.out.println(o.toString());
		
		System.out.println("The fee of the orchestra is: " + o.getFee() + "€.");
	}

}
