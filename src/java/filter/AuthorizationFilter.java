/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author admin
 */
@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {"/*"})
public class AuthorizationFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    /**
     *
     */
    public AuthorizationFilter() {
    }

    /**
     *
     * @param servletRequest
     * @param servletResponse
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getServletPath();

        if (url.startsWith("/admin")) {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            //Check user login or not
            if (acc != null) {
                if (acc.getAuthor_id() == 0) {
                    chain.doFilter(servletRequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/404-error.jsp");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/404-error.jsp");
            }
        } else if (url.startsWith("/doctor-page")) {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            //Check user login or not
            if (acc != null) {
                if (acc.getAuthor_id() == 1) {
                    chain.doFilter(servletRequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/404-error.jsp");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/404-error.jsp");
            }
        } else {
            chain.doFilter(servletRequest, servletResponse);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     *
     * @return
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {
    }

    /**
     * Init method for this filter
     *
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthorizationFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthorizationFilter()");
        }
        StringBuilder sb = new StringBuilder("AuthorizationFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    /**
     *
     * @param t
     * @return
     */
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (IOException ex) {
            System.out.println(ex);
        }
        return stackTrace;
    }

    /**
     *
     * @param msg
     */
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
