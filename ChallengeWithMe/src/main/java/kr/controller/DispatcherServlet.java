package kr.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet {
    private static final long serialVersionUID = 4068304416616773907L;
    private Map<String, Action> commandMap = new HashMap<>();
    private String view_path;

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("[DispatcherServlet] Initializing servlet...");

        String propsPath = config.getInitParameter("propertiesPath");
        view_path = config.getInitParameter("viewPath");

        if (propsPath == null) {
            throw new ServletException("propertiesPath init parameter is not set in web.xml");
        }

        String[] propsArray = propsPath.split(",");
        Properties pr = new Properties();

        for (String props : propsArray) {
            FileInputStream fis = null;
            try {
                String path = config.getServletContext().getRealPath(props);
                File file = new File(path);
                if (!file.exists() || !file.isFile()) {
                    throw new ServletException("Properties file not found at: " + path);
                }

                fis = new FileInputStream(file);
                pr.load(fis);
                System.out.println("[DispatcherServlet] Loaded properties from: " + path);
            } catch (IOException e) {
                throw new ServletException("Error loading properties file: " + props, e);
            } finally {
                if (fis != null) try { fis.close(); } catch (IOException ex) {}
            }
        }

        Iterator<?> keyIter = pr.keySet().iterator();
        while (keyIter.hasNext()) {
            String command = (String) keyIter.next();
            String className = pr.getProperty(command);

            try {
                Class<?> commandClass = Class.forName(className);
                Object commandInstance = commandClass.getDeclaredConstructor().newInstance();
                commandMap.put(command, (Action) commandInstance);
                System.out.println("[DispatcherServlet] Mapped command: " + command + " -> " + className);
            } catch (Exception e) {
                throw new ServletException("Error initializing command class for: " + command, e);
            }
        }

        // 로그 추가
        System.out.println("[DispatcherServlet] Command Map Initialized:");
        for (Map.Entry<String, Action> entry : commandMap.entrySet()) {
            System.out.println(" - Command: " + entry.getKey() + " -> " + entry.getValue().getClass().getName());
        }
        System.out.println("-----------------------------");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[DispatcherServlet] Received GET request: " + request.getRequestURI());
        requestPro(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[DispatcherServlet] Received POST request: " + request.getRequestURI());
        requestPro(request, response);
    }

    private void requestPro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String view = null;
        Action com = null;

        String command = request.getRequestURI();
        if (command.indexOf(request.getContextPath()) == 0) {
            command = command.substring(request.getContextPath().length());
        }

        System.out.println("[DispatcherServlet] Processing command: " + command);
        com = commandMap.get(command);

        if (com == null) {
            System.err.println("[DispatcherServlet] No mapping found for command: " + command);
            throw new ServletException("No mapping found for command: " + command);
        }

        try {
            System.out.println("[DispatcherServlet] Executing action for command: " + command);
            view = com.execute(request, response);
            System.out.println("[DispatcherServlet] Action executed successfully. View: " + view);
        } catch (Exception e) {
            System.err.println("[DispatcherServlet] Error executing action for command: " + command);
            e.printStackTrace();
            throw new ServletException("Error executing action for command: " + command, e);
        }

        if (view.startsWith("redirect:")) {
            view = view.substring("redirect:".length());
            System.out.println("[DispatcherServlet] Redirecting to: " + view);
            response.sendRedirect(request.getContextPath() + view);
        } else {
            String fullPath = (view_path == null ? "" : view_path) + view;
            System.out.println("[DispatcherServlet] Forwarding to view: " + fullPath);
            RequestDispatcher dispatcher = request.getRequestDispatcher(fullPath);
            dispatcher.forward(request, response);
        }
    }
}
