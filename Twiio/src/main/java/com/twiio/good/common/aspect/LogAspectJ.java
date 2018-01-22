package com.twiio.good.common.aspect;

import org.aspectj.lang.ProceedingJoinPoint;

/*
 * FileName : PojoAspectJ.java
 *	:: XML ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ aspect ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½   
  */
public class LogAspectJ {

	///Constructor
	public LogAspectJ() {
		System.out.println("\nCommon :: "+this.getClass()+"\n");
	}
	
	//Around  Advice
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
			
		System.out.println("");
		System.out.println("[Around before] Å¸¦°´Ã¼.¸Þ¼­µå :"+
													joinPoint.getTarget().getClass().getName() +"."+
													joinPoint.getSignature().getName());
		if(joinPoint.getArgs().length !=0){
			System.out.println("[Around before]method¿¡ Àü´ÞµÇ´Â ÀÎÀÚ : "+ joinPoint.getArgs()[0]);
		}
		//==> Å¸°Ù °´Ã¼ÀÇ Method ¸¦ È£Ãâ ÇÏ´Â ºÎºÐ 
		Object obj = joinPoint.proceed();

		System.out.println("[Around after] Å¸°Ù °´Ã¼return value  : "+obj);
		System.out.println("");
		
		return obj;
	}
	
}//end of class