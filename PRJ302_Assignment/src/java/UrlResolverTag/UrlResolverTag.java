package UrlResolverTag;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;

public class UrlResolverTag extends TagSupport {
    private String target;

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public int doStartTag() throws JspException {
        try {
            HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
            String resolvedPath = resolveRelativePath(request, target);
            JspWriter out = pageContext.getOut();
            out.print("<link rel=\"stylesheet\" href=\"" + resolvedPath + "\">");
        } catch (Exception e) {
            throw new JspException("Error in UrlResolverTag", e);
        }
        return SKIP_BODY;
    }

    private String resolveRelativePath(HttpServletRequest request, String target) {
        // Ensure target starts with "/"
        if (!target.startsWith("/")) {
            throw new IllegalArgumentException("Target must start with /");
        }

        // Get the context path (e.g., "/yourAppName")
        String contextPath = request.getContextPath();

        // Return the target as an absolute path with the context path
        return contextPath + target;
    }
}