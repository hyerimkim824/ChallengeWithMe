package kr.challenge.action;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import kr.challenge.dao.ChallengeDAO;

public class DailyTask {
    public static void main(String[] args) {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        Runnable task = () -> {
            ChallengeDAO ch_dao = ChallengeDAO.getInstance();
            try {
				ch_dao.updateStatus();
			} catch (Exception e) {
				e.printStackTrace();
			}
        };

        // 현재 시간과 다음 정시(00:00:00)까지의 시간 계산
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime nextRun = now.plusDays(1).truncatedTo(ChronoUnit.DAYS);
        long initialDelay = ChronoUnit.MILLIS.between(now, nextRun);

        // 매일 정시에 실행
        scheduler.scheduleAtFixedRate(task, initialDelay, 24 * 60 * 60 * 1000, TimeUnit.MILLISECONDS);
    }
}