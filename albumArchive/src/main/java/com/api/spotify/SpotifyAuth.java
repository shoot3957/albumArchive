package com.api.spotify;



public class SpotifyAuth {
//    private static final String CLIENT_ID = "d5517918022d4e7a8abdabda23d9da2c";
//    private static final String CLIENT_SECRET = "bb4754dac36148d2916e1468ad9804ce";
//    private static final String REDIRECT_URI = "http://localhost:8888";
//    private static final String SCOPE = "streaming user-read-playback-state user-modify-playback-state user-read-email user-read-private";
//    private static final OkHttpClient client = new OkHttpClient();
//    private static String accessToken;
//
//    public static String getAuthUrl() {
//        String authUrl = "https://accounts.spotify.com/authorize" +
//                "?client_id=" + CLIENT_ID +
//                "&response_type=code" +
//                "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, StandardCharsets.UTF_8) +
//                "&scope=" + URLEncoder.encode(SCOPE, StandardCharsets.UTF_8);
//        return authUrl;
//    }
//
//    public static String getAccessToken(String code) throws IOException {
//        String authString = CLIENT_ID + ":" + CLIENT_SECRET;
//        String authBase64 = Base64.getEncoder().encodeToString(authString.getBytes());
//
//        RequestBody formBody = new FormBody.Builder()
//                .add("grant_type", "authorization_code")
//                .add("code", code)
//                .add("redirect_uri", REDIRECT_URI)
//                .build();
//
//        Request request = new Request.Builder()
//                .url("https://accounts.spotify.com/api/token")
//                .post(formBody)
//                .addHeader("Authorization", "Basic " + authBase64)
//                .addHeader("Content-Type", "application/x-www-form-urlencoded")
//                .build();
//
//        try (Response response = client.newCall(request).execute()) {
//            if (!response.isSuccessful()) {
//                String errorBody = response.body().string();
//                throw new IOException("Unexpected code " + response.code() + ": " + errorBody);
//            }
//            String tokenResponse = response.body().string();
//            accessToken = extractAccessToken(tokenResponse);
//            return tokenResponse;
//        }
//    }
//
//    private static String extractAccessToken(String tokenResponse) {
//        int start = tokenResponse.indexOf("access_token") + 14;
//        int end = tokenResponse.indexOf("\"", start);
//        return tokenResponse.substring(start, end);
//    }
//
//    public static String refreshAccessToken(String refreshToken) throws IOException {
//        String authString = CLIENT_ID + ":" + CLIENT_SECRET;
//        String authBase64 = Base64.getEncoder().encodeToString(authString.getBytes());
//
//        RequestBody formBody = new FormBody.Builder()
//                .add("grant_type", "refresh_token")
//                .add("refresh_token", refreshToken)
//                .build();
//
//        Request request = new Request.Builder()
//                .url("https://accounts.spotify.com/api/token")
//                .post(formBody)
//                .addHeader("Authorization", "Basic " + authBase64)
//                .addHeader("Content-Type", "application/x-www-form-urlencoded")
//                .build();
//
//        try (Response response = client.newCall(request).execute()) {
//            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);
//            String tokenResponse = response.body().string();
//            accessToken = extractAccessToken(tokenResponse);
//            return tokenResponse;
//        }
//    }
//
//    public static String getAccessToken() {
//        return accessToken;
//    }
//
//    public static class CallbackServer {
//        public static String authCode;
//
//        public static void startServer() throws IOException {
//            HttpServer server = HttpServer.create(new InetSocketAddress(8888), 0);
//            server.createContext("/callback", exchange -> {
//                String query = exchange.getRequestURI().getQuery();
//                authCode = query.split("code=")[1].split("&")[0];
//                String response = "인증 완료! 브라우저를 닫아도 됩니다.";
//                exchange.sendResponseHeaders(200, response.length());
//                OutputStream os = exchange.getResponseBody();
//                os.write(response.getBytes());
//                os.close();
//                server.stop(0);
//            });
//            server.start();
//            System.out.println("서버 시작: http://localhost:8888");
//        }
//    }
//
//    public static void main(String[] args) throws IOException, InterruptedException {
//        System.out.println("1. 아래 URL을 브라우저에 붙여넣어 인증하세요:");
//        System.out.println(getAuthUrl());
//        CallbackServer.startServer();
//
//        while (CallbackServer.authCode == null) {
//            Thread.sleep(1000);
//        }
//
//        String code = CallbackServer.authCode;
//        System.out.println("받은 인증 코드: " + code);
//        String tokenResponse = getAccessToken(code);
//        System.out.println("Token Response: " + tokenResponse);
//
//        if (accessToken != null) {
//            System.out.println("현재 액세스 토큰: " + accessToken);
//        } else {
//            System.out.println("액세스 토큰 발급 실패");
//        }
//    }
}