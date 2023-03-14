package com.xiaohai.admin.confing.aspectj;

import com.xiaohai.common.annotation.Log;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * Log注解日志操作
 * 例如：@Log(title = "用户模块", businessType = BusinessType.UPDATE)
 * @author wangchenghai
 * @date 2022/3/20 9:36
 */
@Aspect
@Component
@Slf4j
@Order(1)
public class LogOperationAop {

    /**
     * 定义了一个切入点
     * execution(* com.xiaohai.*.controller..*.*(..))
     * @annotation(controllerLog)
     */
    @Pointcut(value = "@annotation(controllerLog)")
    public void methodAspect(Log controllerLog) {
    }

    @Before(value = "methodAspect(controllerLog)", argNames = "joinPoint,controllerLog")
    public void outInfo(JoinPoint joinPoint,Log controllerLog) {
        // 接收到请求，记录请求内容
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        log.info("【注解：Before】浏览器输入的网址=URL : " + request.getRequestURL().toString());
        log.info("【注解：Before】HTTP_METHOD : " + request.getMethod());
        log.info("【注解：Before】IP : " + request.getRemoteAddr());
        log.info("【注解：Before】执行的业务方法名=CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        log.info("【注解：Before】业务方法获得的参数=ARGS : " + Arrays.toString(joinPoint.getArgs()));
    }

    /**
     * 后置最终通知,final增强，不管是抛出异常或者正常退出都会执行
     *
     * @param
     * @author wangchenghai
     * @date 2022/3/20 10:26
     */

    @After(value = "methodAspect(controllerLog)", argNames = "controllerLog")
    public void after(Log controllerLog) {
        log.info("【注解：After】方法最后执行.....");
    }

    /**
     * 后置返回通知
     *
     * @param
     * @author wangchenghai
     * @date 2022/3/20 10:23
     */

    @AfterReturning(returning = "ret", value = "methodAspect(controllerLog)", argNames = "ret,controllerLog")
    public void afterReturning(Object ret,Log controllerLog){
        // 处理完请求，返回内容
        log.info("【注解：AfterReturning】这个会在切面最后的最后打印，方法的返回值 : " + ret);
    }

    /**
     * 后置异常通知
     *
     * @param
     * @author wangchenghai
     * @date 2022/3/20 10:25
     */

    @AfterThrowing(value = "methodAspect(controllerLog)", throwing = "e", argNames = "joinPoint,controllerLog,e")
    public void afterThrowing(JoinPoint joinPoint,Log controllerLog, Exception e) {
        log.info("【注解：AfterThrowing】方法异常时执行....."+e.getMessage());
    }

    /**
     * 环绕通知,环绕增强，相当于MethodInterceptor
     *
     * @param pjp
     * @return java.lang.Object
     * @author wangchenghai
     * @date 2022/3/20 10:26
     */

    @Around(value = "methodAspect(controllerLog)", argNames = "pjp,controllerLog")
    public Object around(ProceedingJoinPoint pjp,Log controllerLog){
        log.info("【注解：Around . 环绕前】方法环绕start.....");
        Object o=null;
        Throwable ex =null;
        try {
            //如果不执行这句，会不执行切面的Before方法及controller的业务方法
             o =  pjp.proceed();
            log.info("【注解：Around. 环绕后】方法环绕proceed，结果是 :" + o);
        } catch (Throwable e) {
            ex=e;
        }finally {
            handleLog(pjp,ex,o,controllerLog);
        }
        return o;
    }


    protected void handleLog(final JoinPoint joinPoint, final Throwable e, Object jsonResult,Log controllerLog) {
        try {
            // 接收到请求，记录请求内容
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = attributes.getRequest();
//            TokenData tokenData=token();
//            // 记录下请求内容
//            Blog blog = new Blog();
//            blog.setMethod(joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
//            blog.setOperUrl(request.getRequestURL().toString());
//            blog.setOperIp(request.getRemoteAddr());
//            blog.setRequestMethod(request.getMethod());
//            blog.setOperParam(new JSONArray(joinPoint.getArgs()).toString());
//            //异常
//            if (e != null) {
//                blog.setStatus(1);
//                blog.setErrorMsg(StringUtils.substring(e.getMessage(), 0, 2000));
//            }else{
//                blog.setStatus(0);
//            }
//            //返回参数
//            if (jsonResult != null) {
//                blog.setJsonResult(StringUtils.substring(new JSONObject(jsonResult).toString(), 0, 2000));
//            }
//            blog.setDelFlag(0);
//            blog.setCreateBy(tokenData.getName());
//            blog.setCreateTime(new Date());
//            blogService.add(blog);
        } catch (Exception exp) {
            // 记录本地异常日志
            log.error("==前置通知异常==");
            log.error("异常信息:{}", exp.getMessage());
            exp.printStackTrace();
        }
    }
}