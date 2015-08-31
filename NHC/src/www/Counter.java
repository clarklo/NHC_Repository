package www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �y�q�έpJavaBean</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import java.sql.*;
import com.web.database.*;
import util.GetDate;

public class Counter {
	// �s��
	private int id;

	// �έp�ɶ�
	private String startdate;

	// �`�X�ݶq
	private int totalcount;

	// �W��X�ݶq
	private int lastmonthcount;

	// ����ɶ�
	private String thismonth;

	// ����X�ݶq
	private int thismonthcount;

	// �Q��X�ݶq
	private int yestodaycount;

	// ���Ѯɶ�
	private String today;

	// ����X�ݶq
	private int todaycount;

	// �ѳ̤j�X�ݶq�ɶ�
	private String maxday;

	// �ѳ̤j�X�ݶq
	private int maxdaycount;

	// ��̤j�X�ݶq�ɶ�
	private String maxmonth;

	// ��̤j�X�ݶq
	private int maxmonthcount;

	public Counter() {
		id = 1;
		startdate = GetDate.getStringDateShort();
		totalcount = 0;
		lastmonthcount = 0;
		thismonth = (GetDate.getStringDateShort()).substring(0, 7);
		thismonthcount = 0;
		yestodaycount = 0;
		today = GetDate.getStringDateShort();
		todaycount = 0;
		maxday = GetDate.getStringDateShort();
		maxdaycount = 0;
		maxmonth = (GetDate.getStringDateShort()).substring(0, 7);
		maxmonthcount = 0;
	}

	/**
	 * ��l�ƭp�ƾ�
	 */
	public void init() throws ClassNotFoundException, SQLException {
		Operation op = new Operation();
		String sql = "SELECT * FROM cms_stat";
		ResultSet rs = null;

		try {
			rs = op.query(sql);
			if (!rs.next()) {
				sql = "INSERT INTO cms_stat(cms_stat_id,cms_stat_time, cms_stat_totalnum, cms_stat_lastmonthnum, cms_stat_thismonthtime, cms_stat_thismonthnum, cms_stat_lastdaynum, cms_stat_todaytime, cms_stat_todaynum,cms_stat_monthmaxtime,cms_stat_monthmaxnum,cms_stat_daymaxtime,cms_stat_daymaxnum) "
						+ "VALUES(1,'"
						+ startdate
						+ "',0,0,'"
						+ thismonth
						+ "',0,0,'"
						+ today
						+ "',0,'"
						+ maxmonth
						+ "',0,'"
						+ maxday + "',0)";
				op.update(sql);
			}
		} catch (Exception e) {
			System.err.print("counter init error:" + e.getMessage());
		} finally {
			op.closestmt();
			op.closeconn();
		}
	}

	/**
	 * �p�ƾ��[1
	 */
	public void add() throws ClassNotFoundException, SQLException {
		Operation op = new Operation();
		String sql = "SELECT * FROM cms_stat";

		try {
			init();

			sql = "UPDATE cms_stat SET cms_stat_todaynum = cms_stat_todaynum + 1, cms_stat_totalnum = cms_stat_totalnum+1, cms_stat_thismonthnum=cms_stat_thismonthnum+1 WHERE cms_stat_id=1";
			op.update(sql);
		} catch (Exception e) {
			System.err.print("counter add error:" + e.getMessage());
		} finally {
			op.closeconn();
		}
	}

	/**
	 * ��s�p�ƾ�
	 */
	public void update() throws ClassNotFoundException, SQLException {
		Operation op = new Operation();
		String sql = "";
		ResultSet rs = null;
		String thismonth = "", today = "";

		try {
			add();
			sql = "SELECT * FROM cms_stat WHERE cms_stat_id=1";
			rs = op.query(sql);

			if (rs.next()) {
				thismonth = rs.getString("cms_stat_thismonthtime");
				today = rs.getString("cms_stat_todaytime");
				String td = GetDate.getStringDateShort();
				System.out.println("today:"+today);
				System.out.println("GetDate.getStringDateShort():"+GetDate.getStringDateShort());
				String tm = td.substring(0, 7);
				if (!today.equals(td)) {
					sql = "UPDATE cms_stat SET cms_stat_daymaxtime=cms_stat_todaytime, cms_stat_daymaxnum=cms_stat_todaynum WHERE cms_stat_todaynum > cms_stat_daymaxnum AND cms_stat_id=1";
					op.update(sql);
					sql = "UPDATE cms_stat SET cms_stat_lastdaynum=cms_stat_todaynum,cms_stat_todaytime='"
							+ td
							+ "',cms_stat_todaynum=1  where cms_stat_todaytime <'"
							+ td + "' AND cms_stat_id=1";
					op.update(sql);
				}

				if (!thismonth.equals(tm)) {
					sql = "UPDATE cms_stat SET cms_stat_monthmaxtime=cms_stat_thismonthtime, cms_stat_lastmonthnum=cms_stat_thismonthnum, cms_stat_monthmaxnum=cms_stat_thismonthnum where cms_stat_thismonthnum > cms_stat_monthmaxnum AND cms_stat_id=1";
					op.update(sql);
					sql = "UPDATE cms_stat SET cms_stat_thismonthtime='"
							+ tm
							+ "',cms_stat_thismonthnum=1  WHERE cms_stat_thismonthtime <'"
							+ tm + "' AND cms_stat_id=1";
					op.update(sql);
				}

			}
		} catch (Exception e) {
			System.err.print("counter add error:" + e.getMessage());
		} finally {
			op.closestmt();
			op.closeconn();
		}
	}
}